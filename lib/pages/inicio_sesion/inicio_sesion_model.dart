import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'inicio_sesion_widget.dart' show InicioSesionWidget;
import 'package:flutter/material.dart';

class InicioSesionModel extends FlutterFlowModel<InicioSesionWidget> {
  ///  Local state fields for this page.

  bool errorUsuario = false;

  bool errorContrase = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for Checkbox widget.
  bool? checkboxValue;
  // Stores action output result for [Backend Call - API (ConexionInternet)] action in Button widget.
  ApiCallResponse? conexionInternet;
  // Stores action output result for [Backend Call - API (Obtener Token)] action in Button widget.
  ApiCallResponse? apiResult1mc;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? carritoInicio1;
  // Stores action output result for [Backend Call - API (Obtener Token)] action in Button widget.
  ApiCallResponse? jsonToken2;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? carritoInicio2;
  // Stores action output result for [Backend Call - API (Obtener Token)] action in Button widget.
  ApiCallResponse? jsonToken3;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? carritoInicio3;
  // Stores action output result for [Backend Call - API (Obtener Token)] action in Button widget.
  ApiCallResponse? jsonToken4;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? carritoInicio4;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
