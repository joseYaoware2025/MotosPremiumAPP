import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'detalles_cuenta_widget.dart' show DetallesCuentaWidget;
import 'package:flutter/material.dart';

class DetallesCuentaModel extends FlutterFlowModel<DetallesCuentaWidget> {
  ///  Local state fields for this page.

  bool validarContrasea = true;

  bool verificarContraseas = true;

  List<bool> contrasenaValida = [false, false, false, false];
  void addToContrasenaValida(bool item) => contrasenaValida.add(item);
  void removeFromContrasenaValida(bool item) => contrasenaValida.remove(item);
  void removeAtIndexFromContrasenaValida(int index) =>
      contrasenaValida.removeAt(index);
  void insertAtIndexInContrasenaValida(int index, bool item) =>
      contrasenaValida.insert(index, item);
  void updateContrasenaValidaAtIndex(int index, Function(bool) updateFn) =>
      contrasenaValida[index] = updateFn(contrasenaValida[index]);

  bool correoInvalido = false;

  ///  State fields for stateful widgets in this page.

  // Model for Divisor component.
  late DivisorModel divisorModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
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
  late bool passwordVisibility1;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController5;
  late bool passwordVisibility2;
  String? Function(BuildContext, String?)? textController5Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode6;
  TextEditingController? textController6;
  late bool passwordVisibility3;
  String? Function(BuildContext, String?)? textController6Validator;
  // Stores action output result for [Backend Call - API (CambioContraseaCustomer)] action in Button widget.
  ApiCallResponse? apiResultpzw;
  // Stores action output result for [Backend Call - API (ModificarDatosCustomerCuenta)] action in Button widget.
  ApiCallResponse? apiResultz9e;
  // Stores action output result for [Backend Call - API (EditarDireccionCorreo)] action in Button widget.
  ApiCallResponse? editarDireccionCorreo;
  // Stores action output result for [Backend Call - API (ModificarDatosCustomerCuenta)] action in Button widget.
  ApiCallResponse? actualizarDatosUsuario;
  // Stores action output result for [Backend Call - API (EditarDireccionCorreo)] action in Button widget.
  ApiCallResponse? updateDireccionCorreo;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    divisorModel = createModel(context, () => DivisorModel());
    passwordVisibility1 = false;
    passwordVisibility2 = false;
    passwordVisibility3 = false;
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    divisorModel.dispose();
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

    textFieldFocusNode6?.dispose();
    textController6?.dispose();

    navbarModel.dispose();
  }
}
