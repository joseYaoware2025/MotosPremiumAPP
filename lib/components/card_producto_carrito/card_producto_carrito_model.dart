import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'card_producto_carrito_widget.dart' show CardProductoCarritoWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardProductoCarritoModel
    extends FlutterFlowModel<CardProductoCarritoWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Backend Call - API (EliminarProductoCarrito)] action in IconButton widget.
  ApiCallResponse? apiResulttve;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
