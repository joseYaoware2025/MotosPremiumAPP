import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carrito_compra_inmediata_widget.dart' show CarritoCompraInmediataWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarritoCompraInmediataModel
    extends FlutterFlowModel<CarritoCompraInmediataWidget> {
  ///  Local state fields for this page.

  bool validarEstadoCodigoDescuento = false;

  bool estadoCaducidadDescuento = false;

  bool activarBoton = false;

  String? codigoDescuento;

  double? subtotal;

  dynamic jsonCarrito;

  bool invalidaPromocionCodigo = false;

  bool cuponUsado = false;

  List<dynamic> carritoFormatR = [];
  void addToCarritoFormatR(dynamic item) => carritoFormatR.add(item);
  void removeFromCarritoFormatR(dynamic item) => carritoFormatR.remove(item);
  void removeAtIndexFromCarritoFormatR(int index) =>
      carritoFormatR.removeAt(index);
  void insertAtIndexInCarritoFormatR(int index, dynamic item) =>
      carritoFormatR.insert(index, item);
  void updateCarritoFormatRAtIndex(int index, Function(dynamic) updateFn) =>
      carritoFormatR[index] = updateFn(carritoFormatR[index]);

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (BuscarCupones)] action in TextField widget.
  ApiCallResponse? resultadoBusquedaCupon;
  // Model for Divisor component.
  late DivisorModel divisorModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Stores action output result for [Backend Call - API (NuevaOrdenCustomer)] action in Button widget.
  ApiCallResponse? orden;
  // Stores action output result for [Backend Call - API (AgregarCuponDescuento)] action in Button widget.
  ApiCallResponse? cuponAgregado;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    divisorModel = createModel(context, () => DivisorModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    divisorModel.dispose();
    navbarModel.dispose();
  }
}
