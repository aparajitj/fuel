import 'package:flutter/material.dart';
import 'dart:async';
import 'package:fuel/ui/signup_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  startTime() async{
   var _duration = Duration(seconds: 2);
    return Timer(_duration,(){
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => SignupPage()));

    });
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60,bottom: 15),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color(0Xfff47f16),Color(0Xfffac02e)]
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image(
            image: AssetImage('asset/logo_for_splash_screen/fuel_logo1.png'),
            height: MediaQuery.of(context).size.width-150,
            width: MediaQuery.of(context).size.width-150,
          ),

          Image(
            image: AssetImage('asset/logo_for_splash_screen/fuel_logo2.png'),
            height: MediaQuery.of(context).size.width/2,
            width: MediaQuery.of(context).size.width/2,
          ),
          SizedBox(
            height: 20,
          ),
          CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
            backgroundColor: Colors.white,

          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'powered by ',
              style: TextStyle(fontSize: 12,color: Colors.black),
              children: [
                TextSpan(
                  text: "gathrr",
            style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                )
              ]
            )

          )


        ],
      ),
    );
  }
}
