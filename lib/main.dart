// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'widgets/nav-drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Campus Map',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.red,
      ),
      home: const MyHomePage(title: 'University Of Arkansas Campus Map'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Hello World! Welcome to the Campus Map!',
            ),
            Image.asset('assets/images/woopig.png'),
            ElevatedButton(
              child: const Text('Go to Map'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      //=> MapPage(title: widget.title,))
                      return AlertDialog(
                        title: const Text('WARNING'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: const <Widget>[
                              Text(
                                  'While using this app, please pay attention to your surroundings and navigate safely.'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MapWindow(
                                      //title: widget.title,
                                      )));
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ); //push
              }, //onPressed
            ),
          ],
        ),
      ),
    );
  }
}

class MapWindow extends StatefulWidget {
  const MapWindow({Key? key}) : super(key: key);

  @override
  State<MapWindow> createState() => MapState();
}

class MapState extends State<MapWindow> {
  Completer<GoogleMapController> _controller = Completer();

  List<Marker> markers = [];

  @override
  void initState() {
    intilize();
    super.initState();
  }

  intilize() {
    // Quick info dump on Markers:
    // Markers are constructed using Marker objects
    // They require a MarkerId, an object initialized by a String
    // They have a long list of contructor options: https://pub.dev/documentation/google_maps_flutter_platform_interface/latest/google_maps_flutter_platform_interface/Marker/Marker.html
    Marker JBHUNTmarker = Marker(
        markerId: MarkerId("JBHT"),
        position: LatLng(36.066082, -94.173786),
        infoWindow: InfoWindow(title: "JB Hunt"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        });

    Marker WalkerHallmarker = Marker(
        markerId: MarkerId("WJWH"),
        position: LatLng(36.06535, -94.17343),
        infoWindow: InfoWindow(title: "Walker Hall"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        });

    Marker MechanicalENGmarker = Marker(
        markerId: MarkerId("MEEG"),
        position: LatLng(36.06639, -94.17290),
        infoWindow: InfoWindow(title: "Mechanical Engineering"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        });

    Marker Physicsmarker = Marker(
        markerId: MarkerId("PHYS"),
        position: LatLng(36.06641, -94.17185),
        infoWindow: InfoWindow(title: "Physics Building"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        });

    Marker ChampionsHallmarker = Marker(
        markerId: MarkerId("CHPN"),
        position: LatLng(36.06581, -94.17135),
        infoWindow: InfoWindow(title: "Champions Hall"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(context),
          );
        });

    markers.add(JBHUNTmarker);
    markers.add(WalkerHallmarker);
    markers.add(MechanicalENGmarker);
    markers.add(Physicsmarker);
    markers.add(ChampionsHallmarker);
    setState(() {});
  }

  static final CameraPosition _initialPos = CameraPosition(
    target: LatLng(36.068035, -94.178929),
    zoom: 17,
  );

  @override
  Widget build(BuildContext context) {
    // Marker resources: https://stackoverflow.com/questions/55000043/flutter-how-to-add-marker-to-google-maps-with-new-marker-api
    return Scaffold(
        body: GoogleMap(
          onTap: (newCoordinate) {},
          onMapCreated: (mapController) {
            mapController.showMarkerInfoWindow(MarkerId("JBHT"));
            mapController.showMarkerInfoWindow(MarkerId("CHPN"));
            //mapController.showMarkerInfoWindow(MarkerId("WJWH"));
          },
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialPos,
          markers: markers.map((e) => e).toSet(),
        ),
        drawer: NavDrawer(),
        appBar: AppBar(
          title: Text('Campus Map'),
        ));
  }
}

Widget buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Popup example'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Hello"),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
