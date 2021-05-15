
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

class DetectionWidget extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<DetectionWidget> {
  List _outputs;
  File _image;
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _loading = true;
    loadModel().then((value) {
      setState(() {
        _loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: _loading
            ? Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ) : Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(vertical: 80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _image == null ? Container() : ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        width: 250,
                        height: 250,
                        child: Image.file(_image),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    _outputs != null ? Text(
                      "${_outputs[0]["label"]}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontFamily: "Montserrat",
                            ),
                    )
                        : Container()
                  ],
                ),
              ),
        floatingActionButton: SpeedDial(
          curve: Curves.easeInCirc,
          backgroundColor: Colors.greenAccent,
          foregroundColor: Colors.white,
          overlayOpacity: 0.0,
          overlayColor: Colors.white,
          buttonSize: 60,
          marginBottom: 12,
          marginEnd: (MediaQuery.of(context).size.width)/2.4,
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: FloatingActionButton(onPressed: pickImage,
                backgroundColor: Colors.greenAccent,
                child: Icon(Icons.add_photo_alternate_outlined,color: Colors.white,),),
            ),
            SpeedDialChild(
              child: FloatingActionButton(onPressed: pickImage1,
                backgroundColor: Colors.greenAccent,
                child: Icon(Icons.camera,color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );

  }
   pickImage() async {
    var image = await ImagePicker.pickImage(source:ImageSource.gallery);
    if (image == null) return null;
      setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);

  }
  pickImage1() async {
    var image = await ImagePicker.pickImage(source:ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _loading = true;
      _image = image;
    });
    classifyImage(image);

  }

  // pick image1

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.5,
      imageMean: 224,
      imageStd: 224,

    );
    setState(() {
      _loading = false;
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/quant_essicientnetv4.tflite" ,
      labels: "assets/labels.txt",
    );
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
