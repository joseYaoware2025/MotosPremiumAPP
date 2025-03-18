import '';
import '/backend/api_requests/api_calls.dart';
import '/components/carta_producto/carta_producto_widget.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/mensaje_no_hay_productos/mensaje_no_hay_productos_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'accesorios_widget.dart' show AccesoriosWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AccesoriosModel extends FlutterFlowModel<AccesoriosWidget> {
  ///  Local state fields for this page.

  List<dynamic> resultadoBusqueda = [];
  void addToResultadoBusqueda(dynamic item) => resultadoBusqueda.add(item);
  void removeFromResultadoBusqueda(dynamic item) =>
      resultadoBusqueda.remove(item);
  void removeAtIndexFromResultadoBusqueda(int index) =>
      resultadoBusqueda.removeAt(index);
  void insertAtIndexInResultadoBusqueda(int index, dynamic item) =>
      resultadoBusqueda.insert(index, item);
  void updateResultadoBusquedaAtIndex(int index, Function(dynamic) updateFn) =>
      resultadoBusqueda[index] = updateFn(resultadoBusqueda[index]);

  String? busqueda;

  int pagina = 1;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in Accesorios widget.
  ApiCallResponse? cargaIncialPasarela;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in TextField widget.
  ApiCallResponse? busquedaEnAccesorios;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in TextField widget.
  ApiCallResponse? busquedaEnAccesoriosCopy;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? busquedaAccesoriosReset;
  // Model for Divisor component.
  late DivisorModel divisorModel;
  // Models for CartaProducto dynamic component.
  late FlutterFlowDynamicModels<CartaProductoModel> cartaProductoModels;
  // Model for mensajeNoHayProductos component.
  late MensajeNoHayProductosModel mensajeNoHayProductosModel;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? paginaAtras;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? paginaSiguiente;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? paginaAtrasFinal;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    divisorModel = createModel(context, () => DivisorModel());
    cartaProductoModels = FlutterFlowDynamicModels(() => CartaProductoModel());
    mensajeNoHayProductosModel =
        createModel(context, () => MensajeNoHayProductosModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    divisorModel.dispose();
    cartaProductoModels.dispose();
    mensajeNoHayProductosModel.dispose();
    navbarModel.dispose();
  }
}
