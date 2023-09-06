import 'package:flutter/material.dart';

class ImcAlertItem extends StatelessWidget {
  const ImcAlertItem({
    super.key,
    required this.icon,
    required this.descricao,
    required this.valorImc,
  });

  final Widget icon;
  final String descricao;
  final double valorImc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      tileColor: Colors.grey.withOpacity(0.1),
      title: Text(
        descricao,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.orange,
        ),
      ),
      trailing: Text(
        valorImc.toString().replaceAll('.', ','),
        style: const TextStyle(
          fontSize: 20,
          color: Colors.orange,
        ),
      ),
    );
  }
}
