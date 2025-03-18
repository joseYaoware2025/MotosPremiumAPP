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
import 'checkout_datos_facturacion_widget.dart'
    show CheckoutDatosFacturacionWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckoutDatosFacturacionModel
    extends FlutterFlowModel<CheckoutDatosFacturacionWidget> {
  ///  Local state fields for this page.

  bool estadoSeleccion = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (DeseaFactura)] action in Button widget.
  ApiCallResponse? sinfactura;
  // Stores action output result for [Backend Call - API (EditarDireccionFacturacionOrden)] action in Container widget.
  ApiCallResponse? editarDOrden;
  // Stores action output result for [Backend Call - API (DeseaFactura)] action in Container widget.
  ApiCallResponse? conFactura1;
  // Stores action output result for [Backend Call - API (EditarDireccionFacturacionOrden)] action in Container widget.
  ApiCallResponse? edicionDireccionFacturacionOrden;
  // Stores action output result for [Backend Call - API (DeseaFactura)] action in Container widget.
  ApiCallResponse? conFactura2;
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
