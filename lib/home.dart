import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isMale = true;
  double height = 160.0;
  int age=10;
  int weight=40;
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                card1view(_size, 'male'),
                card1view(_size, 'female'),
              ],
            ),
            Container(
              height: 180,
              width: _size.width,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(25),
              ),
              margin: EdgeInsets.symmetric(horizontal: _size.width * 0.025),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Height',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${height.toStringAsFixed(1)}',
                      style: Theme.of(context).textTheme.headline2,
                      ),
                     const SizedBox(width: 15,),
                      Text('CM')
                    ],
                  ),
                  Slider(
                    value: height,
                    max: 220,
                    onChanged: (double value) {
                      setState(() {
                        height = value;
                      });
                    },
                    thumbColor: Colors.teal,
                    activeColor: Colors.teal,
                    inactiveColor: Colors.white,
                  ),
                ],
              ),
            ),Row(
              children: [
                card2view(_size, context,'age'),
                card2view(_size, context, 'weight')
              ],
            ),
            GestureDetector(
              onTap: () {
                var result = weight/pow(height/100, 2);
                print(result);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Result(result: result, isMale: isMale, age: age)),);
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: _size.width,
                decoration: BoxDecoration(
                  color: Colors.teal
                ),
                child: Text('Calculate',style: Theme.of(context).textTheme.headline1,),
              ),
            )
          ],
        ),
      ),
    );
  }

  Row card2view(Size _size, BuildContext context,String _age) {
    return Row(
            children: [
              Container(
                alignment: Alignment.center,
                margin:
                       EdgeInsets.symmetric(horizontal: _size.width * 0.025, vertical: 20),
            height: 150,
            width: _size.width * 0.45,
            decoration: BoxDecoration(
              color: Colors.blueGrey,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                  Text(_age=='age'?'Age':'Weight',
                  style: Theme.of(context).textTheme.headline1,),
                  Text(_age=='age'?'$age':'$weight',style: Theme.of(context).textTheme.headline1?.copyWith(fontSize: 40),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  FloatingActionButton(onPressed: (){
                    setState(() {
                      _age=='age'?age--:weight--;
                    });
                    
                  },
                  child:const Icon(Icons.remove),
                  elevation: 0,
                  backgroundColor: Colors.teal,
                  mini: true,
                  ),SizedBox(width: 10,),
                  FloatingActionButton(onPressed: (){
                    setState(() {
                      _age=='age'?age++:weight++;
                    });
                    
                  },
                  child: Icon(Icons.add),
                  elevation: 0,
                  backgroundColor: Colors.teal,
                  mini: true,
                  ),
                    ],
                  )
              ],
            ),
              )
            ],
          );
  }

  GestureDetector card1view(Size _size, String male) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMale = !isMale;
        });
      },
      child: Container(
        margin:
            EdgeInsets.symmetric(horizontal: _size.width * 0.025, vertical: 20),
        height: 180,
        width: _size.width * 0.45,
        decoration: BoxDecoration(
          color: (isMale && male == 'male') || (!isMale && male == 'female')
              ? Colors.teal
              : Colors.blueGrey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              male == 'male' ? Icons.male : Icons.female,
              size: 100,
              color: Colors.white,
            ),
            Text(
              male == 'male' ? 'Male' : 'Female',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
