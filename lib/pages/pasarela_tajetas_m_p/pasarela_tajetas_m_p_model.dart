import '/backend/api_requests/api_calls.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'pasarela_tajetas_m_p_widget.dart' show PasarelaTajetasMPWidget;
import 'package:flutter/material.dart';

class PasarelaTajetasMPModel extends FlutterFlowModel<PasarelaTajetasMPWidget> {
  ///  Local state fields for this page.

  List<dynamic> tarjetasLista = [];
  void addToTarjetasLista(dynamic item) => tarjetasLista.add(item);
  void removeFromTarjetasLista(dynamic item) => tarjetasLista.remove(item);
  void removeAtIndexFromTarjetasLista(int index) =>
      tarjetasLista.removeAt(index);
  void insertAtIndexInTarjetasLista(int index, dynamic item) =>
      tarjetasLista.insert(index, item);
  void updateTarjetasListaAtIndex(int index, Function(dynamic) updateFn) =>
      tarjetasLista[index] = updateFn(tarjetasLista[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (obtenerTajetas)] action in PasarelaTajetasMP widget.
  ApiCallResponse? tajetas;
  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Stores action output result for [Backend Call - API (obtenerTajetas)] action in IconButton widget.
  ApiCallResponse? nuevalistaTarjetasAlEliminar;
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
