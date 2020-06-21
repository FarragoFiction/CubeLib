import "dart:html";
import "dart:typed_data";

import "package:LoaderLib/Loader.dart";

import "../../CubeLib.dart";

enum TextureFormatType {
    rgba,
    luminance,
    luminanceAlpha,
}

class TextureFormat extends BinaryFileFormat<RawTexture> {
    Scene scene;
    TextureFormatType format;
    int sampling;

    TextureFormat(Scene this.scene, {TextureFormatType this.format, int this.sampling}) {
        this.format ??= TextureFormatType.rgba;
        this.sampling ??= Texture.BILINEAR_SAMPLINGMODE;
    }

    @override
    Future<RawTexture> read(ByteBuffer input) async {
        final ImageElement source = await Formats.png.read(input);
        final Uint8ClampedList data = (new CanvasElement(width: source.naturalWidth, height: source.naturalHeight).context2D..drawImage(source, 0, 0)).getImageData(0, 0, source.naturalWidth, source.naturalHeight).data;

        switch (format) {
            case TextureFormatType.rgba:
                return new RawTexture(data, source.naturalWidth, source.naturalHeight, Engine.TEXTUREFORMAT_RGBA, scene, false, true, sampling, Engine.TEXTURETYPE_UNSIGNED_BYTE);
            case TextureFormatType.luminance:
                final Uint8ClampedList subset = new Uint8ClampedList(data.length~/4);
                for (int i=0; i<subset.length; i++) {
                    subset[i] = data[i*4];
                }
                return new RawTexture(subset, source.naturalWidth, source.naturalHeight, Engine.TEXTUREFORMAT_LUMINANCE, scene, false, true, sampling, Engine.TEXTURETYPE_UNSIGNED_BYTE);
            case TextureFormatType.luminanceAlpha:
                final Uint8ClampedList subset = new Uint8ClampedList(data.length~/2);
                final int max = data.length ~/4;
                for (int i=0; i<max; i++) {
                    subset[i*2] = data[i*4];
                    subset[i*2+1] = data[i*4+3];
                }
                return new RawTexture(subset, source.naturalWidth, source.naturalHeight, Engine.TEXTUREFORMAT_LUMINANCE_ALPHA, scene, false, true, sampling, Engine.TEXTURETYPE_UNSIGNED_BYTE);
        }

        throw Exception("Failed to load texture, null format?");
    }

    @override
    Future<ByteBuffer> write(RawTexture data) => throw Exception("Write not implemented");
    @override
    String mimeType() => "application/octet-stream";
    @override
    String header() => "";
}