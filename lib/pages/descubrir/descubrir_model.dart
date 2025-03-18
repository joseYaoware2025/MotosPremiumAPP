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
import 'descubrir_widget.dart' show DescubrirWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DescubrirModel extends FlutterFlowModel<DescubrirWidget> {
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

  int pagina = 1;

  String? busqueda;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (BuscarProductos)] action in Descubrir widget.
  ApiCallResponse? busquedaIncial;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (BuscarProductos)] action in TextField widget.
  ApiCallResponse? busquedaChange;
  // Stores action output result for [Backend Call - API (BuscarProductos)] action in TextField widget.
  ApiCallResponse? busqueaSubmit;
  // Stores action output result for [Backend Call - API (PasarelaProductos)] action in IconButton widget.
  ApiCallResponse? pasarelaReset;
  // Model for Divisor component.
  late DivisorModel divisorModel;
  // Models for CartaProducto dynamic component.
  late FlutterFlowDynamicModels<CartaProductoModel> cartaProductoModels;
  // Stores action output result for [Backend Call - API (BuscarProductos)] action in IconButton widget.
  ApiCallResponse? paginaAntras;
  // Stores action output result for [Backend Call - API (BuscarProductos)] action in IconButton widget.
  ApiCallResponse? paginaSiguiente;
  // Stores action output result for [Backend Call - API (BuscarProductos)] action in IconButton widget.
  ApiCallResponse? paginaAnteriorUltima;
  // Model for mensajeNoHayProductos component.
  late MensajeNoHayProductosModel mensajeNoHayProductosModel;
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
