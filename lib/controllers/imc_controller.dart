import 'package:flutter/material.dart';

class ImcController {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  ValueNotifier<bool> botaoProcessar = ValueNotifier(false);

  ImcController() {
    pesoController.addListener(() {
      _habilitaBotao();
    });

    alturaController.addListener(() {
      botaoProcessar.value = pesoController.value.text.isNotEmpty &&
          alturaController.value.text.isNotEmpty;
    });
  }

  void _habilitaBotao() {
    botaoProcessar.value = pesoController.value.text.isNotEmpty &&
        alturaController.value.text.isNotEmpty;
  }
}
