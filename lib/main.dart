// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'widgets/nav-drawer.dart';
import 'widgets/Building.dart';

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
  List<Building> buildings = [];

  @override
  void initState() {
    intialize();
    super.initState();
  }

  // Initialize creates the Marker objects present on the map, and updates the state of the map afterwards
  // This method constructs markers and calls the method to build an on-click information window
  // using buildFloorPage
  intialize() {
    // Quick info dump on Markers:
    // Markers are constructed using Marker objects
    // They require a MarkerId, an object initialized by a String
    // They have a long list of contructor options: https://pub.dev/documentation/google_maps_flutter_platform_interface/latest/google_maps_flutter_platform_interface/Marker/Marker.html

    // Add markers and buildings to the map's state
    markers.add(Marker(
        markerId: MarkerId("JBHT"),
        position: LatLng(36.066082, -94.173786),
        infoWindow: InfoWindow(title: "JB Hunt"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) =>
                buildFloorPage(context, "JB Hunt JBHT", [
              "1",
              "2",
              "3",
              "4",
              "5"
            ], [
              'assets/images/JBHuntFloor1.png',
              'assets/images/JBHuntFloor2.png',
              'assets/images/JBHuntFloor3.png',
              'assets/images/JBHuntFloor4.png',
              'assets/images/JBHuntFloor5.png'
            ], [
              "First Floor of JB Hunt",
              "Second Floor of JB Hunt",
              "Third Floor of JB Hunt",
              "Fourth Floor of JB Hunt",
              "Fifth Floor of JB Hunt",
            ]),
          );
        }));
    buildings.add(Building("JBHT", 36.066082, -94.173786));

    markers.add(Marker(
        markerId: MarkerId("WJWH"),
        position: LatLng(36.06535, -94.17343),
        infoWindow: InfoWindow(title: "Walker Hall"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) =>
                buildFloorPage(context, "Walker Hall WJWH", [
              "1",
              "2",
              "3",
              "4",
              "5"
            ], [
              'assets/images/WJWHFloor1.png',
              'assets/images/WJWHFloor2.png',
              'assets/images/WJWHFloor3.png',
              'assets/images/WJWHFloor4.png',
              'assets/images/WJWHFloor5.png'
            ], [
              "First Floor of Walker Hall",
              "Second Floor of Walker Hall",
              "Third Floor of Walker Hall",
              "Fourth Floor of Walker Hall",
              "Fifth Floor of Walker Hall",
            ]),
          );
        }));
    buildings.add(Building("WJWH", 36.06535, -94.17343));

    markers.add(Marker(
        markerId: MarkerId("MEEG"),
        position: LatLng(36.06639, -94.17290),
        infoWindow: InfoWindow(title: "Mechanical Engineering"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(
                context,
                'assets/images/woopig.png',
                "Welcome to the Mechanical Engineering Building!"),
          );
        }));
    buildings.add(Building("MEEG", 36.06639, -94.17290));

    markers.add(Marker(
        markerId: MarkerId("PHYS"),
        position: LatLng(36.06641, -94.17185),
        infoWindow: InfoWindow(title: "Physics Building"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) => buildPopupDialog(
                context,
                'assets/images/woopig.png',
                "Welcome to the JBHunt Center For Excellence!"),
          );
        }));
    buildings.add(Building("PHYS", 36.06641, -94.17185));

    markers.add(Marker(
        markerId: MarkerId("CHPN"),
        position: LatLng(36.06581, -94.17135),
        infoWindow: InfoWindow(title: "Champions Hall"),
        // This is where the magic happens
        onTap: () {
          showDialog(
            // Get context from parent widget and builder is the buildpopupDialog method
            context: context,
            builder: (BuildContext context) =>
                buildFloorPage(context, "Champions Hall CHMP", [
              "1",
              "2",
              "3",
              "4"
            ], [
              'assets/images/ChampionsFloor1.png',
              'assets/images/ChampionsFloor2.png',
              'assets/images/ChampionsFloor3.png',
              'assets/images/ChampionsFloor4.png',
            ], [
              "First Floor of Champions Hall",
              "Second Floor of Champions Hall",
              "Third Floor of Champions Hall",
              "Fourth Floor of Champions Hall"
            ]),
          );
        }));
    buildings.add(Building("CHPN", 36.06581, -94.17135));
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
            mapController.showMarkerInfoWindow(MarkerId("WJWH"));
            mapController.showMarkerInfoWindow(MarkerId("CHPN"));
          },
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: _initialPos,
          markers: markers.map((e) => e).toSet(),
        ),
        drawer: NavDrawer(),
        appBar: AppBar(title: Text('Campus Map'), actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: MySearchDelegate(),
              );
            },
          )
        ]));
  }
}

//Search Bar for Buildings
class MySearchDelegate extends SearchDelegate {
  List<String> searchResults = [
    'J.B. Hunt Transport Services Inc. Center for Academic Excellence (JBHT)',
    'Champions Hall (CHPM)',
    'Willard J. Walker Hall (WJWH)',
    'Mechanical Engineering (MECH)',
    'Physics Building (PHYS)',
  ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null), //close searchbar
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () {
            if (query.isEmpty) {
              close(context, null); //close searchbar
            } else {
              query = '';
            }
          },
        ),
      ];

  @override
  Widget buildResults(BuildContext context) => Center(
      child: Text(query,
          style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold)));

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = searchResults.where((searchResult) {
      final result = searchResult.toLowerCase();
      final input = query.toLowerCase();

      return result.contains(input);
    }).toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}

// Build each individual page for the page view
// Takes a floor title, map URL, and description for the floor
Widget buildFloorWidget(String floor, String map, String desc) {
  return Scaffold(
      body: Center(
          child: Column(children: <Widget>[
    Text(floor),
    SizedBox(height: 10),
    Image.asset(map),
    SizedBox(height: 10),
    Text(desc),
  ])));
}

// Function to build a Pageview for a building
// Pageviews will allow the user to open a new page to observe the building
// layout, floor number, and a description of the floor
// buildFloorPage will call buildFloorWidget to create each floor's data
//
// Takes a context, a title for the page, a list of floor numbers, a list of map URLs, and a list of descriptions.
// Pages will be built per floor, so all arrays must be >= length of floors
Widget buildFloorPage(BuildContext context, String building,
    List<String> floors, List<String> maps, List<String> desc) {
  // Controller decides which page to open the view on
  PageController controller = PageController(initialPage: 0);

  List<Widget> floorPages = <Widget>[];
  for (int i = 0; i < floors.length; i++) {
    floorPages.add(buildFloorWidget(floors[i], maps[i], desc[i]));
  }

  return Scaffold(
      appBar: AppBar(
        title: Text(building),
      ),
      body: PageView(
        controller: controller,
        scrollDirection: Axis.vertical,
        children: floorPages,
      ));
}

// Function to build the popup layouts for each building
// ----- DEPRECIATED -----
Widget buildPopupDialog(
    BuildContext context, String mapImage, String popupDialog) {
  return AlertDialog(
    title: Text('Building Information'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(popupDialog),
        Image.asset(mapImage),
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
