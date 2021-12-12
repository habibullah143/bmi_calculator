import 'package:flutter/material.dart';

class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  _HOMEState createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double inches = 0.0;
  double result = 0.0;
  String _resultReading = "";

  String _finalResult = "";

  void _calculateBMI() {
    setState(() {
      int age = int.parse(_ageController.text);
      double height = double.parse(_heightController.text);
      inches = height * 12;
      double weight = double.parse(_weightController.text);

      if ((_ageController.text.isNotEmpty || age > 0) &&
          ((_heightController.text.isNotEmpty || height > 0) &&
              (_weightController.text.isNotEmpty || weight > 0))) {
        result = weight / (inches * inches) * 703;

        if (double.parse(result.toStringAsFixed(1)) < 18.5) {
          _resultReading = "Underweight";
          print(_resultReading);
        }

        if (double.parse(result.toStringAsFixed(1)) >= 18.5 && result < 25.0) {
          _resultReading = "Great Shape";
          print(_resultReading);
        }

        if (double.parse(result.toStringAsFixed(1)) >= 25.0 && result < 30.0) {
          _resultReading = "Overweight";
          print(_resultReading);
        }

        if (double.parse(result.toStringAsFixed(1)) >= 30.0) {
          _resultReading = "Obese";
          print(_resultReading);
        }
      } else {
        result = 0.0;
      }
    });

    _finalResult = "Your BMI: ${result.toStringAsFixed(1)}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BMI",
          style: TextStyle(fontSize: 25),
        ),
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        child: ListView(
          padding: const EdgeInsets.all(2.0),
          children: [
            Image.asset(
              "images/BMI.png",
              height: 85,
              width: 75,
            ),
            Container(
              margin: const EdgeInsets.all(3.0),
              height: 245,
              width: 290,
              color: Colors.grey.shade300,
              child: SingleChildScrollView(
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    TextField(
                      controller: _ageController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Age",
                          hintText: "E.g: 65",
                          icon: Icon(Icons.person_outline)),
                    ),
                    TextField(
                      controller: _heightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Height in feet",
                          hintText: "E.g: 6.5",
                          icon: Icon(Icons.insert_chart)),
                    ),
                    TextField(
                      controller: _weightController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                          labelText: "Weight in lb",
                          hintText: "E.g: 180",
                          icon: Icon(Icons.line_weight)),
                    ),
                    const Padding(padding: EdgeInsets.all(10.6)),
                    Container(
                        alignment: Alignment.center,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: _calculateBMI,
                          color: Colors.pinkAccent,
                          child: const Text("Calculate"),
                          textColor: Colors.white,
                        ))
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "$_finalResult",
                  style: const TextStyle(
                      color: Colors.blueAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500),
                ),
                const Padding(padding: EdgeInsets.all(5.0)),
                Text(
                  "$_resultReading",
                  style: const TextStyle(
                      color: Colors.pinkAccent,
                      fontStyle: FontStyle.italic,
                      fontSize: 19.0,
                      fontWeight: FontWeight.w500),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
