import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'camera-preview.dart';
import 'package:path/path.dart' as Pa;
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io';

class Assinatura extends StatefulWidget {
  @override
  _Assinatura createState() {
    return _Assinatura();
  }
}

class _Assinatura extends State {
  final SignatureController _controller =
      SignatureController(penStrokeWidth: 5, penColor: Colors.red);

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
            ),
            FlatButton(
              color: Colors.blue,
              textColor: Colors.white,
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              onPressed: () {
                _salvar();
              },
              child: Text(
                'Salvar',
                style: TextStyle(fontSize: 20.0),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _apagar()
  {
    _controller.clear();
    setState((){});
  }

  void _salvar() async
  {
    try{
      var image = await _controller.toPngBytes();

      final path = Pa.join(
          (await getTemporaryDirectory()).path,
          '${DateTime.now()}.png',
        );
    
    final buffer = image.buffer;
    await File(path).writeAsBytes(
      buffer.asUint8List(image.offsetInBytes, image.lengthInBytes));

     Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewImageScreen(imagePath: path),
        ),
      );

    }catch(ex){
      print(ex);
    }
    
  }
}
