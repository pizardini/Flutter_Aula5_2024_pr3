import 'package:flutter/material.dart';

void main() {
  runApp(const CalculadoraApp());
}

class CalculadoraApp extends StatelessWidget {
  const CalculadoraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CalculadoraScreen(),
    );
  }
}


class CalculadoraScreen extends StatefulWidget {
  const CalculadoraScreen({super.key});

  @override
  _CalculadoraScreenState createState() => _CalculadoraScreenState();
}

class _CalculadoraScreenState extends State<CalculadoraScreen> {
  final TextEditingController visorController = TextEditingController();
  String operacao = '';
  double primeiroNumero = 0;
  double segundoNumero = 0;

  void inserirNumero(String numero) {
    setState(() {
      visorController.text += numero;
    });
  }

  void inserirOperacao(String op) {
    setState(() {
      if (visorController.text.isNotEmpty) {
        primeiroNumero = double.parse(visorController.text);
        operacao = op;
        visorController.clear();
      }
    });
  }

  void calcularResultado() {
    if (operacao.isNotEmpty && visorController.text.isNotEmpty) {
      segundoNumero = double.parse(visorController.text);

      setState(() {
        switch (operacao) {
          case '+':
            visorController.text = (primeiroNumero + segundoNumero).toString();
            break;
          case '-':
            visorController.text = (primeiroNumero - segundoNumero).toString();
            break;
          case '*':
            visorController.text = (primeiroNumero * segundoNumero).toString();
            break;
          case '/':
            visorController.text = (primeiroNumero / segundoNumero).toString();
            break;
        }
        operacao = ''; 
      });
    }
  }

  void limparUltimoCaractere() {
    setState(() {
      if (visorController.text.isNotEmpty) {
        visorController.text = visorController.text
            .substring(0, visorController.text.length - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Calculadora')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            TextField(
              controller: visorController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Visor',
              ),
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 30),
              readOnly: true, 
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: <Widget>[

                  for (var i = 1; i <= 9; i++)
                    ElevatedButton(
                      onPressed: () => inserirNumero(i.toString()),
                      child: Text('$i', style: const TextStyle(fontSize: 25)),
                    ),
                  ElevatedButton(
                    onPressed: () => inserirNumero('0'),
                    child: const Text('0', style: TextStyle(fontSize: 25)),
                  ),

                  ElevatedButton(
                    onPressed: () => inserirOperacao('+'),
                    child: const Text('+', style: TextStyle(fontSize: 25)),
                  ),
                  ElevatedButton(
                    onPressed: () => inserirOperacao('-'),
                    child: const Text('-', style: TextStyle(fontSize: 25)),
                  ),
                  ElevatedButton(
                    onPressed: () => inserirOperacao('*'),
                    child: const Text('*', style: TextStyle(fontSize: 25)),
                  ),
                  ElevatedButton(
                    onPressed: () => inserirOperacao('/'),
                    child: const Text('/', style: TextStyle(fontSize: 25)),
                  ),

                  ElevatedButton(
                    onPressed: () => inserirNumero('.'),
                    child: const Text('.', style: TextStyle(fontSize: 25)),
                  ),

                  ElevatedButton(
                    onPressed: limparUltimoCaractere,
                    child: const Text('←', style: TextStyle(fontSize: 25)),
                  ),

                  ElevatedButton(
                    onPressed: calcularResultado,
                    child: const Text('=', style: TextStyle(fontSize: 25)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
