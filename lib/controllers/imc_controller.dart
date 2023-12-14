import 'package:app_imc/models/imc_model.dart';
import 'package:flutter/material.dart';

class ImcController {
  final pesoController = TextEditingController();
  final alturaController = TextEditingController();
  double resultadoImc = 0;

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

  double _calcularIMC() {
    try {
      double pesoImc =
          double.parse(pesoController.value.text.replaceAll(',', '.'));
      double alturaImc =
          double.parse(alturaController.value.text.replaceAll(',', '.'));

      double valorImc = pesoImc / (alturaImc * alturaImc);

      return valorImc;
    } catch (e) {
      return -999;
    }
  }

  ImcModel processarImc() {
    resultadoImc = double.tryParse(_calcularIMC().toStringAsFixed(2)) as double;

    if (resultadoImc == -999) {
      return ImcModel(peso: 0, altura: 0, mensagem: '');
    }

    var mensagemImc = _obterMensagemIMC(resultadoImc);

    ImcModel imcModel = ImcModel(
        peso: double.parse(pesoController.value.text.replaceAll(',', '.')),
        altura: double.parse(alturaController.value.text.replaceAll(',', '.')),
        mensagem: mensagemImc);

    return imcModel;
  }

  String _obterMensagemIMC(double valorImc) {
    if (valorImc < 18.49) {
      return 'Abaixo do Peso (IMC abaixo de 18,5)';
    }
    if (valorImc >= 18.5 && valorImc <= 24.49) {
      return 'Peso normal (IMC entre 18,5 e 24,9)';
    }
    if (valorImc >= 25 && valorImc <= 29.99) {
      return 'Sobrepeso (IMC entre 25 e 29,9)';
    }
    if (valorImc >= 30 && valorImc <= 34.99) {
      return 'Obesidade grau I (IMC entre 30 e 34,9)';
    }
    if (valorImc >= 35 && valorImc <= 39.99) {
      return 'Obesidade grau II (IMC entre 35 e 39,9)';
    }
    return 'Obesidade grau III = (IMC acima de 40)';
  }
}
