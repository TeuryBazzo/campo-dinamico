import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Coordenadas extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Coordenadas> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  String _currentCoordinates;

  GoogleMapController mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[                                          
            FlatButton(                                
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                _getCurrentLocation();
              },
              child: Text(
                'Obter Localização'              
              ),
            ),
            if (_currentPosition != null)
              Text(_currentCoordinates + _currentAddress),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: Set<Marker>.of(markers.values),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() async {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
      _getAddressFromLatLng();
      mapController.animateCamera(
        CameraUpdate.newLatLngZoom(
          LatLng(_currentPosition.latitude, _currentPosition.longitude),
          15.0, // Zoom factor
        ),
      );
          final MarkerId markerId = MarkerId('0');


      final Marker marker = Marker(
        markerId: markerId,
        position: LatLng(_currentPosition.latitude, _currentPosition.longitude),
      );

    setState(() {
      // adding a new marker to map
      markers[markerId] = marker;
    });

    }).catchError((e) {
      print(e);
    });
  }

  _getAddressFromLatLng() async {
    List<Placemark> p = await geolocator.placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude);

    Placemark place = p[0];

    setState(() {
      _currentAddress =
          "${place.thoroughfare}, ${place.subThoroughfare} - ${place.subLocality}, ${place.postalCode}\n${place.subAdministrativeArea} - ${place.administrativeArea} - ${place.country}";
      _currentCoordinates =
          "Latitude: ${_currentPosition.latitude}\nLongitude: ${_currentPosition.longitude}\n";
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}
