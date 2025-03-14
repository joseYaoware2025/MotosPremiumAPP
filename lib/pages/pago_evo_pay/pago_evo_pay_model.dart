import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'pago_evo_pay_widget.dart' show PagoEvoPayWidget;
import 'package:flutter/material.dart';

class PagoEvoPayModel extends FlutterFlowModel<PagoEvoPayWidget> {
  ///  Local state fields for this page.

  String? urlPago;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Custom Action - crearSesionPago] action in PagoEvoPay widget.
  dynamic crearSesionPago;
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
