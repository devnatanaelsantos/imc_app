import 'package:app_imc/controllers/imc_controller.dart';
import 'package:app_imc/models/imc_model.dart';
import 'package:app_imc/widgets/imc_alert_item.dart';
import 'package:app_imc/widgets/imc_alert_title.dart';
import 'package:app_imc/widgets/imc_menssagem.dart';
import 'package:flutter/material.dart';

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
    imcController.pesoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF222222),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Row(
              children: [
                Text(
                  'Calculadora IMC',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color(0xFFE7E7E7),
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: TextField(
                      controller: imcController.pesoController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      style: const TextStyle(color: Color(0xFFE7E7E7)),
                      decoration: const InputDecoration(
                        labelText: 'Peso (Kg)',
                        labelStyle: TextStyle(color: Color(0xFFE7E7E7)),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2ECC71)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E7E7)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: TextField(
                      controller: imcController.alturaController,
                      keyboardType: const TextInputType.numberWithOptions(),
                      style: const TextStyle(color: Color(0xFFE7E7E7)),
                      decoration: const InputDecoration(
                        labelText: ('Altura (cm)'),
                        labelStyle: TextStyle(color: Color(0xFFE7E7E7)),
                        hintStyle: TextStyle(color: Colors.white),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF2ECC71)),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFE7E7E7)),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24),
                        border: Border.all(
                          color: const Color(0xFF2ECC71),
                          width: 2,
                        ),
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          imcController.clearCampos();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              const Color(0xFF222222)),
                        ),
                        child: const Text(
                          'Limpar',
                          style: TextStyle(
                              color: Color(0xFF2ECC71),
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ValueListenableBuilder(
                      valueListenable: imcController.botaoProcessar,
                      builder: (context, value, _) {
                        return SizedBox(
                          child: ElevatedButton(
                            onPressed: !value
                                ? null
                                : () {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (context) {
                                          ImcModel imcModel =
                                              imcController.processarImc();
                                          return AlertDialog(
                                            backgroundColor:
                                                const Color(0xFF2ECC71),
                                            title: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                Positioned(
                                                  left: -20,
                                                  child: TextButton(
                                                      onPressed: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                        FocusManager.instance
                                                            .primaryFocus
                                                            ?.unfocus();
                                                      },
                                                      child: const Icon(
                                                        Icons.arrow_back,
                                                        color: Colors.white,
                                                      )),
                                                ),
                                                const ImcAlertTitle(),
                                              ],
                                            ),
                                            contentPadding:
                                                const EdgeInsets.all(16),
                                            content: imcController
                                                        .resultadoImc ==
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
                                                          color:
                                                              Color(0xFF333333),
                                                        ),
                                                        SizedBox(
                                                          height: 8,
                                                        ),
                                                        Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          'Dados inseridos de maneira incorreta\nTente novamente',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            color: Color(
                                                                0xFFE7E7E7),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    children: [
                                                      ImcAlertItem(
                                                        descricao: 'Peso:',
                                                        valorImc: imcModel.peso,
                                                      ),
                                                      ImcAlertItem(
                                                        descricao: 'Altura:',
                                                        valorImc:
                                                            imcModel.altura,
                                                      ),
                                                      ImcAlertItem(
                                                        descricao: 'IMC:',
                                                        valorImc: imcController
                                                            .resultadoImc,
                                                      ),
                                                      ImcMenssagem(
                                                          imcModel: imcModel),
                                                    ],
                                                  ),
                                          );
                                        });
                                  },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  const Color(0xFF2ECC71)),
                            ),
                            child: const Text(
                              'Calcular IMC',
                              style: TextStyle(
                                  color: Color(0xFF0F0F0F),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
