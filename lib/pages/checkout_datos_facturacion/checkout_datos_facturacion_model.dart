import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'checkout_datos_facturacion_widget.dart'
    show CheckoutDatosFacturacionWidget;
import 'package:flutter/material.dart';

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
