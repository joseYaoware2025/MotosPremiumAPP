import '';
import '/backend/api_requests/api_calls.dart';
import '/components/cancelar_compra_widget.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'pedido_widget.dart' show PedidoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
