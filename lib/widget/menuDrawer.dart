import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Drawer Header',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.pin_drop),
            title: Text('Localizacao'),
          ),
          ListTile(
            leading: Icon(Icons.format_align_center),
            title: Text('Formularios'),
          ),
          ListTile(
            leading: Icon(Icons.edit),
            title: Text('Assinatura'),
          ),
        ],
      ),
    );
  }
}
