import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var tipPercentage = 0.0, billAmount = 0.0;

  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextField tipPercentageField = TextField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Tip %',
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          tipPercentage = double.parse(value);
        } catch (e) {
          tipPercentage = 0.0;
        }
      },
    );
    TextField billAmountField = TextField(
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Bill Amount(\$)',
      ),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (e) {
          billAmount = 0.0;
        }
      },
    );
    ElevatedButton calculatedButton = ElevatedButton(
      onPressed: () {
        double calculatedTip = billAmount * tipPercentage / 100.0;
        double total = billAmount + calculatedTip;

        AlertDialog dialog = AlertDialog(
          content: Text("Tip: \$$calculatedTip\n"
              "Total: \$$total"),
        );
        showDialog(context: context, builder: (BuildContext context) => dialog);
      },
      child: Text("Calculate"),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tip Calculator"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [billAmountField, tipPercentageField, calculatedButton],
        ),
      ),
    );
  }
}
