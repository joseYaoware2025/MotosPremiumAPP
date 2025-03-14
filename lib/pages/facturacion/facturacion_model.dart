import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'facturacion_widget.dart' show FacturacionWidget;
import 'package:flutter/material.dart';

class FacturacionModel extends FlutterFlowModel<FacturacionWidget> {
  ///  Local state fields for this page.

  bool nombreVacio = false;

  bool rfcVacio = false;

  bool cfdiVacio = false;

  bool pf = false;

  bool pm = false;

  List<String> seleccion = [];
  void addToSeleccion(String item) => seleccion.add(item);
  void removeFromSeleccion(String item) => seleccion.remove(item);
  void removeAtIndexFromSeleccion(int index) => seleccion.removeAt(index);
  void insertAtIndexInSeleccion(int index, String item) =>
      seleccion.insert(index, item);
  void updateSeleccionAtIndex(int index, Function(String) updateFn) =>
      seleccion[index] = updateFn(seleccion[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Backend Call - API (AgregarDatosDeFacturacion)] action in Button widget.
  ApiCallResponse? datosFacturacionFisica;
  // Stores action output result for [Backend Call - API (AgregarDatosDeFacturacion)] action in Button widget.
  ApiCallResponse? datosFacturacionMoral;
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

  /// Additional helper methods.
  String? get radioButtonValue => radioButtonValueController?.value;
}
