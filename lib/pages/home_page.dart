import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String infoText = "Informe seus dados";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange[900],
          title: Text(
            "Calculadora IMC",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
              child: Text(
                  "Essa calculadora tem como objetivo informar se o seu Indice de Massa Corporal está dentro dos padrões de Saúde.",
                  style: TextStyle(fontSize: 12, color: Colors.black)),
            ),
            buildTextField("Peso", weightController),
            Divider(),
            buildTextField("Altura", heightController),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              // ignore: deprecated_member_use
              child: RaisedButton(
                color: Colors.orange[900],
                onPressed: () {
                  setState(() {
                    calcImc();
                  });
                },
                child: Text("CALCULAR", style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Text("$infoText",
                  style: TextStyle(fontSize: 22, color: Colors.orange[900])),
            )
          ],
        ));
  }

  Widget buildTextField(String label, TextEditingController c) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: TextField(
        controller: c,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: label,
        ),
      ),
    );
  }

  calcImc() {
    double weight = double.parse(weightController.text);
    double height = double.parse(heightController.text);
    double imc = weight / (height * height);

    setState(() {
      if (imc < 18.5) {
        infoText = "Abaixo do peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.5 && imc < 25) {
        infoText = "Peso normal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 25 && imc < 30) {
        infoText = "Sobrepeso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 30 && imc < 35) {
        infoText = "Obesidade 1º Grau (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 35 && imc < 40) {
        infoText = "Obesidade Severa (${imc.toStringAsPrecision(4)})";
      } else {
        infoText = "Obesidade Mórbida (${imc.toStringAsPrecision(4)})";
      }

      return infoText;
    });
  }
}
