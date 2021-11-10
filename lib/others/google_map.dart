import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMaps extends StatefulWidget {
  const GoogleMaps({Key? key}) : super(key: key);

  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  Set<Marker> markers = {};

  Set<Polyline> polyline={};

  List<LatLng> latlng = [];
  LatLng _new = LatLng(33.738045, 73.084488);
  LatLng _news = LatLng(33.567997728, 72.635997456);

  // latlng.add(_new);
  // latlng.add(_news);

  GoogleMapController? mapController;
  Location currentLocation = Location();
  final CameraPosition initialPos =
      CameraPosition(target: LatLng(28.535517, 77.391029), zoom: 5);

  /*getLocation() async {
    var location = await currentLocation.getLocation();
    currentLocation.onLocationChanged.listen((LocationData loc) {
      mapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
              zoom: 12)));
      setState(() {
        markers.add(Marker(
          markerId: MarkerId('Office'),
          position: LatLng(loc.latitude ?? 0.0, loc.longitude ?? 0.0),
          //icon:(Icons.location_on )
        ));
      });
    });
  }*/

  addMarker(coordinate) {
    int id = Random().nextInt(500);
    setState(() {
      markers.add(Marker(
        markerId: MarkerId(id.toString()),
        position: coordinate,
        //icon:(Icons.location_on )
      ));
    });
  }

  // polyline.add(Polyline(
  //
  //     ));

  getPoints() {
    return [
      LatLng(28.535517, 77.391029),
      LatLng(27.533417, 77.381029),
      LatLng(26.535517, 77.371029),
      LatLng(28.5122, 77.361029),
      LatLng(28.525517, 77.351029),
      LatLng(28.505517, 77.341029),
      LatLng(28.495517, 77.331029),
      LatLng(28.485517, 77.321029),
      LatLng(28.475517, 77.311029),
      LatLng(28.465517, 77.301029),
      LatLng(28.455517, 77.291029),
      LatLng(28.445517, 77.181029),
      LatLng(28.435517, 77.271029),
      LatLng(28.535517, 77.391029),


    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: GoogleMap(
          initialCameraPosition: initialPos,
          mapType: MapType.normal,
          myLocationEnabled: true,
          onMapCreated: (controller) {
            setState(() {
              mapController = controller;
            });
          },
          onTap: (coordinate) {
            mapController!.animateCamera(CameraUpdate.newLatLng(coordinate));
            addMarker(coordinate);
          },
          markers: markers,
          polylines: polyline,
    polygons: Set<Polygon>.of(<Polygon>[
    Polygon(
    polygonId: PolygonId('area'),
    points: getPoints(),
    geodesic: true,
    strokeColor: Colors.red.withOpacity(0.6),
    strokeWidth: 5,
    fillColor: Colors.redAccent.withOpacity(0.1),
    visible: true),


    ]

        ),
      ),
      )
    );

  }
}
