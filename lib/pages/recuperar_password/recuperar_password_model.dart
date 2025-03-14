import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'recuperar_password_widget.dart' show RecuperarPasswordWidget;
import 'package:flutter/material.dart';

class RecuperarPasswordModel extends FlutterFlowModel<RecuperarPasswordWidget> {
  ///  Local state fields for this page.

  bool correoElectronicoInvalido = false;

  List<dynamic> correoVeri = [];
  void addToCorreoVeri(dynamic item) => correoVeri.add(item);
  void removeFromCorreoVeri(dynamic item) => correoVeri.remove(item);
  void removeAtIndexFromCorreoVeri(int index) => correoVeri.removeAt(index);
  void insertAtIndexInCorreoVeri(int index, dynamic item) =>
      correoVeri.insert(index, item);
  void updateCorreoVeriAtIndex(int index, Function(dynamic) updateFn) =>
      correoVeri[index] = updateFn(correoVeri[index]);

  bool emailEnviado = false;

  bool direccionEmailValida = true;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (VerificarExistenciaCorreo)] action in Button widget.
  ApiCallResponse? verifiacacionCorreo;
  // Stores action output result for [Custom Action - envioE] action in Button widget.
  String? respuestEnvioCorreo;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
