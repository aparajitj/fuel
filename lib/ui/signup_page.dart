import 'package:flutter/material.dart';
import 'package:fuel/constants/data.dart';
import 'package:fuel/ui/app_layout.dart';


class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  final GlobalKey<FormState>  form_key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      resizeToAvoidBottomPadding: false,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.arrow_back,color: Colors.black,),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:10.0,bottom: 20,right: 20,left: 20),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Create Profile",textAlign:TextAlign.left,style: TextStyle(
                    color: Colors.black87,fontSize: 35,fontWeight: FontWeight.bold
                ),),
                Theme(
                  data: ThemeData(
                    primaryColor: Colors.amber,
                    primaryColorDark: Colors.red,
                  ),

                  child: Form(
                    autovalidate: autoValidation,
                    key: form_key,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        drawText_form_field(labelText: 'NAME',leadingIcons: Icon(Icons.person), hintText: 'Enter Your Name',userDetailIndex: 0,globalKey: form_key,keyboardType: TextInputType.text ,userDetailControllerIndex: 0, validationFunction: ( values){
                          return values.isEmpty?
                          'Name is required':
                          null;
                        },),
                        drawText_form_field(labelText: 'Email ',leadingIcons: Icon(Icons.email), hintText: 'Enter Your Email',userDetailIndex: 1,globalKey: form_key,keyboardType: TextInputType.text,userDetailControllerIndex: 1,validationFunction: (values){
                          return values.isEmpty?
                          'Email is required':
                          !emailid_exp.hasMatch(values)?'Please enter valid Email':null;

                        },),
                        drawText_form_field(labelText: 'MOBILE NUMBER',leadingIcons: Icon(Icons.phone), hintText: 'Enter Your Mobile Number',userDetailIndex: 2,globalKey: form_key,keyboardType: TextInputType.number,userDetailControllerIndex: 2, validationFunction: (values){
                          return values.isEmpty?
                          'Mobile number is required':
                          !contact_number_exp.hasMatch(values)?'Enter a valid Contact detail.':null;

                        },),
                        drawText_form_field(labelText: 'Password',leadingIcons: Icon(Icons.lock), hintText: 'Enter a Password',userDetailIndex: 3,globalKey: form_key,keyboardType: TextInputType.text,userDetailControllerIndex: 3,endingIcons: IconButton(
                          icon: Icon(
                              Icons.remove_red_eye,
                          ),
                        onPressed: (){
                            setState(() {
                              showSignupPassword = !showSignupPassword;
                            });
                        },),showText: showSignupPassword, validationFunction: (values){
                          return values.isEmpty?
                          "Password can't be null":
                          values.length<6?'Password must be greater than 6':null;

                        },),


                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Already a user? Login!',style: TextStyle(color: Colors.black54),)



              ],

            ),
            Container(
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                elevation: 4,
                padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                color: Color(0Xfffaa926),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Sign Up",style: TextStyle(
                    color: Colors.white,fontSize: 20,
                  )),
                ),
                onPressed: (){
                  setState(() {
                    if(!form_key.currentState.validate())
                    {
                      autoValidation = true;

                      return;
                    }

                    else
                    {
                      form_key.currentState.save();
                      customer_name_controller.clear();
                      customer_email_id_controller.clear();
                      customer_contact_number_controller.clear();
                      customer_password_controller.clear();
                      autoValidation = false;
                      userLogedIn = true;
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) =>MyHomePage() ));
                    }
                  });

                },
              ),
            )
          ],

        ),
      ) ,

    );
  }
}


class drawText_form_field extends StatelessWidget {
  final labelText;
  final validationFunction;
  final hintText;
  final userDetailIndex;
  final userDetailControllerIndex;
  final globalKey;
  final keyboardType;
  final leadingIcons;
  final endingIcons;
  final showText;
  //final bool auto_Validation;
  drawText_form_field({this.labelText,this.validationFunction,this.hintText,this.userDetailIndex,this.globalKey,this.keyboardType ,this.userDetailControllerIndex, this.leadingIcons,this.endingIcons=null ,this.showText = false} );


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userDetails_controller[userDetailControllerIndex] ,
      autofocus: true,
      keyboardType: keyboardType,
      obscureText:showText ,
      validator: validationFunction,
      onSaved: (values){
        userDetails[userDetailIndex] = values;
      },
      decoration: InputDecoration(
        //icon: leadingIcons,
        labelText: labelText,
        hintText: hintText,
        suffixIcon: endingIcons,
        prefixIcon: leadingIcons

      ),

    );
  }
}