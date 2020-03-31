class CampoDTO {
  num campoID;
  num campoPaiID;
  num formularioID;
  num tamanhoLimite;
  num tamanhoDecimal;

  bool obrigatorio;

  String tipo;
  String label;
  String listaValor;
  String listaTexto;
  String opcoesLista;
  
  CampoDTO.fromJson(Map campo){
    this.campoID = campo["CampoID"];
    this.campoPaiID = campo["CampoPaiID"];
    this.formularioID = campo["FormularioID"];
    this.tamanhoLimite = campo["tamanhoLimite"];

    this.obrigatorio = campo["Obrigatorio"];

    this.tipo = campo["Tipo"];
    this.label = campo["Label"];
    this.listaValor = campo["ListaValor"];
    this.listaTexto = campo["ListaTexto"];
    this.opcoesLista = campo["opcoesLista"];
  }
}