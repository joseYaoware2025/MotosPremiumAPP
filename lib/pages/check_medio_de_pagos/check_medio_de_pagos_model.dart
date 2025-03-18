import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/navegacion_fuera_carrito_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'check_medio_de_pagos_widget.dart' show CheckMedioDePagosWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CheckMedioDePagosModel extends FlutterFlowModel<CheckMedioDePagosWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ObtenerDatosCustomer)] action in CheckMedioDePagos widget.
  ApiCallResponse? datosCustomer;
  // Stores action output result for [Custom Action - obteneridCustomerMP] action in CheckMedioDePagos widget.
  String? idCustomerMP;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // Stores action output result for [Backend Call - API (CrearCliente)] action in Button widget.
  ApiCallResponse? creacionCustomerMP1;
  // Stores action output result for [Backend Call - API (GuardarIdCustomerMP)] action in Button widget.
  ApiCallResponse? saveIdCustomerMP1;
  // Stores action output result for [Backend Call - API (AgregarMetodoPagoOrden)] action in Button widget.
  ApiCallResponse? addMetodoPagoOrden1;
  // Stores action output result for [Backend Call - API (CrearCliente)] action in Button widget.
  ApiCallResponse? creacionCustomerMP2;
  // Stores action output result for [Backend Call - API (GuardarIdCustomerMP)] action in Button widget.
  ApiCallResponse? saveIdCustomerMP2;
  // Stores action output result for [Backend Call - API (AgregarMetodoPagoOrden)] action in Button widget.
  ApiCallResponse? addMetodoPagoOrden2;
  // Stores action output result for [Backend Call - API (AgregarMetodoPagoOrden)] action in Button widget.
  ApiCallResponse? addMedioPagoOrden;
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

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
