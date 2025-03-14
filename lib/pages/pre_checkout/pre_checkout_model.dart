import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pre_checkout_widget.dart' show PreCheckoutWidget;
import 'package:flutter/material.dart';

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
