import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start WooCommerceAPI Group Code

class WooCommerceAPIGroup {
  static String getBaseUrl() => 'https://motospremium.com.mx';
  static Map<String, String> headers = {
    'Authorization':
        'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
  };
  static BuscarCuponesCall buscarCuponesCall = BuscarCuponesCall();
  static HistorialDepedidosCall historialDepedidosCall =
      HistorialDepedidosCall();
  static PedidosStatusCall pedidosStatusCall = PedidosStatusCall();
  static ObtenerEstadosDeMexicoCall obtenerEstadosDeMexicoCall =
      ObtenerEstadosDeMexicoCall();
  static ObtenerDirecionesUsuarioCall obtenerDirecionesUsuarioCall =
      ObtenerDirecionesUsuarioCall();
  static ObtenerDatosCustomerCall obtenerDatosCustomerCall =
      ObtenerDatosCustomerCall();
  static ModificarDatosCustomerCuentaCall modificarDatosCustomerCuentaCall =
      ModificarDatosCustomerCuentaCall();
  static ModificarDatosCustomerDireccionEnvioCall
      modificarDatosCustomerDireccionEnvioCall =
      ModificarDatosCustomerDireccionEnvioCall();
  static RegistrarNuevoCustomerCall registrarNuevoCustomerCall =
      RegistrarNuevoCustomerCall();
  static CambioContraseaCustomerCall cambioContraseaCustomerCall =
      CambioContraseaCustomerCall();
  static EditarDireccionCorreoCall editarDireccionCorreoCall =
      EditarDireccionCorreoCall();
  static NuevaOrdenCustomerCall nuevaOrdenCustomerCall =
      NuevaOrdenCustomerCall();
  static ModificarDatosCustomerDireccionFacturacionCall
      modificarDatosCustomerDireccionFacturacionCall =
      ModificarDatosCustomerDireccionFacturacionCall();
  static EditarDireccionCorreoFacturacionCall
      editarDireccionCorreoFacturacionCall =
      EditarDireccionCorreoFacturacionCall();
  static VerificarExistenciaCorreoCall verificarExistenciaCorreoCall =
      VerificarExistenciaCorreoCall();
  static PasarelaProductosCall pasarelaProductosCall = PasarelaProductosCall();
  static SearchCategoriaProductosCall searchCategoriaProductosCall =
      SearchCategoriaProductosCall();
  static CategoriasArticulosCall categoriasArticulosCall =
      CategoriasArticulosCall();
  static SearchCategoriasCall searchCategoriasCall = SearchCategoriasCall();
  static BuscarProductosCall buscarProductosCall = BuscarProductosCall();
  static SKUbusquedaEnCategoriaCall sKUbusquedaEnCategoriaCall =
      SKUbusquedaEnCategoriaCall();
  static ProductoIDbuscarCall productoIDbuscarCall = ProductoIDbuscarCall();
  static AgregarCuponDescuentoCall agregarCuponDescuentoCall =
      AgregarCuponDescuentoCall();
  static EditarDirecciondeEnvioOrdenCall editarDirecciondeEnvioOrdenCall =
      EditarDirecciondeEnvioOrdenCall();
  static EditarDireccionFacturacionOrdenCall
      editarDireccionFacturacionOrdenCall =
      EditarDireccionFacturacionOrdenCall();
  static AadirDireccionEnvioCall aadirDireccionEnvioCall =
      AadirDireccionEnvioCall();
  static EliminarDireccionAlternaCall eliminarDireccionAlternaCall =
      EliminarDireccionAlternaCall();
  static AgregarMetodoPagoOrdenCall agregarMetodoPagoOrdenCall =
      AgregarMetodoPagoOrdenCall();
  static ObtenerPedidoIDCall obtenerPedidoIDCall = ObtenerPedidoIDCall();
  static AadirCostoEnvioCall aadirCostoEnvioCall = AadirCostoEnvioCall();
  static ActualizarPagoOrdenCall actualizarPagoOrdenCall =
      ActualizarPagoOrdenCall();
  static ActualizarStatusOrdenCall actualizarStatusOrdenCall =
      ActualizarStatusOrdenCall();
  static MotivoCancelacionCompraCall motivoCancelacionCompraCall =
      MotivoCancelacionCompraCall();
  static EliminarOrdenCall eliminarOrdenCall = EliminarOrdenCall();
  static GuardarIdCustomerMPCall guardarIdCustomerMPCall =
      GuardarIdCustomerMPCall();
  static AadirDireccionFacturacionCall aadirDireccionFacturacionCall =
      AadirDireccionFacturacionCall();
  static AgregarDatosDeFacturacionCall agregarDatosDeFacturacionCall =
      AgregarDatosDeFacturacionCall();
  static DeseaFacturaCall deseaFacturaCall = DeseaFacturaCall();
  static AgregarArticulosOrdenExistenteCall agregarArticulosOrdenExistenteCall =
      AgregarArticulosOrdenExistenteCall();
}

class BuscarCuponesCall {
  Future<ApiCallResponse> call({
    String? codigoDescuento = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BuscarCupones',
      apiUrl: '${baseUrl}/wp-json/wc/v3/coupons?search=${codigoDescuento}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? codigoDescuento(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].code''',
      ));
  String? fechaExpiracion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].date_expires_gmt''',
      ));
  List<String>? compraMinima(dynamic response) => (getJsonField(
        response,
        r'''$[:].minimum_amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List? usadoPor(dynamic response) => getJsonField(
        response,
        r'''$[:].used_by''',
        true,
      ) as List?;
  List<String>? descuento(dynamic response) => (getJsonField(
        response,
        r'''$[:].amount''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class HistorialDepedidosCall {
  Future<ApiCallResponse> call({
    String? idCustomer = '',
    String? status = 'completed,processing,cancelled',
    int? perPage = 10,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'HistorialDepedidos',
      apiUrl:
          '${baseUrl}/wp-json/wc/v3/orders?customer=${idCustomer}&status=${status}&per_page=${perPage}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? status(dynamic response) => (getJsonField(
        response,
        r'''$[:].status''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? fechaPedido(dynamic response) => (getJsonField(
        response,
        r'''$[:].date_created''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  List<String>? total(dynamic response) => (getJsonField(
        response,
        r'''$[:].total''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PedidosStatusCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    String? status = '',
    int? perPage = 10,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PedidosStatus',
      apiUrl:
          '${baseUrl}/wp-json/wc/v3/orders?customer=${idCustomer}&status=${status}&per_page=${perPage}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObtenerEstadosDeMexicoCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObtenerEstadosDeMexico',
      apiUrl: '${baseUrl}/wp-json/wc/v3/data/countries/mx',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<String>? estados(dynamic response) => (getJsonField(
        response,
        r'''$.states[:].name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class ObtenerDirecionesUsuarioCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObtenerDirecionesUsuario',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObtenerDatosCustomerCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObtenerDatosCustomer',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? nombre(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.first_name''',
      ));
  String? apellidos(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_name''',
      ));
  String? nombreUsuario(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.username''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.email''',
      ));
  String? nombreD(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.billing.first_name''',
      ));
  String? apellidosD(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.billing.last_name''',
      ));
  String? direccion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.billing.address_1''',
      ));
  String? ciudad(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.billing.city''',
      ));
  String? cp(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.billing.postcode''',
      ));
  String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.billing.state''',
      ));
}

class ModificarDatosCustomerCuentaCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    String? nombre = '',
    String? apellidos = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "first_name": "${nombre}",
  "last_name": "${apellidos}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ModificarDatosCustomerCuenta',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ModificarDatosCustomerDireccionEnvioCall {
  Future<ApiCallResponse> call({
    String? nombreD = '',
    String? apellidosD = '',
    String? direccion = '',
    String? ciudad = '',
    String? estado = '',
    int? cp,
    int? idCustomer,
    String? empresa = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "shipping": {
    "first_name": "${nombreD}",
    "last_name": "${apellidosD}",
    "company": "${empresa}",
    "address_1": "${direccion}",
    "city": "${ciudad}",
    "state": "${estado}",
    "postcode": "${cp}",
    "country": "MX"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ModificarDatosCustomerDireccionEnvio',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class RegistrarNuevoCustomerCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
    String? username = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "username": "${username}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegistrarNuevoCustomer',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CambioContraseaCustomerCall {
  Future<ApiCallResponse> call({
    String? idCustomer = '',
    String? contrasea = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "password": "${contrasea}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CambioContraseaCustomer',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditarDireccionCorreoCall {
  Future<ApiCallResponse> call({
    String? idCustomer = '',
    String? email = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditarDireccionCorreo',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? mensaje(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class NuevaOrdenCustomerCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    dynamic? articulosJson,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final articulos = _serializeJson(articulosJson, true);
    final ffApiRequestBody = '''
{
  "status": "pending",
  "set_paid": false,
  "customer_id": ${idCustomer},
  "line_items": ${articulos},
  "meta_data": [
    {
      "key": "_wc_order_attribution_source_type",
      "value": "admin"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'NuevaOrdenCustomer',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? idOrden(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class ModificarDatosCustomerDireccionFacturacionCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    String? nombre = '',
    String? apellidos = '',
    String? numeroTel = '',
    String? direccion = '',
    String? ciudad = '',
    String? estado = '',
    int? cp,
    String? empresa = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "billing": {
    "first_name": "${nombre}",
    "last_name": "${apellidos}",
    "company": "${empresa}",
    "phone": "${numeroTel}",
    "address_1": "${direccion}",
    "city": "${ciudad}",
    "state": "${estado}",
    "postcode": "${cp}",
    "country": "MX"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ModificarDatosCustomerDireccionFacturacion',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditarDireccionCorreoFacturacionCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    String? email = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "billing": {
    "email": "${email}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditarDireccionCorreoFacturacion',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? codigoError(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.code''',
      ));
}

class VerificarExistenciaCorreoCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'VerificarExistenciaCorreo',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers?email=${email}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? username(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].username''',
      ));
  List<String>? nombre(dynamic response) => (getJsonField(
        response,
        r'''$[:].first_name''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class PasarelaProductosCall {
  Future<ApiCallResponse> call({
    int? perPage = 10,
    int? page = 1,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'PasarelaProductos',
      apiUrl: '${baseUrl}/wp-json/wc/v3/products?page=${page}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchCategoriaProductosCall {
  Future<ApiCallResponse> call({
    int? idCategoria,
    String? nombreProducto = '',
    String? stockStatus = 'instock',
    int? page = 1,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SearchCategoriaProductos',
      apiUrl:
          '${baseUrl}/wp-json/wc/v3/products?category=${idCategoria}&search=${nombreProducto}&stock_status=${stockStatus}&page=${page}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class CategoriasArticulosCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'CategoriasArticulos',
      apiUrl: '${baseUrl}/wp-json/wc/v3/products/categories',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SearchCategoriasCall {
  Future<ApiCallResponse> call({
    String? catProd = '',
    String? stockStatus = 'instock',
    int? perPage = 10,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SearchCategorias',
      apiUrl:
          '${baseUrl}/wp-json/wc/v3/products?category=${catProd}&stock_status=${stockStatus}&per_page=${perPage}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarProductosCall {
  Future<ApiCallResponse> call({
    String? nameProd = '',
    String? stockStatus = 'instock',
    int? perPage = 10,
    int? page = 1,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'BuscarProductos',
      apiUrl:
          '${baseUrl}/wp-json/wc/v3/products?search=${nameProd}&stock_status=${stockStatus}&page=${page}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SKUbusquedaEnCategoriaCall {
  Future<ApiCallResponse> call({
    String? sku = '',
    int? idCategoria,
    String? stockStatus = 'instock',
    int? perPage = 10,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'SKUbusquedaEnCategoria',
      apiUrl:
          '${baseUrl}/wp-json/wc/v3/products?sku=${sku}&category=${idCategoria}&stock_status=${stockStatus}&per_page=${perPage}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ProductoIDbuscarCall {
  Future<ApiCallResponse> call({
    String? idProducto = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ProductoIDbuscar',
      apiUrl: '${baseUrl}/wp-json/wc/v3/products/${idProducto}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgregarCuponDescuentoCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? cupon = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "coupon_lines": [
    {
      "code": "${cupon}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgregarCuponDescuento',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditarDirecciondeEnvioOrdenCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? nombres = '',
    String? apellidos = '',
    String? direccion = '',
    String? ciudad = '',
    String? estado = '',
    String? cp = '',
    String? empresa = '',
    String? telefono = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "shipping": {
    "first_name": "${nombres}",
    "last_name": "${apellidos}",
    "company": "${empresa}",
    "address_1": "${direccion}",
    "city": "${ciudad}",
    "state": "${estado}",
    "postcode": "${cp}",
    "country": "MX",
    "phone": "${telefono}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditarDirecciondeEnvioOrden',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EditarDireccionFacturacionOrdenCall {
  Future<ApiCallResponse> call({
    String? nombres = '',
    String? apellidos = '',
    String? empresa = '',
    String? direccion = '',
    String? ciudad = '',
    String? estado = '',
    String? cp = '',
    String? telefono = '',
    int? idOrden,
    String? email = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "billing": {
    "first_name": "${nombres}",
    "last_name": "${apellidos}",
    "company": "${empresa}",
    "address_1": "${direccion}",
    "city": "${ciudad}",
    "state": "${estado}",
    "postcode": "${cp}",
    "country": "MX",
    "phone": "${telefono}",
    "email": "${email}"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EditarDireccionFacturacionOrden',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AadirDireccionEnvioCall {
  Future<ApiCallResponse> call({
    dynamic? listaDireccionesJson,
    int? idCustomer,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final listaDirecciones = _serializeJson(listaDireccionesJson, true);
    final ffApiRequestBody = '''
{
  "meta_data": [
    {
      "key": "shipping_addresses",
      "value": ${listaDirecciones}
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AadirDireccionEnvio',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EliminarDireccionAlternaCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "meta_data": [
    {
      "key": "shipping_addresses",
      "value": []
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EliminarDireccionAlterna',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgregarMetodoPagoOrdenCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? metodoPago = '',
    String? metodoPagoOrden = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
    "payment_method": "${metodoPago}",
    "payment_method_title": "${metodoPagoOrden}"
}
''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgregarMetodoPagoOrden',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObtenerPedidoIDCall {
  Future<ApiCallResponse> call({
    int? idOrden,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObtenerPedidoID',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List? costosEnvio(dynamic response) => getJsonField(
        response,
        r'''$.shipping_lines''',
        true,
      ) as List?;
}

class AadirCostoEnvioCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? costoEnvio = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "shipping_lines": [
    {
      "method_id": "flat_rate",
      "method_title": "Flat Rate",
      "total": "${costoEnvio}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AadirCostoEnvio',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActualizarPagoOrdenCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? status = '',
    String? idTransaccion = '',
    bool? statusPago,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "set_paid": ${statusPago},
  "status": "${status}",
  "transaction_id": "${idTransaccion}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ActualizarPagoOrden',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ActualizarStatusOrdenCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? statusOrden = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "status": "${statusOrden}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ActualizarStatusOrden',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class MotivoCancelacionCompraCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    String? razonCancelacion = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "status": "cancelled",
  "meta_data": [
    {
      "key": "cancel_reason",
      "value": "${razonCancelacion}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'MotivoCancelacionCompra',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EliminarOrdenCall {
  Future<ApiCallResponse> call({
    int? idOrden,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'EliminarOrden',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GuardarIdCustomerMPCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    String? idCustomerMP = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "meta_data": [
    {
      "key": "_mercadopago_customer_id",
      "value": "${idCustomerMP}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'GuardarIdCustomerMP',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AadirDireccionFacturacionCall {
  Future<ApiCallResponse> call({
    dynamic? listaDireccionesJson,
    int? idCustomer,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final listaDirecciones = _serializeJson(listaDireccionesJson, true);
    final ffApiRequestBody = '''
{
  "meta_data": [
    {
      "key": "billing_addresses",
      "value": ${listaDirecciones}
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AadirDireccionFacturacion',
      apiUrl: '${baseUrl}/wp-json/wc/v3/customers/${idCustomer}',
      callType: ApiCallType.PATCH,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgregarDatosDeFacturacionCall {
  Future<ApiCallResponse> call({
    String? idOrden = '',
    String? rfc = '',
    String? cfdi = '',
    String? regimenFiscal = '',
    String? nombre = '',
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "meta_data": [
    {
      "key": "_billing_rfc",
      "value": "${escapeStringForJson(rfc)}"
    },
    {
      "key": "_billing_uso_cfdi",
      "value": "${escapeStringForJson(cfdi)}"
    },
    {
      "key": "_billing_regimen_fiscal",
      "value": "${escapeStringForJson(regimenFiscal)}"
    },
    {
      "key": "_billing_first_name",
      "value": "${escapeStringForJson(nombre)}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgregarDatosDeFacturacion',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class DeseaFacturaCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    bool? validacion,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "meta_data": [
    {
      "key": "_wants_invoice",
      "value": "${validacion}"
    }
  ]
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'DeseaFactura',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class AgregarArticulosOrdenExistenteCall {
  Future<ApiCallResponse> call({
    int? idOrden,
    dynamic? productsJson,
  }) async {
    final baseUrl = WooCommerceAPIGroup.getBaseUrl();

    final products = _serializeJson(productsJson, true);
    final ffApiRequestBody = '''
{
  "line_items": ${products}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgregarArticulosOrdenExistente',
      apiUrl: '${baseUrl}/wp-json/wc/v3/orders/${idOrden}',
      callType: ApiCallType.PUT,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End WooCommerceAPI Group Code

/// Start Json Web Token APIs Group Code

class JsonWebTokenAPIsGroup {
  static String getBaseUrl() => 'https://motospremium.com.mx';
  static Map<String, String> headers = {};
  static ObtenerTokenCall obtenerTokenCall = ObtenerTokenCall();
}

class ObtenerTokenCall {
  Future<ApiCallResponse> call({
    String? nombreUsuario = '',
    String? contrasea = '',
  }) async {
    final baseUrl = JsonWebTokenAPIsGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "username": "${nombreUsuario}",
  "password": "${contrasea}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener Token',
      apiUrl: '${baseUrl}/wp-json/jwt-auth/v1/token',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

/// End Json Web Token APIs Group Code

/// Start EndpointCustom Group Code

class EndpointCustomGroup {
  static String getBaseUrl() => 'https://motospremium.com.mx';
  static Map<String, String> headers = {};
  static ObtenerCarritoCall obtenerCarritoCall = ObtenerCarritoCall();
  static AgregarArticulosCarritoCall agregarArticulosCarritoCall =
      AgregarArticulosCarritoCall();
  static EliminarProductoCarritoCall eliminarProductoCarritoCall =
      EliminarProductoCarritoCall();
  static VaciarCarritoCall vaciarCarritoCall = VaciarCarritoCall();
}

class ObtenerCarritoCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
  }) async {
    final baseUrl = EndpointCustomGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'ObtenerCarrito',
      apiUrl: '${baseUrl}/wp-json/miapi/v1/carrito/${idCustomer}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? precios(dynamic response) => (getJsonField(
        response,
        r'''$.products[:].price''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  double? total(dynamic response) => castToType<double>(getJsonField(
        response,
        r'''$.total''',
      ));
}

class AgregarArticulosCarritoCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    int? idProducto,
    int? cantidad,
  }) async {
    final baseUrl = EndpointCustomGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${idCustomer},
  "product_id": ${idProducto},
  "quantity": ${cantidad}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AgregarArticulosCarrito',
      apiUrl: '${baseUrl}/wp-json/miapi/v1/carrito/agregar',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class EliminarProductoCarritoCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
    int? idProducto,
  }) async {
    final baseUrl = EndpointCustomGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${idCustomer},
  "product_id": ${idProducto}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'EliminarProductoCarrito',
      apiUrl: '${baseUrl}/wp-json/miapi/v1/carrito/eliminar',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VaciarCarritoCall {
  Future<ApiCallResponse> call({
    int? idCustomer,
  }) async {
    final baseUrl = EndpointCustomGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "customer_id": ${idCustomer}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'VaciarCarrito',
      apiUrl: '${baseUrl}/wp-json/miapi/v1/carrito/vaciar',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End EndpointCustom Group Code

/// Start Mercado Pago Group Code

class MercadoPagoGroup {
  static String getBaseUrl() => 'https://api.mercadopago.com';
  static Map<String, String> headers = {
    'Authorization':
        'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
  };
  static ObtenerTokenCardCall obtenerTokenCardCall = ObtenerTokenCardCall();
  static CrearPagoCall crearPagoCall = CrearPagoCall();
  static CrearClienteCall crearClienteCall = CrearClienteCall();
  static AsociarTarjetaAClienteCall asociarTarjetaAClienteCall =
      AsociarTarjetaAClienteCall();
  static ObtenerTajetasCall obtenerTajetasCall = ObtenerTajetasCall();
  static EliminarTarjetaCall eliminarTarjetaCall = EliminarTarjetaCall();
}

class ObtenerTokenCardCall {
  Future<ApiCallResponse> call({
    String? publicKey = '',
    String? numTarjeta = '',
    String? nombreTitularTarjeta = '',
    String? codigoSeguridad = '',
    String? mesExpiracion = '',
    String? anioexpiracion = '',
    String? identificacionNumero = '',
    String? identificacionTipo = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "cardNumber": "${numTarjeta}",
  "expirationMonth": "${mesExpiracion}",
  "expirationYear": "${anioexpiracion}",
  "securityCode": "${codigoSeguridad}",
  "cardholder": {
    "name": "${nombreTitularTarjeta}",
    "identification": {
      "type": "${identificacionTipo}",
      "number": "${identificacionNumero}"
    }
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Obtener token card',
      apiUrl: '${baseUrl}/v1/card_tokens?public_key=${publicKey}',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? tokenTargeta(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? ultimosDigitos(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.last_four_digits''',
      ));
  int? anioEx(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiration_year''',
      ));
  int? mesEx(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.expiration_month''',
      ));
  String? titular(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cardholder.name''',
      ));
  String? mensajeError(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CrearPagoCall {
  Future<ApiCallResponse> call({
    String? tokenTarjeta = '',
    String? firstName = '',
    String? lastName = '',
    String? email = '',
    String? identificationType = '',
    String? identificationNumber = '',
    double? transactionAmount,
    String? cp = '',
    String? calle = '',
    String? colonia = '',
    String? ciudad = '',
    String? estado = '',
    String? idOrden = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "transaction_amount": ${transactionAmount},
  "token": "${tokenTarjeta}",
  "installments": 1,
  "payer": {
    "first_name": "${firstName}",
    "last_name": "${lastName}",
    "email": "${email}",
    "type": "customer",
    "identification": {
      "type": "${identificationType}",
      "number": "${identificationNumber}"
    },
    "address": {
      "zip_code": "${cp}",
      "street_name": "${calle}",
      "street_number": "sn",
      "neighborhood": "${colonia}",
      "city": "${ciudad}",
      "federal_unit": "${estado}"
    }
  },
  "description": "Compra de producto",
  "external_reference": "${idOrden}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CrearPago',
      apiUrl: '${baseUrl}/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? idTransaccion(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.id''',
      ));
  String? fechaCreacion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.date_created''',
      ));
  String? tipoOperacion(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.operation_type''',
      ));
  String? iDMetodoPago(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_method_id''',
      ));
  String? iDTipoPago(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.payment_type_id''',
      ));
  String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
  String? moneda(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.currency_id''',
      ));
  String? mensajeError(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class CrearClienteCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? firstName = '',
    String? lastName = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "first_name": "${firstName}",
  "last_name": "${lastName}",
  "identification": {
    "type": "RFC",
    "number": "MLM"
  }
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CrearCliente',
      apiUrl: '${baseUrl}/v1/customers',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idCustomerMP(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.id''',
      ));
}

class AsociarTarjetaAClienteCall {
  Future<ApiCallResponse> call({
    String? tokenTarjeta = '',
    String? idCustomerMP = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "token": "${tokenTarjeta}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'AsociarTarjetaACliente',
      apiUrl: '${baseUrl}/v1/customers/${idCustomerMP}/cards',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ObtenerTajetasCall {
  Future<ApiCallResponse> call({
    String? idCustomerMP = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'obtenerTajetas',
      apiUrl: '${baseUrl}/v1/customers/${idCustomerMP}/cards',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? idTarjeta(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].id''',
      ));
}

class EliminarTarjetaCall {
  Future<ApiCallResponse> call({
    String? idCustomerMP = '',
    String? idTarjeta = '',
  }) async {
    final baseUrl = MercadoPagoGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'EliminarTarjeta',
      apiUrl: '${baseUrl}/v1/customers/${idCustomerMP}/cards/${idTarjeta}',
      callType: ApiCallType.DELETE,
      headers: {
        'Authorization':
            'Bearer APP_USR-4724283823497822-031022-6d4ba9599fed35ad3e32a24fedd2f7b9-97920170',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End Mercado Pago Group Code

class ConexionInternetCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'ConexionInternet',
      apiUrl: 'https://www.google.com',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class TestApiCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'testApi',
      apiUrl:
          'https://motospremium.com.mx/wp-json/wc/v3/products?per_page=50&stock_status=instock',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Basic Y2tfNDdlM2IwYWFjOWYxZDU5NmJhNWRiOWI2NTNkNzdiNDdjOWY4YWRlZTpjc19jYTM1ODMxMjYwNWIyODgzMTM5MWNjMzkxMmJhNjcwOTAyNzU3NzE3',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
