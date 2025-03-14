import '/backend/api_requests/api_calls.dart';
import '/components/card_orden/card_orden_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'seguimiento_pedidos_widget.dart' show SeguimientoPedidosWidget;
import 'package:flutter/material.dart';

class SeguimientoPedidosModel
    extends FlutterFlowModel<SeguimientoPedidosWidget> {
  ///  Local state fields for this page.

  List<dynamic> tab1 = [];
  void addToTab1(dynamic item) => tab1.add(item);
  void removeFromTab1(dynamic item) => tab1.remove(item);
  void removeAtIndexFromTab1(int index) => tab1.removeAt(index);
  void insertAtIndexInTab1(int index, dynamic item) => tab1.insert(index, item);
  void updateTab1AtIndex(int index, Function(dynamic) updateFn) =>
      tab1[index] = updateFn(tab1[index]);

  List<dynamic> tab2 = [];
  void addToTab2(dynamic item) => tab2.add(item);
  void removeFromTab2(dynamic item) => tab2.remove(item);
  void removeAtIndexFromTab2(int index) => tab2.removeAt(index);
  void insertAtIndexInTab2(int index, dynamic item) => tab2.insert(index, item);
  void updateTab2AtIndex(int index, Function(dynamic) updateFn) =>
      tab2[index] = updateFn(tab2[index]);

  List<dynamic> tab3 = [];
  void addToTab3(dynamic item) => tab3.add(item);
  void removeFromTab3(dynamic item) => tab3.remove(item);
  void removeAtIndexFromTab3(int index) => tab3.removeAt(index);
  void insertAtIndexInTab3(int index, dynamic item) => tab3.insert(index, item);
  void updateTab3AtIndex(int index, Function(dynamic) updateFn) =>
      tab3[index] = updateFn(tab3[index]);

  List<dynamic> tab4 = [];
  void addToTab4(dynamic item) => tab4.add(item);
  void removeFromTab4(dynamic item) => tab4.remove(item);
  void removeAtIndexFromTab4(int index) => tab4.removeAt(index);
  void insertAtIndexInTab4(int index, dynamic item) => tab4.insert(index, item);
  void updateTab4AtIndex(int index, Function(dynamic) updateFn) =>
      tab4[index] = updateFn(tab4[index]);

  List<dynamic> tab5 = [];
  void addToTab5(dynamic item) => tab5.add(item);
  void removeFromTab5(dynamic item) => tab5.remove(item);
  void removeAtIndexFromTab5(int index) => tab5.removeAt(index);
  void insertAtIndexInTab5(int index, dynamic item) => tab5.insert(index, item);
  void updateTab5AtIndex(int index, Function(dynamic) updateFn) =>
      tab5[index] = updateFn(tab5[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (PedidosStatus)] action in SeguimientoPedidos widget.
  ApiCallResponse? cargatab1;
  // Stores action output result for [Backend Call - API (PedidosStatus)] action in SeguimientoPedidos widget.
  ApiCallResponse? recargartab2;
  // Stores action output result for [Backend Call - API (PedidosStatus)] action in SeguimientoPedidos widget.
  ApiCallResponse? recargartab3;
  // Stores action output result for [Backend Call - API (PedidosStatus)] action in SeguimientoPedidos widget.
  ApiCallResponse? recargartab4;
  // Stores action output result for [Backend Call - API (HistorialDepedidos)] action in SeguimientoPedidos widget.
  ApiCallResponse? recargartab5;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (PedidosStatus)] action in Tab widget.
  ApiCallResponse? recargartab1;
  // Stores action output result for [Backend Call - API (PedidosStatus)] action in Tab widget.
  ApiCallResponse? recargartab22;
  // Models for CardOrden dynamic component.
  late FlutterFlowDynamicModels<CardOrdenModel> cardOrdenModels1;
  // Stores action output result for [Backend Call - API (PedidosStatus)] action in Tab widget.
  ApiCallResponse? recargartab32;
  // Models for CardOrden dynamic component.
  late FlutterFlowDynamicModels<CardOrdenModel> cardOrdenModels2;
  // Stores action output result for [Backend Call - API (PedidosStatus)] action in Tab widget.
  ApiCallResponse? recargartab42;
  // Models for CardOrden dynamic component.
  late FlutterFlowDynamicModels<CardOrdenModel> cardOrdenModels3;
  // Stores action output result for [Backend Call - API (HistorialDepedidos)] action in Tab widget.
  ApiCallResponse? recargartab52;
  // Models for CardOrden dynamic component.
  late FlutterFlowDynamicModels<CardOrdenModel> cardOrdenModels4;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    cardOrdenModels1 = FlutterFlowDynamicModels(() => CardOrdenModel());
    cardOrdenModels2 = FlutterFlowDynamicModels(() => CardOrdenModel());
    cardOrdenModels3 = FlutterFlowDynamicModels(() => CardOrdenModel());
    cardOrdenModels4 = FlutterFlowDynamicModels(() => CardOrdenModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    cardOrdenModels1.dispose();
    cardOrdenModels2.dispose();
    cardOrdenModels3.dispose();
    cardOrdenModels4.dispose();
    navbarModel.dispose();
  }
}
