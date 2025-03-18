import '';
import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/navegacion_fuera_carrito_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'pre_checkout_widget.dart' show PreCheckoutWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class PreCheckoutModel extends FlutterFlowModel<PreCheckoutWidget> {
  ///  Local state fields for this page.

  bool estadoSeleccion = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (EditarDirecciondeEnvioOrden)] action in Container widget.
  ApiCallResponse? apiResultb65;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Container widget.
  ApiCallResponse? getOrden1;
  // Stores action output result for [Backend Call - API (AadirCostoEnvio)] action in Container widget.
  ApiCallResponse? addCostoEnvio;
  // Stores action output result for [Backend Call - API (EditarDirecciondeEnvioOrden)] action in Container widget.
  ApiCallResponse? edicionDireccionEnvioOrden;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Container widget.
  ApiCallResponse? getOrden2;
  // Stores action output result for [Backend Call - API (AadirCostoEnvio)] action in Container widget.
  ApiCallResponse? addCostoEnvio2;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
