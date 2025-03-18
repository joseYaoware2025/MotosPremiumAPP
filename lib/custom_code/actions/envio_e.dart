// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> envioE(
    String? email, String? subject, String? name, String? username) async {
  email = email ?? '';
  subject = subject ?? '';
  name = name ?? '';
  username = username ?? '';

  final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
  const service_id = "service_0ri6f3o";
  const template_id = "template_dhqq5ks";
  const user_id = "aJQ2ideeLhyX6Mvda";
  final response = await http.post(url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        "service_id": service_id,
        "template_id": template_id,
        "user_id": user_id,
        "template_params": {
          "subject": subject,
          "sent_to": email,
          "namet": name,
          "username": username
        }
      }));
  return response.body;
}
