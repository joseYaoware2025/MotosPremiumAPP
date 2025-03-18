import '';
import '/backend/api_requests/api_calls.dart';
import '/components/mensaje_alerta/mensaje_alerta_widget.dart';
import '/components/navbar/navbar_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'editar_direccion_de_facturacion_model.dart';
export 'editar_direccion_de_facturacion_model.dart';

class EditarDireccionDeFacturacionWidget extends StatefulWidget {
  const EditarDireccionDeFacturacionWidget({super.key});

  static String routeName = 'EditarDireccionDeFacturacion';
  static String routePath = '/editarDireccionDeFacturacion';

  @override
  State<EditarDireccionDeFacturacionWidget> createState() =>
      _EditarDireccionDeFacturacionWidgetState();
}

class _EditarDireccionDeFacturacionWidgetState
    extends State<EditarDireccionDeFacturacionWidget> {
  late EditarDireccionDeFacturacionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EditarDireccionDeFacturacionModel());

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldFocusNode4 ??= FocusNode();

    _model.textFieldFocusNode5 ??= FocusNode();

    _model.textFieldFocusNode6 ??= FocusNode();

    _model.textFieldFocusNode7 ??= FocusNode();

    _model.textFieldFocusNode8 ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return FutureBuilder<ApiCallResponse>(
      future: WooCommerceAPIGroup.obtenerDatosCustomerCall.call(
        idCustomer: FFAppState().idCustomerTemporal,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitFadingGrid(
                  color: Color(0xFF29ABE2),
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        final editarDireccionDeFacturacionObtenerDatosCustomerResponse =
            snapshot.data!;

        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: AppBar(
              backgroundColor: Colors.white,
              iconTheme: IconThemeData(color: Color(0xFFC82D2D)),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.white,
                borderRadius: 8.0,
                buttonSize: 40.0,
                fillColor: Colors.white,
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24.0,
                ),
                onPressed: () async {
                  context.safePop();
                },
              ),
              actions: [],
              centerTitle: true,
              elevation: 0.0,
            ),
            body: SafeArea(
              top: true,
              child: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Dirección de facturación',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily: 'Lato',
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        'Nombre',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController1 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.first_name''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.first_name''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode1,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController1Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Apellidos',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController2 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.last_name''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.last_name''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode2,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController2Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Empresa',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController3 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.company''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.company''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode3,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController3Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 10.0, 25.0, 0.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Text(
                                              'País / Región *',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMedium
                                                      .override(
                                                        fontFamily: 'Lato',
                                                        color: Colors.black,
                                                        fontSize: 15.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(-1.0, 0.0),
                                          child: Text(
                                            'México',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Lato',
                                                  color: Colors.black,
                                                  fontSize: 15.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 5.0, 0.0, 0.0),
                                      child: Text(
                                        'Dirección de la calle',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController4 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.address_1''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.address_1''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode4,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        hintText:
                                            'Nombre de la calle y número de la casa',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController4Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Población',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController5 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.city''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.city''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode5,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController5Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Región / Provincia',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 5.0, 0.0, 0.0),
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: WooCommerceAPIGroup
                                            .obtenerEstadosDeMexicoCall
                                            .call(),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitFadingGrid(
                                                  color: Color(0xFF29ABE2),
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          final dropDownObtenerEstadosDeMexicoResponse =
                                              snapshot.data!;

                                          return FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue ??=
                                                  getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.state''',
                                              ).toString(),
                                            ),
                                            options: List<String>.from(
                                                (getJsonField(
                                              dropDownObtenerEstadosDeMexicoResponse
                                                  .jsonBody,
                                              r'''$.states[:].name''',
                                              true,
                                            ) as List)
                                                    .map<String>(
                                                        (s) => s.toString())
                                                    .toList()!),
                                            optionLabels: WooCommerceAPIGroup
                                                .obtenerEstadosDeMexicoCall
                                                .estados(
                                              dropDownObtenerEstadosDeMexicoResponse
                                                  .jsonBody,
                                            )!,
                                            onChanged: (val) => safeSetState(
                                                () =>
                                                    _model.dropDownValue = val),
                                            width: 300.0,
                                            height: 40.0,
                                            textStyle: FlutterFlowTheme.of(
                                                    context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                            hintText: 'Estado',
                                            icon: Icon(
                                              Icons.keyboard_arrow_down_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .tertiary,
                                              size: 24.0,
                                            ),
                                            fillColor:
                                                FlutterFlowTheme.of(context)
                                                    .secondaryBackground,
                                            elevation: 2.0,
                                            borderColor:
                                                FlutterFlowTheme.of(context)
                                                    .tertiary,
                                            borderWidth: 0.0,
                                            borderRadius: 8.0,
                                            margin: EdgeInsets.all(5.0),
                                            hidesUnderline: true,
                                            isOverButton: false,
                                            isSearchable: false,
                                            isMultiSelect: false,
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Código postal / ZIP',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController6 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.postcode''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.postcode''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode6,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        '_model.textController6',
                                        Duration(milliseconds: 2000),
                                        () => safeSetState(() {}),
                                      ),
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.cpValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.cpValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.cpValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.cpValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      keyboardType: TextInputType.number,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController6Validator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask6],
                                    ),
                                  ),
                                  if (_model.cpValido == false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Código postal no valido',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFFFF0000),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Número de teléfono',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0, 5.0, 25.0, 0.0),
                                    child: TextFormField(
                                      controller: _model.textController7 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.phone''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.phone''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode7,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.telValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.telValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.telValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.telValido == true
                                                ? Colors.black
                                                : Color(0xFFFF0000),
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      keyboardType: TextInputType.number,
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController7Validator
                                          .asValidator(context),
                                      inputFormatters: [_model.textFieldMask7],
                                    ),
                                  ),
                                  if (_model.telValido == false)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 5.0, 0.0, 0.0),
                                        child: Text(
                                          'Número de télefono no valido',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFFFF0000),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          25.0, 10.0, 0.0, 0.0),
                                      child: Text(
                                        'Email',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Lato',
                                              color: Colors.black,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        25.0,
                                        5.0,
                                        25.0,
                                        valueOrDefault<double>(
                                          _model.emailInvalido == false
                                              ? 70.0
                                              : 0.0,
                                          0.0,
                                        )),
                                    child: TextFormField(
                                      controller: _model.textController8 ??=
                                          TextEditingController(
                                        text: getJsonField(
                                                  editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                      .jsonBody,
                                                  r'''$.billing.email''',
                                                ) !=
                                                null
                                            ? getJsonField(
                                                editarDireccionDeFacturacionObtenerDatosCustomerResponse
                                                    .jsonBody,
                                                r'''$.billing.email''',
                                              ).toString()
                                            : '',
                                      ),
                                      focusNode: _model.textFieldFocusNode8,
                                      autofocus: false,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.emailInvalido == true
                                                ? Color(0xFFFF0000)
                                                : Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.emailInvalido == true
                                                ? Color(0xFFFF0000)
                                                : Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.emailInvalido == true
                                                ? Color(0xFFFF0000)
                                                : Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: _model.emailInvalido == true
                                                ? Color(0xFFFF0000)
                                                : Colors.black,
                                            width: 1.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Lato',
                                            color: FlutterFlowTheme.of(context)
                                                .tertiary,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                      cursorColor:
                                          FlutterFlowTheme.of(context).tertiary,
                                      validator: _model.textController8Validator
                                          .asValidator(context),
                                    ),
                                  ),
                                  if (_model.emailInvalido == true)
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            25.0, 5.0, 0.0, 70.0),
                                        child: Text(
                                          'Dirección de correo no valida',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Lato',
                                                color: Color(0xFFFF0000),
                                                fontSize: 15.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Builder(
                                builder: (context) => Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      if ((_model.textController1.text != null && _model.textController1.text != '') &&
                                          (_model.textController2.text !=
                                                  null &&
                                              _model.textController2.text !=
                                                  '') &&
                                          (_model.textController4.text !=
                                                  null &&
                                              _model.textController4.text !=
                                                  '') &&
                                          (_model.textController5.text !=
                                                  null &&
                                              _model.textController5.text !=
                                                  '') &&
                                          (_model.dropDownValue != null &&
                                              _model.dropDownValue != '') &&
                                          (_model.textController6.text !=
                                                  null &&
                                              _model.textController6.text !=
                                                  '') &&
                                          (_model.textController7.text !=
                                                  null &&
                                              _model.textController7.text !=
                                                  '') &&
                                          (_model.textController8.text !=
                                                  null &&
                                              _model.textController8.text !=
                                                  '')) {
                                        await Future.wait([
                                          Future(() async {
                                            if (functions.validarSizeNumeros(
                                                _model.textController6.text,
                                                5)) {
                                              _model.cpValido = true;
                                              safeSetState(() {});
                                            } else {
                                              _model.cpValido = false;
                                              safeSetState(() {});
                                            }
                                          }),
                                          Future(() async {
                                            if (functions.validarSizeNumeros(
                                                _model.textController7.text,
                                                12)) {
                                              _model.telValido = true;
                                              safeSetState(() {});
                                            } else {
                                              _model.telValido = false;
                                              safeSetState(() {});
                                            }
                                          }),
                                        ]);
                                        if ((_model.cpValido == true) &&
                                            (_model.telValido == true)) {
                                          await Future.wait([
                                            Future(() async {
                                              _model.apiResultsx1 =
                                                  await WooCommerceAPIGroup
                                                      .modificarDatosCustomerDireccionFacturacionCall
                                                      .call(
                                                idCustomer: FFAppState()
                                                    .idCustomerTemporal,
                                                nombre:
                                                    _model.textController1.text,
                                                apellidos:
                                                    _model.textController2.text,
                                                direccion:
                                                    _model.textController4.text,
                                                ciudad:
                                                    _model.textController5.text,
                                                estado: _model.dropDownValue,
                                                cp: int.tryParse(_model
                                                    .textController6.text),
                                                numeroTel:
                                                    _model.textController7.text,
                                                empresa:
                                                    _model.textController3.text,
                                              );
                                            }),
                                            Future(() async {
                                              if (_model.textController8.text !=
                                                      null &&
                                                  _model.textController8.text !=
                                                      '') {
                                                _model.edicionCorreo =
                                                    await WooCommerceAPIGroup
                                                        .editarDireccionCorreoFacturacionCall
                                                        .call(
                                                  idCustomer: FFAppState()
                                                      .idCustomerTemporal,
                                                  email: _model
                                                      .textController8.text,
                                                );

                                                if (WooCommerceAPIGroup
                                                        .editarDireccionCorreoFacturacionCall
                                                        .codigoError(
                                                      (_model.edicionCorreo
                                                              ?.jsonBody ??
                                                          ''),
                                                    ) ==
                                                    'rest_invalid_param') {
                                                  _model.emailInvalido = true;
                                                  safeSetState(() {});
                                                } else {
                                                  context.safePop();
                                                }
                                              } else {
                                                context.safePop();
                                              }
                                            }),
                                          ]);
                                        }
                                      } else {
                                        await showDialog(
                                          context: context,
                                          builder: (dialogContext) {
                                            return Dialog(
                                              elevation: 0,
                                              insetPadding: EdgeInsets.zero,
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: WebViewAware(
                                                child: GestureDetector(
                                                  onTap: () {
                                                    FocusScope.of(dialogContext)
                                                        .unfocus();
                                                    FocusManager
                                                        .instance.primaryFocus
                                                        ?.unfocus();
                                                  },
                                                  child: MensajeAlertaWidget(
                                                    mensaje:
                                                        'Completa todos los campos de dirección',
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }

                                      safeSetState(() {});
                                    },
                                    text: 'Guardar',
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .secondary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Lato',
                                            color: Colors.white,
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                          ),
                                      elevation: 1.0,
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                      ),
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    wrapWithModel(
                      model: _model.navbarModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavbarWidget(
                        pagina: 'carrito',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
