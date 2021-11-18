import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(13.699814, -89.198271);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Set<Marker> _createMarker() {
    return {
      Marker(
        //ARCE
        markerId: MarkerId("sucursal_1"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan),
        position: LatLng(13.699814, -89.198271),
        infoWindow: InfoWindow(
            title: 'SUCURSAL ARCE',
            snippet: 'Horario de atención de lunes a viernes de 8am a 4pm'),
        /*rotation: 90*/
      ),
      Marker(
        //SALVADOR DEL MUNDO
        markerId: MarkerId("sucursal_2"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
        position: LatLng(13.701353, -89.224598),
        infoWindow: InfoWindow(
            title: 'SUCURSAL SALVADOR DEL MUNDO',
            snippet: 'Horario de atención de lunes a viernes de 8am a 4pm'),
      ),
      Marker(
        //CENTRO SOYAPANGO
        markerId: MarkerId("sucursal_3"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        position: LatLng(13.704360, -89.150204),
        infoWindow: InfoWindow(
            title: 'SUCURSAL SOYAPAGO CENTRO',
            snippet: 'Horario de atención de lunes a viernes de 8am a 4pm'),
        /*rotation: 90*/
      ),
      Marker(
        //SAN JACINTO
        markerId: MarkerId("sucursal_4"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: LatLng(13.686238, -89.188484),
        infoWindow: InfoWindow(
            title: 'SUCURSAL SAN JACINTO',
            snippet: 'Horario de atención de lunes a viernes de 8am a 4pm'),
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MovilSV - Sucursales'),
          backgroundColor: Colors.deepOrange[900],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: _createMarker(),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 13.0,
          ),
        ),
      ),
    );
  }
}
