import '';
import '/components/card_marcas/card_marcas_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/components/politicade_privacidad/politicade_privacidad_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'inicio_widget.dart' show InicioWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class InicioModel extends FlutterFlowModel<InicioWidget> {
  ///  Local state fields for this page.

  bool textfieldlleno = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Models for CardMarcas dynamic component.
  late FlutterFlowDynamicModels<CardMarcasModel> cardMarcasModels1;
  // Models for CardMarcas dynamic component.
  late FlutterFlowDynamicModels<CardMarcasModel> cardMarcasModels2;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    cardMarcasModels1 = FlutterFlowDynamicModels(() => CardMarcasModel());
    cardMarcasModels2 = FlutterFlowDynamicModels(() => CardMarcasModel());
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    tabBarController?.dispose();
    cardMarcasModels1.dispose();
    cardMarcasModels2.dispose();
    navbarModel.dispose();
  }
}
