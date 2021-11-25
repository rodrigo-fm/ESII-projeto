import 'package:flutter/material.dart';

class LoginValidator {
  bool call(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    return true;
  }
}
