import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'direcciones_widget.dart' show DireccionesWidget;
import 'package:flutter/material.dart';

class DireccionesModel extends FlutterFlowModel<DireccionesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Stores action output result for [Backend Call - API (AadirDireccionFacturacion)] action in IconButton widget.
  ApiCallResponse? nuevalistaElimnarF;
  // Stores action output result for [Backend Call - API (AadirDireccionEnvio)] action in IconButton widget.
  ApiCallResponse? nuevalistaElimnarE;
  // Model for Navbar component.
  late NavbarModel navbarModel;

  @override
  void initState(BuildContext context) {
    navbarModel = createModel(context, () => NavbarModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    navbarModel.dispose();
  }
}
