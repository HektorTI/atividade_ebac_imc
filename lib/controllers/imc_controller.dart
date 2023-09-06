import 'package:atividade_ebac_imc/models/imc_model.dart';
import 'package:flutter/material.dart';

class ImcController {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();

  double resultadoIMC = 0;
  ValueNotifier<bool> botaoProcessar = ValueNotifier(false);

  ImcController() {
    pesoController.addListener(() {
      _habilitaBotao();
    });

    alturaController.addListener(() {
      _habilitaBotao();
    });
  }

  void _habilitaBotao() {
    botaoProcessar.value = pesoController.value.text.isNotEmpty &&
        alturaController.value.text.isNotEmpty;
  }

  ImcModel processarIMC() {
    resultadoIMC = double.tryParse(_calcularIMC().toStringAsFixed(2)) as double;

    if (resultadoIMC == -999) {
      return ImcModel(peso: 0, altura: 0, mensagem: '');
    }

    var mensagemIMC = _obterMensagemIMC(resultadoIMC);
    ImcModel imcModel = ImcModel(
      peso: double.parse(pesoController.value.text.replaceAll(',', '.')),
      altura: double.parse(alturaController.value.text.replaceAll(',', '.')),
      mensagem: mensagemIMC,
    );

    return imcModel;
  }

  double _calcularIMC() {
    // Peso / (altura * altura)
    try {
      double pesoIMC =
          double.parse(pesoController.value.text.replaceAll(',', '.'));

      double alturaIMC =
          double.parse(alturaController.value.text.replaceAll(',', '.'));

      double valorIMC = pesoIMC / (alturaIMC * alturaIMC);

      return valorIMC;
    } catch (e) {
      return -999;
    }
  }

  String _obterMensagemIMC(double valorIMC) {
    if (valorIMC < 18.5) {
      return 'Abaixo do peso';
    }
    if (valorIMC >= 18.5 && valorIMC <= 24.9) {
      return 'Peso Normal';
    }
    if (valorIMC >= 25 && valorIMC <= 29.9) {
      return 'Sobrepeso';
    }
    return 'Você está obeso';
  }
}
