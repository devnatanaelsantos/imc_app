import 'package:flutter/material.dart';

class ImcAlertItem extends StatelessWidget {
  const ImcAlertItem({
    super.key,
    required this.descricao,
    required this.valorImc,
  });

  final String descricao;
  final double valorImc;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        descricao,
        style: const TextStyle(
            color: Color(0xFFE7E7E7),
            fontSize: 16,
            fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        valorImc.toString().replaceAll('.', ','),
        style: const TextStyle(color: Color(0xFFE7E7E7), fontSize: 16),
      ),
    );
  }
}
