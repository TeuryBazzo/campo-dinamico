import 'package:flutter/material.dart';

class CheckboxDinamico extends StatefulWidget {
  final String value;
  _CheckboxDinamicoState state;
  Widget campoFilho;

  CheckboxDinamico(this.value, this.campoFilho);

  @override
  State<StatefulWidget> createState() {
    this.state = _CheckboxDinamicoState(this.value, this.campoFilho);
    return this.state;
  }
}

class _CheckboxDinamicoState extends State<CheckboxDinamico> {
  String _label;
  String selected;
  Widget campoFilho;

  _CheckboxDinamicoState(this._label, this.campoFilho);

  Widget _widgetsFilho = SizedBox.shrink();

  @override
  initState() {
    this.selected = '';
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
        if(this._temFilho())
          _widgetsFilho = campoFilho;
        
      } else {
        _widgetsFilho = SizedBox.shrink();
        this.selected = '';
      }
    });
  }

  bool _temFilho(){
    return this.campoFilho != null;
  }

  Widget _getCheckBox() {
    return Row(
      children: <Widget>[
        Expanded(child: Text(this._label)),
        Checkbox(
            value: this.selected == this._label,
            onChanged: (bool newValue) {
              _onChange(newValue);
            }),
      ],
    );
  }
}
