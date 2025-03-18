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
import 'refacciones_widget.dart' show RefaccionesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class RefaccionesModel extends FlutterFlowModel<RefaccionesWidget> {
  ///  Local state fields for this page.

  List<dynamic> reultadoBusqueda = [];
  void addToReultadoBusqueda(dynamic item) => reultadoBusqueda.add(item);
  void removeFromReultadoBusqueda(dynamic item) =>
      reultadoBusqueda.remove(item);
  void removeAtIndexFromReultadoBusqueda(int index) =>
      reultadoBusqueda.removeAt(index);
  void insertAtIndexInReultadoBusqueda(int index, dynamic item) =>
      reultadoBusqueda.insert(index, item);
  void updateReultadoBusquedaAtIndex(int index, Function(dynamic) updateFn) =>
      reultadoBusqueda[index] = updateFn(reultadoBusqueda[index]);

  int pagina = 1;

  String? busqueda;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in Refacciones widget.
  ApiCallResponse? pasarelaIncio;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in TextField widget.
  ApiCallResponse? busquedaEnRefacciones;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in TextField widget.
  ApiCallResponse? busquedaRefacciones;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? pasarelaReset;
  // Model for Divisor component.
  late DivisorModel divisorModel;
  // Models for CartaProducto dynamic component.
  late FlutterFlowDynamicModels<CartaProductoModel> cartaProductoModels;
  // Model for mensajeNoHayProductos component.
  late MensajeNoHayProductosModel mensajeNoHayProductosModel;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? paginaAnterior;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? paginaSiguiente;
  // Stores action output result for [Backend Call - API (SearchCategoriaProductos)] action in IconButton widget.
  ApiCallResponse? paginaAnteriorBusquedaFinal;
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
