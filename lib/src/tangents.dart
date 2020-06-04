import "dart:typed_data";

import "../CubeLib.dart";

abstract class TangentBuilder {
    static void computeTangents(Mesh mesh) {
        final List<dynamic> index = mesh.getIndices();
        final List<dynamic> positions = mesh.getVerticesData(VertexBuffer.PositionKind);
        final List<dynamic> normals = mesh.getVerticesData(VertexBuffer.NormalKind);
        final List<dynamic> uvs = mesh.getVerticesData(VertexBuffer.UVKind);

        if (index == null || positions == null || normals == null || uvs == null) {
            throw ArgumentError("Tangent computation failed, mesh is missing a required buffer");
        }

        final int nVertices = positions.length ~/ 3;

        List<dynamic> tangents = mesh.getVerticesData(VertexBuffer.TangentKind);
        tangents ??= new Float32List(4 * nVertices);

        final List<Vector3> tan1 = new List<Vector3>.generate(nVertices, (int i) => new Vector3());
        final List<Vector3> tan2 = new List<Vector3>.generate(nVertices, (int i) => new Vector3());

        final Vector3 vA = new Vector3();
        final Vector3 vB = new Vector3();
        final Vector3 vC = new Vector3();

        final Vector2 uvA = new Vector2();
        final Vector2 uvB = new Vector2();
        final Vector2 uvC = new Vector2();

        final Vector3 sdir = new Vector3();
        final Vector3 tdir = new Vector3();

        void handleTriangle(int a, int b, int c) {
            vA.set(positions[a*3], positions[a*3+1], positions[a*3+2]);
            vB.set(positions[b*3], positions[b*3+1], positions[b*3+2]);
            vC.set(positions[c*3], positions[c*3+1], positions[c*3+2]);

            uvA.set(uvs[a*2], uvs[a*2+1]);
            uvB.set(uvs[b*2], uvs[b*2+1]);
            uvC.set(uvs[c*2], uvs[c*2+1]);

            vB.subtractInPlace(vA);
            vC.subtractInPlace(vA);

            uvB.subtractInPlace(uvA);
            uvC.subtractInPlace(uvA);

            final double r = 1.0 / (uvB.x * uvC.y - uvC.x * uvB.y);

            if(r.isInfinite) {
                print("tangent rejection for infinite r for mesh $mesh");
                return;
            }

            sdir.copyFrom(vB).scaleInPlace(uvC.y);
            vC.scaleAndAddToRef(-uvB.y, sdir);
            sdir.scaleInPlace(r);

            tdir.copyFrom(vC).scaleInPlace(uvB.x);
            vB.scaleAndAddToRef(-uvC.x, tdir);
            tdir.scaleInPlace(r);

            tan1[a].addInPlace(sdir);
            tan1[b].addInPlace(sdir);
            tan1[c].addInPlace(sdir);

            tan2[a].addInPlace(tdir);
            tan2[b].addInPlace(tdir);
            tan2[c].addInPlace(tdir);
        }

        // this bit differs from three because I don't entirely understand what groups are but it SEEMS to go through the triangles

        for (int i=0; i<index.length; i+= 3) {
            handleTriangle(
                index[i],
                index[i+1],
                index[i+2]
            );
        }

        // ok back to the rest

        final Vector3 tmp = new Vector3();
        Vector3 tmp2 = new Vector3();
        final Vector3 n = new Vector3();
        final Vector3 n2 = new Vector3();
        Vector3 t;
        double w,test;

        void handleVertex(int v) {
            n.set(normals[v*3], normals[v*3+1], normals[v*3+2]);
            n2.copyFrom(n);

            t = tan1[v];

            // Gram-Schmidt orthonogalise

            tmp.copyFrom(t);
            tmp.subtractInPlace(n.scaleInPlace( Vector3.Dot(n, t))).normalize();

            tmp2 = n2.cross(t);
            test = Vector3.Dot(tmp2, tan2[v]);
            w = test.sign;

            tangents[v*4] = tmp.x;
            tangents[v*4+1] = tmp.y;
            tangents[v*4+2] = tmp.z;
            tangents[v*4+3] = w;
        }

        // same again with the groups stuff

        for (int i=0; i<index.length; i++) {
            handleVertex(index[i]);
        }

        // and apply

        new VertexData()
            ..positions = positions
            ..normals = normals
            ..uvs = uvs
            ..indices = index
            ..tangents = tangents
            ..applyToMesh(mesh);
    }
}