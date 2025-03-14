import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'confirmacion_pago_widget.dart' show ConfirmacionPagoWidget;
import 'package:flutter/material.dart';

class ConfirmacionPagoModel extends FlutterFlowModel<ConfirmacionPagoWidget> {
  ///  Local state fields for this page.

  int estadoPago = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (CrearPago)] action in Button widget.
  ApiCallResponse? pago;
  // Stores action output result for [Backend Call - API (ActualizarPagoOrden)] action in Button widget.
  ApiCallResponse? actulizarOrdenA;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? actualizacionCarrito;
  // Stores action output result for [Backend Call - API (ActualizarPagoOrden)] action in Button widget.
  ApiCallResponse? actulizarOrdenP;
  // Stores action output result for [Backend Call - API (ActualizarPagoOrden)] action in Button widget.
  ApiCallResponse? actulizarOrdenI;
  // Stores action output result for [Backend Call - API (ActualizarPagoOrden)] action in Button widget.
  ApiCallResponse? actulizarOrdenR;
  // Stores action output result for [Backend Call - API (ActualizarPagoOrden)] action in Button widget.
  ApiCallResponse? actulizarOrdenO;
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
