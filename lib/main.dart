import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key,}) : super(key: key);
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _numberControllerA = TextEditingController();
  final _numberControllerB = TextEditingController();

  double a = 0;
  double b = 0;
  double c = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Column(
          children: <Widget>[
            const SizedBox(
              height: 48,
            ),
            Row(
              children: <Widget>[
                  const SizedBox(
                    width: 16,
                  ),
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: _numberControllerA,
                      decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (text) {
                        setState(() {
                          a = double.parse(text);
                        });
                      },
                   ),
                  ),
                const SizedBox(
                  width: 16,
                ),
                  SizedBox(
                    width: 180,
                    child: TextField(
                      controller: _numberControllerB,
                      decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (text) { // ★
                        setState(() {
                          b = double.parse(text);
                        });
                      },
                   ),
                  ),
                const SizedBox(
                  width: 48,
                ),
                Text(
                  '結果：$c'
                  ),
                ],
            ),
            const SizedBox(
              height: 48,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 200,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      c = a + b;
                    });
                  },
                  child: const Text('＋'),
                ),
                const SizedBox(
                  width: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      c = a - b;
                    });
                  },
                  child: const Text('ー'),
                ),
                const SizedBox(
                  width: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      c = a * b;
                    });
                  },
                  child: const Text('×'),
                ),
                const SizedBox(
                  width: 32,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      c = a / b;
                    });
                  },
                  child: const Text('÷'),
                ),
              ],
            )
          ]
      ),
    );
  }
}
