import 'package:flutter/material.dart';

import 'cameraScreen.dart';
import 'coordenadas.dart';
import 'assinatura.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu Lateral',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pin_drop),
            title: Text('Localização'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Coordenadas()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Assinatura'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Assinatura()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.camera),
            title: Text('Câmera'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CameraScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
