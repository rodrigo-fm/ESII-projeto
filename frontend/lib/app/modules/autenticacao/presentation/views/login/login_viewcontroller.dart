import 'package:flutter/material.dart';

class LoginViewController {
  final formKey = GlobalKey<FormState>();
  final inputControllers = {
    'email': TextEditingController(),
    'password': TextEditingController(),
  };
}
