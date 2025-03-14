import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/mensaje_no_hay_productos/mensaje_no_hay_productos_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'carrito_widget.dart' show CarritoWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarritoModel extends FlutterFlowModel<CarritoWidget> {
  ///  Local state fields for this page.

  bool validarEstadoCodigoDescuento = false;

  bool estadoCaducidadDescuento = false;

  bool activarBoton = false;

  String? codigoDescuento;

  bool invalidaPromocionCodigo = false;

  bool cuponUsado = false;

  List<dynamic> carritoFormatoR = [];
  void addToCarritoFormatoR(dynamic item) => carritoFormatoR.add(item);
  void removeFromCarritoFormatoR(dynamic item) => carritoFormatoR.remove(item);
  void removeAtIndexFromCarritoFormatoR(int index) =>
      carritoFormatoR.removeAt(index);
  void insertAtIndexInCarritoFormatoR(int index, dynamic item) =>
      carritoFormatoR.insert(index, item);
  void updateCarritoFormatoRAtIndex(int index, Function(dynamic) updateFn) =>
      carritoFormatoR[index] = updateFn(carritoFormatoR[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Carrito widget.
  ApiCallResponse? carritoCrgaPagina;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Carrito widget.
  ApiCallResponse? carritoOrdenCreada;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in IconButton widget.
  ApiCallResponse? carritoActualizado;
  // Stores action output result for [Backend Call - API (VaciarCarrito)] action in IconButton widget.
  ApiCallResponse? carritoVaciado;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in IconButton widget.
  ApiCallResponse? respuestaCarritoVaciado;
  // Stores action output result for [Backend Call - API (EliminarOrden)] action in IconButton widget.
  ApiCallResponse? vaciarCarrito;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in IconButton widget.
  ApiCallResponse? carritoClear;
  // Model for mensajeNoHayProductos component.
  late MensajeNoHayProductosModel mensajeNoHayProductosModel;
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

  // Stores action output result for [Backend Call - API (AgregarArticulosCarrito)] action in Button widget.
  ApiCallResponse? addCarrito;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? nuevocarrito;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Button widget.
  ApiCallResponse? ordenActualCreada;
  // Stores action output result for [Backend Call - API (AgregarArticulosOrdenExistente)] action in Button widget.
  ApiCallResponse? nuavosArticulosOrden;
  // Stores action output result for [Backend Call - API (ObtenerPedidoID)] action in Button widget.
  ApiCallResponse? carritoOrdenCreadaCopy;
  // Stores action output result for [Backend Call - API (NuevaOrdenCustomer)] action in Button widget.
  ApiCallResponse? orden;
  // Stores action output result for [Backend Call - API (AgregarCuponDescuento)] action in Button widget.
  ApiCallResponse? addCupon;
  // Stores action output result for [Backend Call - API (VaciarCarrito)] action in Button widget.
  ApiCallResponse? clearCarrito;
  // Stores action output result for [Backend Call - API (ObtenerCarrito)] action in Button widget.
  ApiCallResponse? actualizacionCrearOrden;
  // Stores action output result for [Backend Call - API (AgregarCuponDescuento)] action in Button widget.
  ApiCallResponse? addCuponOrdenCreada;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    mensajeNoHayProductosModel =
        createModel(context, () => MensajeNoHayProductosModel());
    divisorModel = createModel(context, () => DivisorModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    mensajeNoHayProductosModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    divisorModel.dispose();
    navbarModel.dispose();
  }
}
