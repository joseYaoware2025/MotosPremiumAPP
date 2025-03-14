import '/components/divisor/divisor_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_marcas_widget.dart' show CardMarcasWidget;
import 'package:flutter/material.dart';

class CardMarcasModel extends FlutterFlowModel<CardMarcasWidget> {
  ///  State fields for stateful widgets in this component.

  // Model for Divisor component.
  late DivisorModel divisorModel;

  @override
  void initState(BuildContext context) {
    divisorModel = createModel(context, () => DivisorModel());
  }

  @override
  void dispose() {
    divisorModel.dispose();
  }
}
