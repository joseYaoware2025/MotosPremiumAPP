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
import 'package:http/http.dart' as http;

Future<dynamic> crearSesionPago(String merchantId, String apiPassword) async {
  String merchantId = "1210241";
  String apiPassword = "933c16a6a145af5f7e6e629829498fcb";
  // Codificar las credenciales en base64
  String credentials = 'merchant.$merchantId:$apiPassword';
  String encodeCredentials = base64Encode(utf8.encode(credentials));
  final String authHeader = encodeCredentials;

  // Definir la URL de la API
  final Uri url = Uri.parse(
      'https://evopaymentsmexico.gateway.mastercard.com/api/rest/version/57/merchant/$merchantId/session');

  // Cuerpo de la solicitud (payload)
  Map<String, dynamic> payload = {
    "apiOperation": "CREATE_CHECKOUT_SESSION",
    "order": {
      "amount": "100.00", // Monto
      "currency": "MXN", // Moneda
      "id": "ORDER12345", // ID del pedido
    },
    "interaction": {
      "operation": "PURCHASE",
      "returnUrl": "https://mi-ecommerce.com/checkout/return" // URL de retorno
    }
  };

  // Encabezados
  Map<String, String> headers = {
    "Authorization": "Basic $authHeader",
    "Content-Type": "application/json",
  };

  // Realizar la solicitud POST
  try {
    final response = await http.post(
      url,
      headers: headers,
      body: json.encode(payload),
    );

    // Mostrar detalles de la respuesta para depuración
    print('Status Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

    // Verificar la respuesta
    if (response.statusCode == 200 || response.statusCode == 201) {
      // Analizar la respuesta JSON
      Map<String, dynamic> responseBody = json.decode(response.body);

      // Si result es SUCCESS, entonces la sesión fue creada con éxito
      if (responseBody['result'] == 'SUCCESS') {
        // Si el campo 'session' está presente, la sesión fue creada correctamente
        if (responseBody.containsKey('session')) {
          String sessionId = responseBody['session']['id'];

          // Retornar el resultado en formato JSON
          return {
            'success': true,
            'sessionId': sessionId,
            'message': 'Sesión creada con éxito',
          };
        } else {
          // Si no se encuentra el campo 'session', mostrar un mensaje de error
          return {
            'success': false,
            'message': 'Error: la sesión no fue creada correctamente',
            'error': responseBody,
          };
        }
      } else {
        // Si el result no es SUCCESS, devolver el error
        return {
          'success': false,
          'message': 'Error en la respuesta de la API',
          'error': responseBody,
        };
      }
    } else {
      // Si el código de estado no es 200 ni 201, devolver un mensaje de error
      return {
        'success': false,
        'message':
            'Error al crear la sesión, código de estado: ${response.statusCode}',
        'error': response.body,
      };
    }
  } catch (e) {
    // Capturar errores de la solicitud
    return {
      'success': false,
      'message': 'Error de conexión o desconocido',
      'error': e.toString(),
    };
  }
}
