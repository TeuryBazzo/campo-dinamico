import 'package:flutter/material.dart';

class DropdownButtonDinamico extends StatefulWidget {
  List<String> listaOpcoes;
  _DropdownButtonDinamicoState state;

  DropdownButtonDinamico(this.listaOpcoes);

  @override
  State<DropdownButtonDinamico> createState() {
    this.state = _DropdownButtonDinamicoState(listaOpcoes);
    return state;
  }
}

class _DropdownButtonDinamicoState extends State<DropdownButtonDinamico> {
  String dropdownValue = 'MASCULINO';
  List<String> listaOpcoes;

  _DropdownButtonDinamicoState(this.listaOpcoes);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Sexo'),
          Row(
            children: <Widget>[
              Expanded( 
                flex: 1,
                child: DropdownButton<String>(
                  value: dropdownValue,
                  isExpanded: true,
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 26,
                  hint: Text('Selecione o seu sexo'),
                  elevation: 1,
                  style: TextStyle(color: Colors.black),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: listaOpcoes
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
