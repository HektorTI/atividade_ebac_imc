// ignore_for_file: unnecessary_const

import 'package:atividade_ebac_imc/controllers/imc_controller.dart';
import 'package:atividade_ebac_imc/models/imc_model.dart';
import 'package:atividade_ebac_imc/widgets/alert_title.dart';
import 'package:atividade_ebac_imc/widgets/imc_alert_item.dart';
import 'package:atividade_ebac_imc/widgets/mensagem_imc.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  ImcController imcController = ImcController();

  @override
  void dispose() {
    imcController.pesoController.dispose();
    imcController.alturaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 10.0, right: 10.0),
        // padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    controller: imcController.pesoController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      label: Text('Peso'),
                      hintText: 'Informe seu peso',
                      hintStyle:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  // child: Padding(
                  // padding: const EdgeInsets.only(top: 20.0),
                  child: TextField(
                    controller: imcController.alturaController,
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: true,
                    ),
                    decoration: const InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(8),
                      label: Text('Altura'),
                      hintText: 'Informe sua altura',
                      hintStyle:
                          TextStyle(fontStyle: FontStyle.italic, fontSize: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(7),
                        ),
                      ),
                    ),
                  ),
                  // ),
                ),
              ], //children
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                    child: ValueListenableBuilder(
                      valueListenable: imcController.botaoProcessar,
                      builder: (context, value, child) {
                        return ElevatedButton(
                          onPressed: !value
                              ? null
                              : () {
                                  showDialog(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (context) {
                                      ImcModel imcModel =
                                          imcController.processarIMC();
                                      return AlertDialog(
                                        shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(32),
                                          ),
                                        ),
                                        titlePadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 0),
                                        titleTextStyle: const TextStyle(
                                            color: Colors.white, fontSize: 30),
                                        title: const AlertTitle(),
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 0),
                                        content: imcController.resultadoIMC ==
                                                -999
                                            ? const Center(
                                                heightFactor: 2,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.warning,
                                                      size: 30,
                                                      color: Colors.orange,
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 8),
                                                      child: Text(
                                                          'Os dados nao foram\ninformados corretamente.'),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            : Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  ImcAlertItem(
                                                    icon: const Icon(
                                                      Icons.accessibility_new,
                                                      size: 30,
                                                      color: Colors.orange,
                                                    ),
                                                    descricao: 'Peso',
                                                    valorImc: imcModel.peso,
                                                  ),
                                                  const Divider(
                                                    height: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  ImcAlertItem(
                                                    icon: const Icon(
                                                      Icons
                                                          .accessibility_rounded,
                                                      size: 30,
                                                      color: Colors.orange,
                                                    ),
                                                    descricao: 'Altura',
                                                    valorImc: imcModel.altura,
                                                  ),
                                                  const Divider(
                                                    height: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  ImcAlertItem(
                                                    icon: const Icon(
                                                      Icons.show_chart_outlined,
                                                      size: 30,
                                                      color: Colors.orange,
                                                    ),
                                                    descricao: 'IMC',
                                                    valorImc: imcController
                                                        .resultadoIMC,
                                                  ),
                                                  MensagemIMC(
                                                      imcModel: imcModel)
                                                ],
                                              ),
                                        actions: [
                                          TextButton(
                                              style: ButtonStyle(
                                                  backgroundColor:
                                                      MaterialStateProperty.all(
                                                          Colors.orange
                                                              .withOpacity(
                                                                  0.1))),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                                FocusManager
                                                    .instance.primaryFocus
                                                    ?.unfocus();
                                              },
                                              child: const Icon(Icons.close))
                                        ],
                                      );
                                    },
                                  );
                                },
                          child: const Text('Calcular IMC'),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ], //children
        ),
      ),
    );
  } //widget build
}
