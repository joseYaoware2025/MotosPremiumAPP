import '';
import '/backend/api_requests/api_calls.dart';
import '/components/divisor/divisor_widget.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'carrito_compra_inmediata_widget.dart' show CarritoCompraInmediataWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

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
