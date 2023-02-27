import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:bmiapp/SplashScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quibble',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var weightC = TextEditingController();
  var ftC  = TextEditingController();
  var inC  = TextEditingController();
  var result = '';
  var bgColor = Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('BMI',style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),),
                const SizedBox(height:21),
                TextField(
                  controller: weightC,
                  decoration: const InputDecoration(
                    label: Text('Enter your weight (in KG): '),
                    prefixIcon: Icon(Icons.line_weight),

                  ),
                ),
                const SizedBox(height:11),
                TextField(
                  controller: ftC,
                  decoration: const InputDecoration(
                    label: Text('Enter your height (in Feet): '),
                    prefixIcon: Icon(Icons.height),

                  ),
                ),
                const SizedBox(height:11),
                TextField(
                  controller: inC,
                  decoration: const InputDecoration(
                    label: Text('Enter your height (in Inch): '),
                    prefixIcon: Icon(Icons.height),

                  ),
                ),
                const SizedBox(height:21),
                ElevatedButton(onPressed: (){
                  var wt = weightC.text.toString();
                  var ft = ftC.text.toString();
                  var inch = inC.text.toString();
                  if(wt!='' && ft!='' && inch != ''){
                    //Calculation of BMI
                    var intWt = int.parse(wt);
                    var intFt = int.parse(ft);
                    var intInch = int.parse(inch);
                    var tInch = (intFt * 12) + intInch;
                    var tCm = tInch*2.54;
                    var tM = tCm/100;
                    var bmi = intWt/(tM*tM);
                    var msg = "";
                    if(bmi > 25){
                      msg = "You need to focus on your health";
                      bgColor = Colors.orange.shade200;
                    }
                    else if(bmi < 10){
                      msg = "You need to increase your BMI";
                      bgColor = Colors.red.shade200;
                    }
                    else {
                      msg = "You're perfectly healthy!";
                      bgColor = Colors.green.shade200;
                    }
                    setState(() {
                      result = "$msg \n Your BMI : ${bmi.toStringAsFixed(2)}";
                    });
                  }
                  else {
                    setState(() {
                      result = "Invalid Input";
                    });
                  }
                },
                    child: const Text('Calculate')
                ),
                const SizedBox(height:21),
                Text(result,style: const TextStyle(
                  fontSize: 16,
                   color: Colors.deepPurple,
                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
