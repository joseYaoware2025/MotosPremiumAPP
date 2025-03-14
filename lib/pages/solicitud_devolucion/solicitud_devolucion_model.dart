import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'solicitud_devolucion_widget.dart' show SolicitudDevolucionWidget;
import 'package:flutter/material.dart';

class SolicitudDevolucionModel
    extends FlutterFlowModel<SolicitudDevolucionWidget> {
  ///  State fields for stateful widgets in this page.

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
