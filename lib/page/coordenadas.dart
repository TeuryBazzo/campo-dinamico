import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

class Coordenadas extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<Coordenadas> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;

  Position _currentPosition;
  String _currentAddress;
  String _currentCoordinates;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Localização'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              Text(_currentCoordinates + _currentAddress),
            FlatButton(
              child: Text("Obter localização"),
              onPressed: () {
                _getCurrentLocation();
              },
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
}
