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
import 'dart:convert';

// Esta función toma el parámetro meta_data (un JSON o lista de objetos)
String obteneridCustomerMP(List<dynamic> metaData) {
  // Recorre la lista de meta_data para encontrar el valor con la clave '_mercadopago_customer_id'
  for (var item in metaData) {
    if (item['key'] == '_mercadopago_customer_id') {
      // Si encuentra la clave, devuelve el valor asociado a esa clave
      return item['value'];
    }
  }

  // Si no se encuentra el customer_id, devuelve un mensaje de error o valor predeterminado
  return 'No se encontró el customer_id de Mercado Pago';
}
