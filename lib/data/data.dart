
class DataJson {

  String getData(){
    return '''{
	"Formulario": [
		{ "FomularioID": 1, "Nome": "Passo 1", "Descricao": "Identificação Pessoal" },
		{ "FomularioID": 2, "Nome": "Passo 2", "Descricao": "" }
	],
	"Campo": [
		{ "CampoID": 1, "FormularioID": 1, "Label": "Nome", "Tipo": "TEXT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": 50, "TamanhoDecimal": null, "Obrigatorio": true, "CampoPaiID": null },
		{ "CampoID": 2, "FormularioID": 1, "Label": "Idade", "Tipo": "INT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": 2, "TamanhoDecimal": null, "Obrigatorio": true, "CampoPaiID": null },
		{ "CampoID": 3, "FormularioID": 1, "Label": "Sexo", "Tipo": "DROPDOWN", "OpcoesLista": "Sexo", "ListaValor": "SexoID", "ListaTexto": "Descricao", "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": true, "CampoPaiID": null },
		{ "CampoID": 4, "FormularioID": 1, "Label": "Esporte(s) Favorito(s)", "Tipo": "LABEL", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": true, "CampoPaiID": null },
		{ "CampoID": 5, "FormularioID": 1, "Label": "Futebol", "Tipo": "BIT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 4 },
		{ "CampoID": 6, "FormularioID": 1, "Label": "Basquete", "Tipo": "BIT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 4 },
		{ "CampoID": 7, "FormularioID": 1, "Label": "Volei", "Tipo": "BIT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 4 },
		{ "CampoID": 8, "FormularioID": 1, "Label": "Natação", "Tipo": "BIT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 4 },
		{ "CampoID": 9, "FormularioID": 1, "Label": "Corrida", "Tipo": "BIT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 4 },
		{ "CampoID": 10, "FormularioID": 1, "Label": "Outro", "Tipo": "BIT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": null, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 4 },
		{ "CampoID": 11, "FormularioID": 1, "Label": null, "Tipo": "TEXT", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": 100, "TamanhoDecimal": null, "Obrigatorio": false, "CampoPaiID": 10 },
		{ "CampoID": 12, "FormularioID": 1, "Label": "Pratica algum destes regularmente?", "Tipo": "null", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoDecimal": null, "TamanhoLimite": null, "Obrigatorio": true, "CampoPaiID": null },
		{ "CampoID": 13, "FormularioID": 2, "Label": "Peso", "Tipo": "DECIMAL", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": 6, "TamanhoDecimal": 2, "Obrigatorio": true, "CampoPaiID": null },
		{ "CampoID": 13, "FormularioID": 2, "Label": "Altura", "Tipo": "DECIMAL", "OpcoesLista": null, "ListaValor": null, "ListaTexto": null, "TamanhoLimite": 6, "TamanhoDecimal": 2, "Obrigatorio": true, "CampoPaiID": null }
	],
	"Sexo": [
		{ "SexoID": 1, "Descricao": "MASCULINO" },
		{ "SexoID": 2, "Descricao": "FEMININO" }
	]
}''';
  }
}
