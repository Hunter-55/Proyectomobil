// ignore_for_file: library_private_types_in_public_api, avoid_unnecessary_containers, must_be_immutable, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapsPage extends StatefulWidget {
  String latitude = "", logitude = "";
  MapsPage(this.latitude, this.logitude, {Key? key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
      child: FlutterMap(
        options: MapOptions(
          center: LatLng(
              double.parse(widget.latitude), double.parse(widget.logitude)),
          zoom: 13.0,
          maxZoom: 19.0,
          enableScrollWheel: true,
          scrollWheelVelocity: 0.005,
          /*onPositionChanged: (MapPosition position, bool hasGesture) {
              // Your logic here. `hasGesture` dictates whether the change
              // was due to a user interaction or something else. `position` is
              // the new position of the map.
            },*/
          //rotation: 180.0,
          /*bounds: LatLngBounds(
            LatLng(51.74920, -0.56741),
            LatLng(51.25709, 0.34018),
          ),
          maxBounds: LatLngBounds(
            LatLng(-90, -180.0),
            LatLng(90.0, 180.0),
          ),*/
        ),
        nonRotatedChildren: [
          AttributionWidget.defaultWidget(
            source: 'OpenStreetMap contributors',
            onSourceTapped: null,
          ),
        ],
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          //Marcador
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: LatLng(double.parse(widget.latitude),
                    double.parse(widget.logitude)),
                builder: (ctx) => Container(
                  child: const Icon(Icons.face),
                ),
              ),
            ],
          ),
          //circulo
          CircleLayer(circles: [
            CircleMarker(
                point: LatLng(double.parse("25.762811607256378"),
                    double.parse("-100.43165236096196")),
                color: Colors.blue.withOpacity(0.5),
                borderStrokeWidth: 2,
                useRadiusInMeter: true,
                radius: 10 // 2000 meters | 2 km
                ),
          ]),
          //Poligonos
          /*PolygonLayer(
            polygonCulling: false,
            polygons: [
              Polygon(
                points: [
                  LatLng(25.428992366437562, -100.92566894978316),
                  LatLng(double.parse("25.762811607256378"),
                      double.parse("-100.43165236096196")),
                  LatLng(25, 45),
                ],
                color: Colors.red,
              ),
            ],
          ),*/
          //Lineas caminos
          /*PolylineLayer(
            polylineCulling: false,
            polylines: [
              Polyline(
                points: [
                  LatLng(25.428992366437562, -100.92566894978316),
                  LatLng(double.parse("25.762811607256378"),
                      double.parse("-100.43165236096196")),
                  LatLng(25, 45),
                ],
                color: Colors.blue,
              ),
            ],
          ),*/
        ],
      ),
    );
  }
}
