import 'dart:convert';

import 'package:campos_dinamicos/data/dataJson.dart';
import 'package:campos_dinamicos/widget/textFieldDinamico.dart';
import 'package:flutter/material.dart';

class Grid extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return GridState(DataJson().getDataGrid());
  }
}

class GridState extends State<Grid> {
  dynamic _campos;
  List<DataRow> _registros = List<DataRow>();

  List<TextFieldDinamico> _textFieldDinamicos = List<TextFieldDinamico>();

  GridState(jsonCampos) {
    _campos = _mapToCampos(jsonCampos);
  }

  dynamic _mapToCampos(jsonCampos) {
    return jsonDecode(jsonCampos);
  }

  _getCampos() {
    for (var item in _campos) {
      if (item["Tipo"] == "TEXTO") {
        _textFieldDinamicos
            .add(TextFieldDinamico(item["Label"], TextInputType.text));
      }
    }

    return _textFieldDinamicos;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text('Grid'),
        ),
        body: Column(
          children: <Widget>[
            Column(
              children: _getCampos(),
            ),
            FlatButton(
              child: Text("Salvar"),
              onPressed: () {
                _adicionarRegistro();
              },
            ),
            _getDataTable()
          ],
        ));
  }

  List<DataColumn> _getColunas() {
    List<DataColumn> colunas = List<DataColumn>();
    for (var item in _campos) {
      colunas.add(new DataColumn(label: Text(item['Label'])));
    }
    return colunas;
  }

  void _adicionarRegistro() {
    List<String> inputs = _textFieldDinamicos.map((x) => x.controller.text).toList();

    setState(() {
      _registros.add(DataRow(cells: inputs.map((x) => DataCell(Text(x))).toList()));
    });
    _textFieldDinamicos.clear();
  }

  Widget _getDataTable() {
    return DataTable(
      columns: _getColunas(),
      rows: _registros,
    );
  }
}
