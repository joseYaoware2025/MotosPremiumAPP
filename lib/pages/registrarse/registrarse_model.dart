import '';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'registrarse_widget.dart' show RegistrarseWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RegistrarseModel extends FlutterFlowModel<RegistrarseWidget> {
  ///  Local state fields for this page.

  bool coincidenciaContrase = true;

  bool correoValido = true;

  List<bool> contrasenaValida = [false, false, false, false];
  void addToContrasenaValida(bool item) => contrasenaValida.add(item);
  void removeFromContrasenaValida(bool item) => contrasenaValida.remove(item);
  void removeAtIndexFromContrasenaValida(int index) =>
      contrasenaValida.removeAt(index);
  void insertAtIndexInContrasenaValida(int index, bool item) =>
      contrasenaValida.insert(index, item);
  void updateContrasenaValidaAtIndex(int index, Function(bool) updateFn) =>
      contrasenaValida[index] = updateFn(contrasenaValida[index]);

  bool usernameValido = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextFieldUsername widget.
  FocusNode? textFieldUsernameFocusNode;
  TextEditingController? textFieldUsernameTextController;
  String? Function(BuildContext, String?)?
      textFieldUsernameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController4Validator;
  // Stores action output result for [Backend Call - API (RegistrarNuevoCustomer)] action in Button widget.
  ApiCallResponse? apiResultbx9;

  @override
  void initState(BuildContext context) {
    passwordVisibility1 = false;
    passwordVisibility2 = false;
  }

  @override
  void dispose() {
    textFieldUsernameFocusNode?.dispose();
    textFieldUsernameTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();
  }
}
