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

  @override
  initState() {
    this.selected = this._label;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(child: Text(this._label)),
        Checkbox(
          value: this.selected != '',
          onChanged: (bool newValue) {
            setState(() {
              this.selected = '';
            });
          },
        ),
      ],
    );
  }
}
