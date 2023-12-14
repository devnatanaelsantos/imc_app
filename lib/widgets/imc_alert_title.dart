import 'package:flutter/material.dart';

class ImcAlertTitle extends StatelessWidget {
  const ImcAlertTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Resultado IMC',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 24,
        color: Color(0xFFE7E7E7),
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
