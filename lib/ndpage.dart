import 'package:bmi/input.dart';
import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult; 
  final String resultText; 
  final String inter; 
  ResultsPage(this.bmiResult,this.resultText,this.inter);

  @override
  Widget build(BuildContext context) {
    int bmi = 25;
    List<String> arr = [];
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: kTitle,
                ),
              ),
            ),
          Expanded(
            flex: 5,
            child:  ReusableCard(
              colour:Color(0xFF1D1E33) ,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultText,
                  style: result,),
                  Text(bmiResult,style: kBMI,),
                  Text(inter,style: kbody,
                  textAlign:TextAlign.center ,),
                 

                ],
              ),
            ) ,
          ),
           GestureDetector(
              onTap: () {
                Navigator.pop(context);
                  // ignore: prefer_const_constructors
                
                
              },
              child: Container(
                child: Center(child: Text('RE-CALCULATE',style: klarge,)),
                color: Color(0xFFEB1555),
                margin: EdgeInsets.only(top: 10.0),
                width: double.infinity,
                height: 80.0,
              ),
            ),
          ],
        ));
  }
}
