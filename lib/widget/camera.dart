import 'package:camera/camera.dart';
import 'camera-preview.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() {
    return _CameraScreenState();
  }
}

class _CameraScreenState extends State {
  CameraController controller;
  List cameras;
  int selectedCameraIdx;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Flutter'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: _cameraPreviewWidget(),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [                  
                  _captureControlRowWidget(context),
                  Spacer()
                ],
              ),
              SizedBox(height: 20.0)
            ],
          ),
        ),
      ),
    );
  }

  Widget _cameraPreviewWidget() {
    //Verificar se a camera foi iniciada, se não mostra loading
    if (controller == null || !controller.value.isInitialized) {
      return const Text(
        'Loading',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20.0,
          fontWeight: FontWeight.w900,
        ),
      );
    }

    //Retorna o preview da camera (do pacote)
    return AspectRatio(
      aspectRatio: controller.value.aspectRatio,
      child: CameraPreview(controller),
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
            FloatingActionButton(
                child: Icon(Icons.camera),
                backgroundColor: Colors.blue,
                onPressed: () {
                  _onCapturePressed(context);
                })
          ],
        ),
      ),
    );
  }

  //Método de captura da câmera
  void _onCapturePressed(context) async {
    try {
      //Montar o caminho do arquivo
      final path = join(
        (await getTemporaryDirectory()).path,
        '${DateTime.now()}.png',
      );

      //Salva no diretório temporário, poderia passar um path da memória interna para ficar salvo
      await controller.takePicture(path);

      //Abre a página de preview da foto
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => PreviewImageScreen(imagePath: path),
        ),
      );
    } catch (e) {
      print(e);
    }
  }

  

//É chamado quando o widget é iniciado -> busca a câmera e chama o inicializador do controle
  @override
  void initState() {
    super.initState();
    // Busca as câmeras disponíveis no app
    availableCameras().then((availableCameras) {
      cameras = availableCameras;
      if (cameras.length > 0) {
        setState(() {
          //Iniciar na camera traseira
          _initCameraController(cameras[0]).then((void v) {});
        });
        
      } else {
        print("No camera available");
      }
    }).catchError((err) {
      // se der erro
      print(err);
    });
  }

  //Future pq o método é assíncrono
  Future _initCameraController(CameraDescription cameraDescription) async {    
    if (controller != null) {
      await controller.dispose();
    }

    // Criando camercontroller (do pacote) com as opções passadas
    controller = CameraController(cameraDescription, ResolutionPreset.max);
    
    // executa quando houve mudança
    controller.addListener(() {
      //verifica se o widget tá na árvore
      if (mounted) {
        setState(() {});
      }
    });

    try {
      await controller.initialize();
    } on CameraException catch (e) {
      print(e);
    }

    //Toda vez que vc chama o setState vc avisa o framework que algo mudou no estado do objeto
    if (mounted) {
      setState(() {});
    }
  }  
}
