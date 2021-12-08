import 'dart:async';

import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  CustomInfoWindowController infoWindowController =
      CustomInfoWindowController();
  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    infoWindowController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    markers = [
      Marker(
          onTap: () {
            infoWindowController.addInfoWindow!(
              Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.monetization_on,
                              color: Colors.white,
                              size: 30,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Expanded(
                              child: Text(
                                "\$16 per hour",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: Colors.white,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
              LatLng(37.42796133580664, -122.085749655962),
            );
          },
          markerId: MarkerId("1"),
          position: LatLng(37.42796133580664, -122.085749655962))
    ];

    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        title: Text("BasePay"),
      ),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            mapToolbarEnabled: false,
            markers: markers.toSet(),
            initialCameraPosition: _kGooglePlex,
            onTap: (position) {
              infoWindowController.hideInfoWindow!();
            },
            onCameraMove: (position) {
              infoWindowController.onCameraMove!();
            },
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
              infoWindowController.googleMapController = controller;
            },
          ),
          CustomInfoWindow(
            controller: infoWindowController,
            height: 75,
            width: 150,
            offset: 50,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add wage',
        child: const Icon(Icons.add),
      ),
    );
  }
}
