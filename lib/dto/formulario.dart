import 'package:campos_dinamicos/dto/campos.dart';

class FormularioDto {
  num formularioID;
  String nome;
  String descricao;

  List<CampoDTO> campos;

  addCampo(Map campo){
    if(campo["FormularioID"] == this.formularioID) {
      campos.add(CampoDTO.fromJson(campo));
    }
  }

  FormularioDto.fromJson(Map formulario){
    this.campos = new List<CampoDTO>();

    formularioID = formulario['FomularioID'];
    nome = formulario['Nome'];
    descricao = formulario['Descricao'];

  }
}