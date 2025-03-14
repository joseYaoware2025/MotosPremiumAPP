import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'datos_tarjeta_widget.dart' show DatosTarjetaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class DatosTarjetaModel extends FlutterFlowModel<DatosTarjetaWidget> {
  ///  Local state fields for this page.

  String? nombre;

  String? apellidos;

  String? numeroTargeta;

  String? cvv;

  String? cad;

  bool datosIncompletos = false;

  String? tokenTarjeta;

  bool cvvInvalido = false;

  bool cadInvalida = false;

  bool numeroInvalido = false;

  bool fallaTitularTarjeta = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  final textFieldMask1 = MaskTextInputFormatter(mask: '################');
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  final textFieldMask4 = MaskTextInputFormatter(mask: '##/##');
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  final textFieldMask5 = MaskTextInputFormatter(mask: '###');
  String? Function(BuildContext, String?)? textController5Validator;
  // Stores action output result for [Backend Call - API (Obtener token card)] action in Button widget.
  ApiCallResponse? obtenerToken;
  // Stores action output result for [Backend Call - API (AsociarTarjetaACliente)] action in Button widget.
  ApiCallResponse? salidaAsociarTarjeta;
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

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    textFieldFocusNode5?.dispose();
    textController5?.dispose();

    navbarModel.dispose();
  }
}
