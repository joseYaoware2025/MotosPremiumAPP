import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'datos_tarjeta_completar_widget.dart' show DatosTarjetaCompletarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatosTarjetaCompletarModel
    extends FlutterFlowModel<DatosTarjetaCompletarWidget> {
  ///  Local state fields for this page.

  String? cvv;

  bool datosIncompletos = false;

  String? tokenTarjeta;

  bool cvvInvalido = false;

  bool numeroInvalido = false;

  int? numeroTarjeta;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  final textFieldMask1 = MaskTextInputFormatter(mask: '################');
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  final textFieldMask2 = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Backend Call - API (Obtener token card)] action in Button widget.
  ApiCallResponse? obtenerToken;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    navbarModel.dispose();
  }
}
