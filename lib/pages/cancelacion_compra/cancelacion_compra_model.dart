import '';
import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/index.dart';
import 'cancelacion_compra_widget.dart' show CancelacionCompraWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CancelacionCompraModel extends FlutterFlowModel<CancelacionCompraWidget> {
  ///  Local state fields for this page.

  String? motivoCancelacion;

  ///  State fields for stateful widgets in this page.

  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (ActualizarStatusOrden)] action in Button widget.
  ApiCallResponse? actualizarStatusOrden;
  // Stores action output result for [Backend Call - API (MotivoCancelacionCompra)] action in Button widget.
  ApiCallResponse? addMotivoCancelacion;
  // Stores action output result for [Backend Call - API (ActualizarStatusOrden)] action in Button widget.
  ApiCallResponse? updateStatusOrden;
  // Stores action output result for [Backend Call - API (MotivoCancelacionCompra)] action in Button widget.
  ApiCallResponse? aniadirMotivoCancelacion;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    navbarModel.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
