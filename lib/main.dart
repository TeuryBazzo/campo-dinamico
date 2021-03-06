import 'package:campos_dinamicos/data/dataJson.dart';
import 'package:campos_dinamicos/dto/formulario.dart';
import 'package:campos_dinamicos/widget/dropdownButtonDinamico.dart';
import 'package:campos_dinamicos/widget/checkboxDinamico.dart';
import 'package:campos_dinamicos/widget/textFieldDinamico.dart';
import 'package:campos_dinamicos/page/menuDrawer.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Formulários Dinâmicos Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jsonString = DataJson().getData();

  var listTextFieldDinamico = new List<TextFieldDinamico>();
  var listDropdownDinamico = new List<DropdownButtonDinamico>();
  var listCheckboxDinamico = new List<CheckboxDinamico>();

  var _formularios = List<FormularioDto>();
  var _currentFormulario = 0;

  List<Widget> _carregarCampos() {
    var widgets = List<Widget>();
    Widget widget;

    dynamic scores = jsonDecode(jsonString);
    num count = scores["Formulario"].length;

    _formularios.clear();
    for (var i = 0; i < count; i++) {
      var formulario = FormularioDto.fromJson(scores["Formulario"][i]);
      scores["Campo"].forEach((x) => formulario.addCampo(x));
      _formularios.add(formulario);
    }

    var formulario = _formularios[_currentFormulario];

    widget = Padding(
        child: Text(formulario.nome + ' - ' + formulario.descricao),
        padding: EdgeInsets.only(top: 18));
    widgets.add(widget);

    for (var campo in formulario.campos) {
      switch (campo.tipo) {
        case 'TEXT':
          widget = TextFieldDinamico(campo.label, TextInputType.text);
          widgets.add(widget);
          listTextFieldDinamico.add(widget);
          break;
        case 'INT':
          widget = TextFieldDinamico(campo.label, TextInputType.number);
          widgets.add(widget);
          listTextFieldDinamico.add(widget);
          break;
        case 'DECIMAL':
          widget = TextFieldDinamico(campo.label, TextInputType.number);
          widgets.add(widget);
          listTextFieldDinamico.add(widget);
          break;
        case 'DROPDOWN':
          widget = DropdownButtonDinamico(['MASCULINO', 'FEMININO']);
          widgets.add(widget);
          listDropdownDinamico.add(widget);
          break;
        case 'BIT':
          if (campo.label == "Outro")
            widget = CheckboxDinamico(campo.label,
                TextFieldDinamico(campo.label, TextInputType.text));
          else
            widget = CheckboxDinamico(campo.label, null);

          widgets.add(widget);
          listCheckboxDinamico.add(widget);
          break;
        case 'LABEL':
          widget = Text(campo.label);
          widgets.add(widget);
          break;
      }
    }

    return widgets;
  }

  _submit() {
    listTextFieldDinamico.forEach((x) => print(x.controller.text));
    listDropdownDinamico.forEach((x) => print(x.state.dropdownValue));
    listCheckboxDinamico.forEach((x) => print(x.state.selected));
  }

  _proximoFormulario() {
    if (_formularios.length == _currentFormulario + 1) return;

    setState(() {
      this.opacity = 0;
    });

    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _currentFormulario = _currentFormulario + 1;
        this.opacity = 1;
      });
    });
  }

  _formularioAnterior() {
    if (_currentFormulario == 0) return;
    setState(() {
      _currentFormulario = _currentFormulario - 1;
    });
  }

  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: MenuDrawer(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                AnimatedOpacity(
                  opacity: opacity,
                  duration: Duration(milliseconds: 300),
                  child: Column(
                    children: _carregarCampos(),
                  ),
                ),
                _botoesFormularios()
              ],
            ),
          ),
        ));
  }

  Widget _botoesFormularios() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 0,
          child: RaisedButton(
            onPressed: () {
              _formularioAnterior();
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Formulário anterior'),
          ),
        ),
        Expanded(
          flex: 0,
          child: RaisedButton(
            onPressed: () {
              _proximoFormulario();
            },
            color: Colors.blue,
            textColor: Colors.white,
            child: Text('Próximo Formulario'),
          ),
        ),
      ],
    );
  }
}
