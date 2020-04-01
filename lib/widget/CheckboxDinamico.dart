import 'package:flutter/material.dart';

class CheckboxDinamico extends StatefulWidget {
  final String value;
  _CheckboxDinamicoState state;

  CheckboxDinamico(this.value);

  @override
  State<StatefulWidget> createState() {
    this.state = _CheckboxDinamicoState(this.value);
    return this.state;
  }
}

class _CheckboxDinamicoState extends State<CheckboxDinamico> {
  String _label;
  String selected;

  _CheckboxDinamicoState(this._label);

  Widget _widgetsFilho = Text('');

  @override
  initState() {
    this.selected = this._label;
  }

  Widget _carregarCampos() {
    return _getCheckBox();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _carregarCampos(),
        _widgetsFilho,
      ],
    );
  }

  _onChange(bool newValue) {
    setState(() {
      if (newValue) {
        this.selected = this._label;
        _widgetsFilho = Text("TESTE");
      } else {
        _widgetsFilho = Text('');

        this.selected = '';
      }
    });
  }

  Widget _getCheckBox() {
    return Row(
      children: <Widget>[
        Expanded(child: Text(this._label)),
        Checkbox(
            value: this.selected != '',
            onChanged: (bool newValue) {
              _onChange(newValue);
            }),
      ],
    );
  }
}
