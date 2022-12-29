import 'package:flutter/material.dart';
import 'package:bmi_app/home.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.result,
    required this.isMale,
    required this.age,
  }) : super(key: key);

  final double result;
  final bool isMale;
  final int age;

  String get resultPhrase{
    String resultText = '';
    if(result>=30) resultText='Obese';
    else if(result>25&&30>result) resultText='OverWeight';
    else if(result>=18.5&&24.9>=result) resultText='Normal';
    else resultText='Thin';
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Center(
       child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
               Text(isMale?'Gender  :  Male ':'Gender  :  Female ',
               style: Theme.of(context).textTheme.headline1,
               ),
               const SizedBox(height: 35,),
               Text('Result : ${result.toStringAsFixed(1)}',
               style: Theme.of(context).textTheme.headline1,
               ),
               const SizedBox(height: 35,),
               Text('Healthiness  :  $resultPhrase',
               style: Theme.of(context).textTheme.headline1,
               ),
               const SizedBox(height: 35,),
               Text('Age :  $age',
               style: Theme.of(context).textTheme.headline1,
               )

        ],
       ),
    ),
    );
  }
}