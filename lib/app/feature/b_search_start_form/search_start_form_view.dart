// ignore_for_file: unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class SearchStartFormView extends StatefulWidget {
  const SearchStartFormView({super.key});

  @override
  State<SearchStartFormView> createState() => _SearchStartFormViewState();
}

//WARNING MSN!
//###
//### Se as suas localizações de Zona de Residência e Local de Trabalho estiverem desatualizadas ou erradas,
//### favor utilizar a opção Outra Localização (pendente de conprovativo).
//###

//WARNING MSN!
//Essa Frase aqui abaixo só faz sentido na Web pois seu contexto está na próxima tela projetada para o App.
//### Para creches da Rede Solidária, só é possível pedir vaga se não houver disponibilidade na Rede Aderente.

//DROPDown VARIABLES
bool _isDropdownTipoDeVagaEnabled = false;
bool _isDropdownDistritoEnabled = false;
bool _isDropdownConcelhoEnabled = false;
bool _isDropdownFreguesiaEnabled = false;

//ZONA DE RESIDÊNCIA or LOCAL de TRABALHO Found! By the Rest API???
bool _isZonaDeResidenciaFound = false;
bool _isLocalDeTrabalhoFound = false;

//SEARCH BUTTON LEVEL ACUMULATOR
int _searchButtonLevel = 0;

//ITENS LIST da RESPOSTA SOCIAL
final List<String> _dropDownItemsRespostaSocial = [
  'Selecione uma Opção',
  'Creche',
  'Ama',
  'Asilo',
];
String _selectedTextRespostaSocial = 'Selecione uma Opção';
//FIM - ITENS LIST da RESPOSTA SOCIAL

//ITENS LIST da LOCALIZAÇÃO
final List<String> _dropDownItemsLocalizacao = [
  'Selecione uma Opção',
  'Zona de Residência',
  'Local de Trabalho',
  'Outra Localização',
];
String _selectedTextLocalizacao = 'Selecione uma Opção';
//FIM - ITENS LIST da LOCALIZAÇÃO

//ITENS LIST da TIPO DE VAGA
final List<String> _dropDownItemsTipoDeVaga = [
  'Selecione uma Opção',
  'Ainda NÃO Anda',
  'Anda e têm idade inferior a 2 Anos',
  'Têm idade superior a 2 anos ou mais',
];
String _selectedTextTipoDeVaga = 'Selecione uma Opção';
//FIM - ITENS LIST da LOCALIZAÇÃO

//ITENS LIST da TIPO DE DISTRITO
final List<String> _dropDownItemsDistrito = [
  'Selecione uma Opção',
  'Aveiro',
  'Beja',
  'Braga',
  'Bragança',
  'lista....',
];
String _selectedTextDistrito = 'Selecione uma Opção';
//FIM - ITENS LIST da DISTRITO

//ITENS LIST da TIPO DE CONCELHO
final List<String> _dropDownItemsConcelho = [
  'Selecione uma Opção',
  'Alenquer',
  'Amadora',
  'Arruda de Vinhos',
  'Azambuja',
  'Cadaval',
  'lista....',
];
String _selectedTextConcelho = 'Selecione uma Opção';
//FIM - ITENS LIST da CONCELHO

//ITENS LIST da TIPO DE CONCELHO
final List<String> _dropDownItemsFreguesia = [
  'Selecione uma Opção',
  'Abrigada e Cabanas de Torres',
  'Aldeia Galega de Merceana e Aldeia Gavinha',
  'Alequer (santo Estêvão e Triana)',
  'Carnota',
  'Carregado de Cadafais',
  'lista....',
];
String _selectedTextFreguesia = 'Selecione uma Opção';
//FIM - ITENS LIST da CONCELHO

class _SearchStartFormViewState extends State<SearchStartFormView> {
  final String _txtRespostaSocialCreche = 'Creche';
  final String _txtStandadToAllDropDownButtonsKeyTerm = 'Selecione uma Opção';
  final String _txtLocalizacaoKeyTerm = 'Outra Localização';
  final String _txtToogleButton1 = 'SOMENTE COM VAGAS';
  final String _txtToogleButton2 = 'LISTAGEM COMPLETA';


  void handleRespostaSocialChoices(String theOption) {
    if (theOption == _txtRespostaSocialCreche) {
      _isDropdownTipoDeVagaEnabled = true;
    } else if (theOption != _txtRespostaSocialCreche) {
      _isDropdownTipoDeVagaEnabled = false;
      //HERE RESET DROPDOWN BUTTON FOR TIPO DE VAGA!!
      _selectedTextTipoDeVaga = _txtStandadToAllDropDownButtonsKeyTerm;
    }
  }

  void handleLocalizacaoChoices(String theOption) {
    if (theOption == _txtLocalizacaoKeyTerm) {
      _isDropdownDistritoEnabled = true;
      // AND ENABLE Distrito DropDown AND Perform the API Rest Search
    } else if (theOption != _txtLocalizacaoKeyTerm) {
      _isDropdownDistritoEnabled = false;
      _isDropdownConcelhoEnabled = false;
      _isDropdownFreguesiaEnabled = false;
      //HERE RESET DROPDOWN BUTTONS FOR DISTRITO, CONCELHO E FREGUESIA!
      _selectedTextDistrito = _txtStandadToAllDropDownButtonsKeyTerm;
      _selectedTextConcelho = _txtStandadToAllDropDownButtonsKeyTerm;
      _selectedTextFreguesia = _txtStandadToAllDropDownButtonsKeyTerm;
    }
  }

  void handleDistritoChoices(String theOption) {
    if (theOption != _txtStandadToAllDropDownButtonsKeyTerm) {
      // ENABLE Conselho DropDown AND Perform the API Rest Search
      _isDropdownConcelhoEnabled = true;
    }
  }

  void handleConcelhoChoices(String theOption) {
    if (theOption != _txtStandadToAllDropDownButtonsKeyTerm) {
      // ENABLE Freguesia DropDown AND Perform the API Rest Search
      _isDropdownFreguesiaEnabled = true;
    }
  }

  void handleFreguesiaChoices(String theOption) {
    // Do Nothing but need to Perform the API Rest Search??
  }

  //TipoDeVaga
  void handleTipoDeVagaChoices(String theOption) {
    // Do Nothing but need to Perform the API Rest Search??
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Cooperação',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        body: Column(
          children: <Widget>[
            // CABECAÇHO! #############################
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(children: [
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        border:
                            Border(bottom: BorderSide(color: Colors.black))),
                    child: const Row(
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 2),
                          child: Text(
                            'Pesquisa de vagas',
                            style: TextStyle(
                                fontSize: 18,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),

            //### COMBO 1 - RESPOSTA_SOCIAL Enable OR Disable TIPO DE VAGA ### OK!!!
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 30),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 3),
                        child: DropdownButtonFormField(
                          value: _selectedTextRespostaSocial,
                          items:
                              _dropDownItemsRespostaSocial.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedTextRespostaSocial = value!;
                              handleRespostaSocialChoices(value);
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: const InputDecoration(
                            labelText: 'Resposta Social',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            //### COMBO 2 - LOCALIZAÇÃO Enable OR Disable DISTRITO ### OK!!!
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 3),
                        child: DropdownButtonFormField(
                          value: _selectedTextLocalizacao,
                          items: _dropDownItemsLocalizacao.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: (String? value) {
                            setState(() {
                              _selectedTextLocalizacao = value!;
                              handleLocalizacaoChoices(value);
                            });
                          },
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: const InputDecoration(
                            labelText: 'Localização',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            // ########################################################## ITENS A OCULTAR CASO A ZONA DE RESIDÊNCIA NÃO SEJA ESPECIFICADA

            //### COMBO 3 - DISTRITO Enable Concelho!!
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 3),
                        child: DropdownButtonFormField(
                          value: _selectedTextDistrito,
                          items: _dropDownItemsDistrito.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: _isDropdownDistritoEnabled
                              ? (String? value) {
                                  setState(() {
                                    _selectedTextDistrito = value!;
                                    handleDistritoChoices(value);
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: const InputDecoration(
                            labelText: 'Distrito',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            //### COMBO 4 - CONSELHO Enable Freguesia!!
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 3),
                        child: DropdownButtonFormField(
                          value: _selectedTextConcelho,
                          items: _dropDownItemsConcelho.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: _isDropdownConcelhoEnabled
                              ? (String? value) {
                                  setState(() {
                                    _selectedTextConcelho = value!;
                                    handleConcelhoChoices(value);
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: const InputDecoration(
                            labelText: 'Concelho',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            //############################# COMBO 5 FREGUESIA
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 3),
                        child: DropdownButtonFormField(
                          value: _selectedTextFreguesia,
                          items: _dropDownItemsFreguesia.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: _isDropdownFreguesiaEnabled
                              ? (String? value) {
                                  setState(() {
                                    _selectedTextFreguesia = value!;
                                    handleFreguesiaChoices(value);
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: const InputDecoration(
                            labelText: 'Freguesia',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            // ########################################################## FIM DE ITENS A OCULTAR CASO A ZONA DE RESIDÊNCIA NÃO SEJA ESPECIFICADA

            //############################# COMBO 6 -- PRÉ-FIM >> TIPO DA VAGA
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 20),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 0, vertical: 3),
                        child: DropdownButtonFormField(
                          value: _selectedTextTipoDeVaga,
                          items: _dropDownItemsTipoDeVaga.map((String item) {
                            return DropdownMenuItem(
                                value: item, child: Text(item));
                          }).toList(),
                          onChanged: _isDropdownTipoDeVagaEnabled
                              ? (String? value) {
                                  setState(() {
                                    _selectedTextTipoDeVaga = value!;
                                    handleTipoDeVagaChoices(value);
                                  });
                                }
                              : null,
                          icon: const Icon(Icons.arrow_drop_down),
                          decoration: const InputDecoration(
                            labelText: 'Tipo da Vaga',
                            border: OutlineInputBorder(),
                          ),
                        )),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 2),
                      child: Center(
                        child: ToggleSwitch(
                          minWidth: 300.0,
                          minHeight: 45.0,
                          initialLabelIndex: 0,
                          totalSwitches: 2,
                          activeBgColor: const [Colors.deepOrange],
                          activeFgColor: Colors.white,
                          inactiveBgColor: Colors.black38,
                          inactiveFgColor: Colors.grey[900],
                          labels: [ _txtToogleButton1, _txtToogleButton2 ],
                          customTextStyles: const [
                            TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ],
                          onToggle: (index) {
                            print('switched to: $index');
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //############################# TOGGLE BTN
            //I STOP HERE!! PUT ALL THIS CODE INSIDE A NEW FUNCTION METHOD?? THINK ABOUT IT!!
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, bottom: 15, top: 35),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 2),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                5), // Set the corner radius
                          ),
                        ),
                        //I STOP HERE!! WHEN I FIND ANOTHER WAY TO ENABLE BUTTON IF ALL DROPDOWN ARE CORRETETD SELECTED...
                        onPressed: _isDropdownTipoDeVagaEnabled
                            ? _isDropdownDistritoEnabled
                                ? _isDropdownConcelhoEnabled
                                    ? _isDropdownFreguesiaEnabled
                                        ? () {
                                            //DO SOMETHING....
                                            //WHAT DO IS THE OPTIONS IS ZONA de RESIDÊNCIA OR LOCAL de TRABALHO...
                                            print('Search Button Is Press!!');
                                          }
                                        : null
                                    : null
                                : null
                            : null,

                        child: const Text(
                          'Pesquisar',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
