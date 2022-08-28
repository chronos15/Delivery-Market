import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/lat_lng.dart';
import 'dart:convert';

class FFAppState {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal() {
    initializePersistedState();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _fotosbanner = prefs.getStringList('ff_fotosbanner') ?? _fotosbanner;
    _Carrinho =
        prefs.getStringList('ff_Carrinho')?.map((path) => path.ref)?.toList() ??
            _Carrinho;
    _Carrinho2 = prefs
            .getStringList('ff_Carrinho2')
            ?.map((path) => path.ref)
            ?.toList() ??
        _Carrinho2;
    _email = prefs.getString('ff_email') ?? _email;
    _senha = prefs.getString('ff_senha') ?? _senha;
    _importJsonLocal = prefs.getStringList('ff_importJsonLocal')?.map((x) {
          try {
            return jsonDecode(x);
          } catch (e) {
            print("Can't decode persisted json. Error: $e.");
            return {};
          }
        })?.toList() ??
        _importJsonLocal;
  }

  SharedPreferences prefs;

  List<String> _fotosbanner = [
    'https://img.freepik.com/vetores-gratis/modelo-de-banner-horizontal-de-fast-food-americano_23-2148963071.jpg?w=2000',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-facebook-cover-design-template-f3264bb60ba044cec9bc433b9293be1e_screen.jpg?ts=1628404887'
  ];
  List<String> get fotosbanner => _fotosbanner;
  set fotosbanner(List<String> _value) {
    _fotosbanner = _value;
    prefs.setStringList('ff_fotosbanner', _value);
  }

  void addToFotosbanner(String _value) {
    _fotosbanner.add(_value);
    prefs.setStringList('ff_fotosbanner', _fotosbanner);
  }

  void removeFromFotosbanner(String _value) {
    _fotosbanner.remove(_value);
    prefs.setStringList('ff_fotosbanner', _fotosbanner);
  }

  List<DocumentReference> _Carrinho = [];
  List<DocumentReference> get Carrinho => _Carrinho;
  set Carrinho(List<DocumentReference> _value) {
    _Carrinho = _value;
    prefs.setStringList('ff_Carrinho', _value.map((x) => x.path).toList());
  }

  void addToCarrinho(DocumentReference _value) {
    _Carrinho.add(_value);
    prefs.setStringList('ff_Carrinho', _Carrinho.map((x) => x.path).toList());
  }

  void removeFromCarrinho(DocumentReference _value) {
    _Carrinho.remove(_value);
    prefs.setStringList('ff_Carrinho', _Carrinho.map((x) => x.path).toList());
  }

  List<DocumentReference> _Carrinho2 = [];
  List<DocumentReference> get Carrinho2 => _Carrinho2;
  set Carrinho2(List<DocumentReference> _value) {
    _Carrinho2 = _value;
    prefs.setStringList('ff_Carrinho2', _value.map((x) => x.path).toList());
  }

  void addToCarrinho2(DocumentReference _value) {
    _Carrinho2.add(_value);
    prefs.setStringList('ff_Carrinho2', _Carrinho2.map((x) => x.path).toList());
  }

  void removeFromCarrinho2(DocumentReference _value) {
    _Carrinho2.remove(_value);
    prefs.setStringList('ff_Carrinho2', _Carrinho2.map((x) => x.path).toList());
  }

  String _email = '';
  String get email => _email;
  set email(String _value) {
    _email = _value;
    prefs.setString('ff_email', _value);
  }

  String _senha = '';
  String get senha => _senha;
  set senha(String _value) {
    _senha = _value;
    prefs.setString('ff_senha', _value);
  }

  bool textocompleto = true;

  List<dynamic> _importJsonLocal = [];
  List<dynamic> get importJsonLocal => _importJsonLocal;
  set importJsonLocal(List<dynamic> _value) {
    _importJsonLocal = _value;
    prefs.setStringList(
        'ff_importJsonLocal', _value.map((x) => jsonEncode(x)).toList());
  }

  void addToImportJsonLocal(dynamic _value) {
    _importJsonLocal.add(_value);
    prefs.setStringList('ff_importJsonLocal',
        _importJsonLocal.map((x) => jsonEncode(x)).toList());
  }

  void removeFromImportJsonLocal(dynamic _value) {
    _importJsonLocal.remove(_value);
    prefs.setStringList('ff_importJsonLocal',
        _importJsonLocal.map((x) => jsonEncode(x)).toList());
  }
}

LatLng _latLngFromString(String val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}
