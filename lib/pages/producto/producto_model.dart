import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'producto_widget.dart' show ProductoWidget;
import 'package:flutter/material.dart';

class ProductoModel extends FlutterFlowModel<ProductoWidget> {
  ///  Local state fields for this page.

  List<int> productosRelacionado = [];
  void addToProductosRelacionado(int item) => productosRelacionado.add(item);
  void removeFromProductosRelacionado(int item) =>
      productosRelacionado.remove(item);
  void removeAtIndexFromProductosRelacionado(int index) =>
      productosRelacionado.removeAt(index);
  void insertAtIndexInProductosRelacionado(int index, int item) =>
      productosRelacionado.insert(index, item);
  void updateProductosRelacionadoAtIndex(int index, Function(int) updateFn) =>
      productosRelacionado[index] = updateFn(productosRelacionado[index]);

  int? cantidad;

  ///  State fields for stateful widgets in this page.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // State field(s) for CountController widget.
  int? countControllerValue;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - API (AgregarArticulosCarrito)] action in Button widget.
  ApiCallResponse? addCarrito;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? nuevocarrito;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Button widget.
  ApiCallResponse? ordenActualCreada;
  // Stores action output result for [Backend Call - API (AgregarArticulosOrdenExistente)] action in Button widget.
  ApiCallResponse? nuavosArticulosOrden;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Button widget.
  ApiCallResponse? carritoOrdenCreada;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    navbarModel.dispose();
  }
}
