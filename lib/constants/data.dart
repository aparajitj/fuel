import 'package:flutter/material.dart';

String name;
String email_id;
int contact_number;
String password;

List userDetails = [
  name,
  email_id,
  contact_number,
  password,
];

TextEditingController customer_name_controller = new TextEditingController();
TextEditingController customer_email_id_controller = new TextEditingController();
TextEditingController customer_contact_number_controller = new TextEditingController();
TextEditingController customer_password_controller= new TextEditingController();

List userDetails_controller = [
  customer_name_controller,
  customer_email_id_controller,
  customer_contact_number_controller,
  customer_password_controller,
];

String contact_number_patttern = r'(^[6-9]\d{9}$)';
RegExp contact_number_exp = new RegExp(contact_number_patttern);

Pattern emailid_pattern =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp emailid_exp = new RegExp(emailid_pattern);

bool autoValidation = false;
bool showSignupPassword = false;

bool userLogedIn = false;