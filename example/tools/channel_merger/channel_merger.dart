import "dart:html";
import "dart:typed_data";

import "package:LoaderLib/Loader.dart";

Future<void> main() async {
    final Element redImageDiv = querySelector("#redImage")!;
    final Element greenImageDiv = querySelector("#greenImage")!;
    final Element blueImageDiv = querySelector("#blueImage")!;
    final CanvasElement outputCanvas = querySelector("#outputCanvas")! as CanvasElement;

    final Element redButtonDiv = querySelector("#redButton")!;
    final Element greenButtonDiv = querySelector("#greenButton")!;
    final Element blueButtonDiv = querySelector("#blueButton")!;
    final Element outputButtonDiv = querySelector("#outputButton")!;

    final Element redInfo = new DivElement()..text="No image selected";
    redButtonDiv.append(redInfo);
    final Element greenInfo = new DivElement()..text="No image selected";
    greenButtonDiv.append(greenInfo);
    final Element blueInfo = new DivElement()..text="No image selected";
    blueButtonDiv.append(blueInfo);
    final Element outputInfo = new DivElement()..text="-";
    outputButtonDiv.append(outputInfo);

    ImageElement? red;
    ImageElement? green;
    ImageElement? blue;

    void combine([Event? event]) {
        // can't do anything if we don't have at least one image
        if (red == null && green == null && blue == null) {
            outputInfo.text="Please select at least one image";
            return;
        }

        // work out the required size
        int w,h;
        if (red != null) {
            w = red!.naturalWidth;
            h = red!.naturalHeight;
        } else if (green != null) {
            w = green!.naturalWidth;
            h = green!.naturalHeight;
        } else {
            w = blue!.naturalWidth;
            h = blue!.naturalHeight;
        }

        // reject mismatched image sizes
        if ( (red != null && (red!.naturalWidth != w || red!.naturalHeight != h))
        || (green != null && (green!.naturalWidth != w || green!.naturalHeight != h))
        || (blue != null && (blue!.naturalWidth != w || blue!.naturalHeight != h))) {
            outputInfo.text="Image size mismatch";
            return;
        }

        // get and resize our working canvas
        final CanvasElement canvas = outputCanvas;
        canvas..width=w..height=h;
        final CanvasRenderingContext2D ctx = canvas.context2D;
        final int length = w*h;

        // get the data from each image, or an empty array if there is no image
        final Uint8ClampedList redData = (red != null) ? (new CanvasElement(width: w, height:h)..context2D.drawImage(red!, 0, 0)).context2D.getImageData(0, 0, w, h).data: new Uint8ClampedList(length*4);
        final Uint8ClampedList greenData = (green != null) ? (new CanvasElement(width: w, height:h)..context2D.drawImage(green!, 0, 0)).context2D.getImageData(0, 0, w, h).data: new Uint8ClampedList(length*4);
        final Uint8ClampedList blueData = (blue != null) ? (new CanvasElement(width: w, height:h)..context2D.drawImage(blue!, 0, 0)).context2D.getImageData(0, 0, w, h).data: new Uint8ClampedList(length*4);

        // process the data
        final ImageData data = ctx.getImageData(0, 0, w, h);
        final Uint8ClampedList outData = data.data;

        for(int i=0; i<length; i++) {
            outData[i*4  ] = redData[i*4]; // red from the red image
            outData[i*4+1] = greenData[i*4+1]; // green from the green image
            outData[i*4+2] = blueData[i*4+2]; // blue from the blue image
            outData[i*4+3] = 255; // solid alpha
        }

        ctx.putImageData(data, 0, 0);

        outputInfo.text="Success!";
    }

    final ButtonElement outputButton = new ButtonElement()..text="Combine"..onClick.listen(combine);
    outputButtonDiv.append(outputButton);

    String tempUrl;
    outputButtonDiv.append(FileFormat.saveButton(Formats.png, () async {
        tempUrl = outputCanvas.toDataUrl();
        final ImageElement img = new ImageElement();
        img.src = tempUrl;
        await img.onLoad.first;
        return img;
    }, caption: "Save merged image", filename: () => "merged" ));

    redButtonDiv.append(FileFormat.loadButton(Formats.png, (ImageElement object, String filename) {
        red?.remove();
        red = object;
        redImageDiv.append(red!);

        redInfo.text = "$filename (${object.naturalWidth}x${object.naturalHeight})";
    }, caption: "Load Image"));

    greenButtonDiv.append(FileFormat.loadButton(Formats.png, (ImageElement object, String filename) {
        green?.remove();
        green = object;
        greenImageDiv.append(green!);

        greenInfo.text = "$filename (${object.naturalWidth}x${object.naturalHeight})";
    }, caption: "Load Image"));

    blueButtonDiv.append(FileFormat.loadButton(Formats.png, (ImageElement object, String filename) {
        blue?.remove();
        blue = object;
        blueImageDiv.append(blue!);

        blueInfo.text = "$filename (${object.naturalWidth}x${object.naturalHeight})";
    }, caption: "Load Image"));
}

