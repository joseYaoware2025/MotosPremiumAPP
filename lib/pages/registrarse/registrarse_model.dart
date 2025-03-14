import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'registrarse_widget.dart' show RegistrarseWidget;
import 'package:flutter/material.dart';

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
