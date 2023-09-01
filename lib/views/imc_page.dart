// ignore_for_file: unnecessary_const

import 'package:atividade_ebac_imc/controllers/imc_controller.dart';
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
                    child: ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) {
                            return AlertDialog(
                              title: const Center(child: Text('Title')),
                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                      'Peso: ${imcController.pesoController.text}'),
                                  Text(
                                      'Altura: ${imcController.alturaController.text}'),
                                ],
                              ),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      FocusManager.instance.primaryFocus
                                          ?.unfocus();
                                    },
                                    child: const Icon(Icons.close))
                              ],
                            );
                          },
                        );
                      },
                      child: const Text('Calcular IMC'),
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
} //class _ImcPageState
