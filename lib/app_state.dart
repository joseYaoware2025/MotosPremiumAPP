import 'package:flutter/material.dart';
import '/backend/api_requests/api_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'dart:convert';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _usuarioAutenticacion =
          prefs.getString('ff_usuarioAutenticacion') ?? _usuarioAutenticacion;
    });
    _safeInit(() {
      _passwordAutenticacion =
          prefs.getString('ff_passwordAutenticacion') ?? _passwordAutenticacion;
    });
    _safeInit(() {
      _estadoRecordarContrasea = prefs.getBool('ff_estadoRecordarContrasea') ??
          _estadoRecordarContrasea;
    });
    _safeInit(() {
      _token = prefs.getString('ff_token') ?? _token;
    });
    _safeInit(() {
      _idCustomerTemporal =
          prefs.getInt('ff_idCustomerTemporal') ?? _idCustomerTemporal;
    });
    _safeInit(() {
      _validarLecturaAvisoPrivacidad =
          prefs.getBool('ff_validarLecturaAvisoPrivacidad') ??
              _validarLecturaAvisoPrivacidad;
    });
    _safeInit(() {
      _validarLecturaPoliticasDevolucion =
          prefs.getBool('ff_validarLecturaPoliticasDevolucion') ??
              _validarLecturaPoliticasDevolucion;
    });
    _safeInit(() {
      _productosRelacionadosCarrito = prefs
              .getStringList('ff_productosRelacionadosCarrito')
              ?.map(int.parse)
              .toList() ??
          _productosRelacionadosCarrito;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  int _valorSelecCat = 0;
  int get valorSelecCat => _valorSelecCat;
  set valorSelecCat(int value) {
    _valorSelecCat = value;
  }

  String _usuarioAutenticacion = '';
  String get usuarioAutenticacion => _usuarioAutenticacion;
  set usuarioAutenticacion(String value) {
    _usuarioAutenticacion = value;
    prefs.setString('ff_usuarioAutenticacion', value);
  }

  String _passwordAutenticacion = '';
  String get passwordAutenticacion => _passwordAutenticacion;
  set passwordAutenticacion(String value) {
    _passwordAutenticacion = value;
    prefs.setString('ff_passwordAutenticacion', value);
  }

  bool _estadoRecordarContrasea = false;
  bool get estadoRecordarContrasea => _estadoRecordarContrasea;
  set estadoRecordarContrasea(bool value) {
    _estadoRecordarContrasea = value;
    prefs.setBool('ff_estadoRecordarContrasea', value);
  }

  int _stockMin = 0;
  int get stockMin => _stockMin;
  set stockMin(int value) {
    _stockMin = value;
  }

  double _costoEnvio = 250.0;
  double get costoEnvio => _costoEnvio;
  set costoEnvio(double value) {
    _costoEnvio = value;
  }

  String _token = '';
  String get token => _token;
  set token(String value) {
    _token = value;
    prefs.setString('ff_token', value);
  }

  int _idCustomerTemporal = 0;
  int get idCustomerTemporal => _idCustomerTemporal;
  set idCustomerTemporal(int value) {
    _idCustomerTemporal = value;
    prefs.setInt('ff_idCustomerTemporal', value);
  }

  bool _botonCerrarSesion = false;
  bool get botonCerrarSesion => _botonCerrarSesion;
  set botonCerrarSesion(bool value) {
    _botonCerrarSesion = value;
  }

  dynamic _carrito;
  dynamic get carrito => _carrito;
  set carrito(dynamic value) {
    _carrito = value;
  }

  bool _validarLecturaAvisoPrivacidad = false;
  bool get validarLecturaAvisoPrivacidad => _validarLecturaAvisoPrivacidad;
  set validarLecturaAvisoPrivacidad(bool value) {
    _validarLecturaAvisoPrivacidad = value;
    prefs.setBool('ff_validarLecturaAvisoPrivacidad', value);
  }

  bool _validarLecturaPoliticasDevolucion = false;
  bool get validarLecturaPoliticasDevolucion =>
      _validarLecturaPoliticasDevolucion;
  set validarLecturaPoliticasDevolucion(bool value) {
    _validarLecturaPoliticasDevolucion = value;
    prefs.setBool('ff_validarLecturaPoliticasDevolucion', value);
  }

  int _idOrdenCarritoCreada = 0;
  int get idOrdenCarritoCreada => _idOrdenCarritoCreada;
  set idOrdenCarritoCreada(int value) {
    _idOrdenCarritoCreada = value;
  }

  List<int> _productosRelacionadosCarrito = [];
  List<int> get productosRelacionadosCarrito => _productosRelacionadosCarrito;
  set productosRelacionadosCarrito(List<int> value) {
    _productosRelacionadosCarrito = value;
    prefs.setStringList('ff_productosRelacionadosCarrito',
        value.map((x) => x.toString()).toList());
  }

  void addToProductosRelacionadosCarrito(int value) {
    productosRelacionadosCarrito.add(value);
    prefs.setStringList('ff_productosRelacionadosCarrito',
        _productosRelacionadosCarrito.map((x) => x.toString()).toList());
  }

  void removeFromProductosRelacionadosCarrito(int value) {
    productosRelacionadosCarrito.remove(value);
    prefs.setStringList('ff_productosRelacionadosCarrito',
        _productosRelacionadosCarrito.map((x) => x.toString()).toList());
  }

  void removeAtIndexFromProductosRelacionadosCarrito(int index) {
    productosRelacionadosCarrito.removeAt(index);
    prefs.setStringList('ff_productosRelacionadosCarrito',
        _productosRelacionadosCarrito.map((x) => x.toString()).toList());
  }

  void updateProductosRelacionadosCarritoAtIndex(
    int index,
    int Function(int) updateFn,
  ) {
    productosRelacionadosCarrito[index] =
        updateFn(_productosRelacionadosCarrito[index]);
    prefs.setStringList('ff_productosRelacionadosCarrito',
        _productosRelacionadosCarrito.map((x) => x.toString()).toList());
  }

  void insertAtIndexInProductosRelacionadosCarrito(int index, int value) {
    productosRelacionadosCarrito.insert(index, value);
    prefs.setStringList('ff_productosRelacionadosCarrito',
        _productosRelacionadosCarrito.map((x) => x.toString()).toList());
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
