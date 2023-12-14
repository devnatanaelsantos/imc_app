import 'package:app_imc/models/imc_model.dart';
import 'package:flutter/material.dart';

class ImcMenssagem extends StatelessWidget {
  const ImcMenssagem({
    super.key,
    required this.imcModel,
  });

  final ImcModel imcModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('Categoria IMC',
            style: TextStyle(
                color: Color(0xFFE7E7E7),
                fontSize: 18,
                fontWeight: FontWeight.w500)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(imcModel.mensagem,
              style: const TextStyle(color: Color(0xFFE7E7E7), fontSize: 16)),
        ),
      ],
    );
  }
}
