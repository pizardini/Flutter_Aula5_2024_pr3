import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculadoraIMC(),
    );
  }
}

class CalculadoraIMC extends StatefulWidget {
  const CalculadoraIMC({super.key});

  @override
  State<CalculadoraIMC> createState() => _CalculadoraIMCState();
}

class _CalculadoraIMCState extends State<CalculadoraIMC> {
  final alturaController = TextEditingController();
  final pesoController = TextEditingController();
  String resultadoIMC = '';
  String mensagemResultado = '';

  @override
  void dispose() {
    alturaController.dispose();
    pesoController.dispose();
    super.dispose();
  }

  void calcularIMC() {
    final altura = double.tryParse(alturaController.text);
    final peso = double.tryParse(pesoController.text);

    if (altura != null && peso != null && altura > 0) {
      final imc = peso / (altura * altura);
      setState(() {
        resultadoIMC = 'Seu IMC é: ${imc.toStringAsFixed(2)}';
        mensagemResultado = obterClassificacaoIMC(imc);
      });
    } else {
      setState(() {
        resultadoIMC = 'Por favor, insira valores válidos. Caso esteja usando vírgula antes das casas decimais, use ponto.';
        mensagemResultado = '';
      });
    }
  }

  String obterClassificacaoIMC(double imc) {
    if (imc < 18.5) {
      return 'Abaixo do peso';
    } else if (imc >= 18.5 && imc < 24.9) {
      return 'Peso normal';
    } else if (imc >= 25 && imc < 29.9) {
      return 'Sobrepeso';
    } else {
      return 'Obesidade';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextField(
              controller: alturaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Altura (em metros)',
                hintText: 'Ex: 1.75',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              cursorColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: pesoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Peso (em kg)',
                hintText: 'Ex: 70',
                floatingLabelBehavior: FloatingLabelBehavior.never,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue),
                ),
              ),
              cursorColor: Colors.blue,
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    alturaController.clear();
                    pesoController.clear();
                    setState(() {
                      resultadoIMC = '';
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Limpar'),
                ),
                const SizedBox(width: 20),
                ElevatedButton(
                  onPressed: calcularIMC,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Text('Calcular'),
                ),
              ],
            ),
            const SizedBox(height: 50),
            Text(
              resultadoIMC,
              style: const TextStyle(fontSize: 22),
            ),
            const SizedBox(height: 10),
            Text(
              mensagemResultado,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
