import 'package:atividade_ebac_imc/models/imc_model.dart';
import 'package:flutter/material.dart';

class MensagemIMC extends StatelessWidget {
  const MensagemIMC({
    super.key,
    required this.imcModel,
  });

  final ImcModel imcModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          const Text(
            'Nivel IMC',
            style: TextStyle(fontSize: 14, color: Colors.orange),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            imcModel.mensagem,
            style: const TextStyle(fontSize: 12, color: Colors.orange),
          ),
        ],
      ),
    );
  }
}
