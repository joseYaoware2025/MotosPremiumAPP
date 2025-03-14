import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pedido_widget.dart' show PedidoWidget;
import 'package:flutter/material.dart';

class PedidoModel extends FlutterFlowModel<PedidoWidget> {
  ///  Local state fields for this page.

  bool? opcionesCancelacion;

  ///  State fields for stateful widgets in this page.

  // Model for Divisor component.
  late DivisorModel divisorModel;
  // Stores action output result for [Backend Call - API (ProductoIDbuscar)] action in Container widget.
  ApiCallResponse? productoID;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    divisorModel = createModel(context, () => DivisorModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    divisorModel.dispose();
    navbarModel.dispose();
  }
}
