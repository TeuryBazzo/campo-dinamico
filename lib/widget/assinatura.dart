import 'package:flutter/material.dart';
import 'package:signature/signature.dart';

class Assinatura extends StatefulWidget {
  @override
  _Assinatura createState() {
    return _Assinatura();
  }
}

class _Assinatura extends State {
  final SignatureController _controller =
      SignatureController(penStrokeWidth: 5, penColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assinatura'),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _signaturePad(),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [_captureControlRowWidget(context), Spacer()],
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget _signaturePad() {
    return Signature(
      controller: _controller,
      width: 500,
      height: 500,
      backgroundColor: Colors.white,
    );
  }

  /// Barra com o botão de captura
  /// context é tipo o this
  Widget _captureControlRowWidget(context) {
    return Expanded(
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                _apagar();
              },
              child: Text(
                'Apagar',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _apagar() {
    _controller.clear();
    setState((){});
  }
}
