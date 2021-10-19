import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:agroorganico_frontend/widgets/user_bottom_navbar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:agroorganico_frontend/widgets/notification_dialog.dart';
import 'package:location/location.dart' as Local;
import 'package:google_place/google_place.dart';

class MapScreen extends StatefulWidget {
  static const String routeName = '/map';

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var googlePlace = GooglePlace("AIzaSyACQAR3roXGa-Gbs7WpmaHFTLzHdaQ9TBw");
  Completer<GoogleMapController> _controller = Completer();
  CameraPosition _initialPosition = CameraPosition(
    target: LatLng(-15.797086156846994, -47.892384705007046),
    zoom: 14.4746,
  );
  Local.LocationData locationData;
  // var mark = new Marker(
  //     markerId: MarkerId('1'),
  //     infoWindow: InfoWindow(title: 'teste'),
  //     position: LatLng(-15.797086156846994, -47.892384705007046));

  List<Marker> teste = [];
  Set<Marker> markers = {};

  Future<bool> _getLocation() async {
    Local.Location location;
    bool serviceEnabled;
    Local.PermissionStatus permissionGranted;
    location = new Local.Location();
    permissionGranted = await location.hasPermission();
    if (permissionGranted == Local.PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != Local.PermissionStatus.granted) {
        return false;
      }
    }

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return false;
      }
    }

    locationData = await location.getLocation();
    _initialPosition = CameraPosition(
      target: LatLng(locationData.latitude, locationData.longitude),
      zoom: 15,
    );
    return true;
  }

  Future<void> checkLocation() async {
    final GoogleMapController controller = await _controller.future;

    bool locationAccessGranted = await _getLocation();
    controller.animateCamera(CameraUpdate.newCameraPosition(_initialPosition));
    if (!locationAccessGranted) {
      showConfirmationDialog(
          'Você precisa autorizar o uso da localização para que possamos continuar.',
          this.context,
          'Erro de Permissão de Localização');
      return;
    }
    await getMarkersLocation();
    setState(() {
      // markers = teste.toSet();
      markers = teste.toSet();
    });

    // mark = new Marker(
    //     markerId: MarkerId('1'),
    //     infoWindow: InfoWindow(title: 'Ponto Orgânico da 315 Norte'),
    //     position: LatLng(locationData.latitude, locationData.longitude));
    // teste = {mark};
  }

  Future<void> getMarkersLocation() async {
    var result = await googlePlace.search.getNearBySearch(
        Location(lat: locationData.latitude, lng: locationData.longitude),
        10000,
        keyword: "Loja de alimentos orgânicos",
        language: 'pt-BR');

    teste = result.results
        .map(
          (e) => Marker(
            markerId: MarkerId(e.name),
            position: LatLng(e.geometry.location.lat, e.geometry.location.lng),
            infoWindow: InfoWindow(title: e.name),
          ),
        )
        .toList();
  }

  @override
  void initState() {
    super.initState();
    checkLocation();
    // teste = {mark};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        mapType: MapType.normal,
        initialCameraPosition: _initialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: markers,
      ),
      bottomNavigationBar: UserBottomNavbar(currentIndex: 2, context: context),
    );
  }
}
