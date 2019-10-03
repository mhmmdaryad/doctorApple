import 'dart:async';
import 'dart:convert';
import 'dart:core';
import 'dart:core' as prefix0;
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/phDetails.dart';
import 'package:path/path.dart' show join;
import 'package:path_provider/path_provider.dart';
import 'package:requests/requests.dart';

String responseData;
class Network {
  final String url;
  Network(this.url);
  Future getData() async {
    print('Calling uri: $url');
    String response = await Requests.get(url);
    responseData = response;
    return response;
  }
  
  Future postData({body}) async {
    print("Postin Data: $url");
    String response = await Requests.post(url, body: body);
    responseData = response;
    return response;
  }
}


Future<void> main() async {
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();

  // Get a specific camera from the list of available cameras.
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
        home: TakePictureScreen(
          // Pass the appropriate camera to the TakePictureScreen widget.
          camera: firstCamera,
        ),
        debugShowCheckedModeBanner: false),
  );
}

// A screen that allows users to take a picture using a given camera.
class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  const TakePictureScreen({
    Key key,
    @required this.camera,
  }) : super(key: key);

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  CameraController _controller;
  Future<void> _initializeControllerFuture;

  var temp;

  @override
  void initState() {
    super.initState();


    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.ultraHigh,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ambil Gambar')),
      // Wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner
      // until the controller has finished initializing.
      body: Stack(
        children: <Widget>[
          FutureBuilder<void>(
            future: _initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the Future is complete, display the preview.
                return CameraPreview(_controller);
              } else {
                // Otherwise, display a loading indicator.
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: Container(
              alignment: Alignment.center,
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    color: Colors.transparent,
                    padding: EdgeInsets.only(
                        top: 15, left: 50, right: 50, bottom: 15),
                    child: Icon(Icons.camera),
                    onPressed: () async {
                      try {
                        // Ensure that the camera is initialized.
                        await _initializeControllerFuture;

                        // Construct the path where the image should be saved using the
                        // pattern package.
                        final path = join(
                          // Store the picture in the temp directory.
                          // Find the temp directory using the `path_provider` plugin.
                          (await getTemporaryDirectory()).path,
                          '${DateTime.now()}.png',
                        );

                        // Attempt to take a picture and log where it's been saved.
                        await _controller.takePicture(path);
                        await Network("https://api.doctorapple.site/ph").postData(body: base64Encode(File(path).readAsBytesSync()));
                        print(responseData);

                        Map<String, dynamic> myJson = jsonDecode(responseData);
                        String q = myJson['id'];

                        await Network("https://api.doctorapple.site/ph/" + q).getData();

                        myJson = jsonDecode(responseData);

                        String title = myJson['title'];
                        String description = myJson['description'];
                        String image = myJson['image'];
                        String solusi = myJson['solusi'];
                        String penyebab = myJson['penyebab'];


                        // If the picture was taken, display it on a new screen.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => phDetails(
                                title: title,
                                description: description,
                                image: MemoryImage(image as Uint8List),
                                solusi: solusi,
                                Penyebab: penyebab),

//                          phDetails(title: null, description: null, image: null, solusi: null, Penyebab: null)
                          ),
                        );
                      } catch (e) {
                        // If an error occurs, log the error to the console.
                        print(e);
                      }
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

// A widget that displays the picture taken by the user.
