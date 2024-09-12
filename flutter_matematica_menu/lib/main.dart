import 'package:flutter/material.dart';
import 'package:flutter_matematica_menu/soma.dart';
import 'package:flutter_matematica_menu/subtracao.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  Widget atual = const Soma();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        drawer: Drawer(
          child: Column(
            children: [
              TextButton(
                child: const Text('Soma'),
                onPressed: () {
                  setState(() {
                    atual = const Soma();
                  });
                },
              ),
              TextButton(
                child: const Text('Subtração'),
                onPressed: () {
                  setState(() {
                    atual = const Subtracao();
                  });
                },
              ),
              TextButton(
                child: const Text('Multiplicação'),
                onPressed: () {},
              ),
              TextButton(
                child: const Text('Divisão'),
                onPressed: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('Matemática'),
        ),
        body: atual,
      ),
    );
  }
}
