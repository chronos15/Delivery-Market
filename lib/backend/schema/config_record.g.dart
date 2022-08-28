// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ConfigRecord> _$configRecordSerializer =
    new _$ConfigRecordSerializer();

class _$ConfigRecordSerializer implements StructuredSerializer<ConfigRecord> {
  @override
  final Iterable<Type> types = const [ConfigRecord, _$ConfigRecord];
  @override
  final String wireName = 'ConfigRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ConfigRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.razSocial;
    if (value != null) {
      result
        ..add('razSocial')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.nomeFant;
    if (value != null) {
      result
        ..add('nomeFant')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.cnpj;
    if (value != null) {
      result
        ..add('cnpj')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.logoEmp;
    if (value != null) {
      result
        ..add('logoEmp')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.metaDiaria;
    if (value != null) {
      result
        ..add('metaDiaria')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.metaSemanal;
    if (value != null) {
      result
        ..add('metaSemanal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.metaMensal;
    if (value != null) {
      result
        ..add('metaMensal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.carroselImg;
    if (value != null) {
      result
        ..add('carroselImg')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.reference;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    return result;
  }

  @override
  ConfigRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ConfigRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'razSocial':
          result.razSocial = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'nomeFant':
          result.nomeFant = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'cnpj':
          result.cnpj = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'logoEmp':
          result.logoEmp = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'metaDiaria':
          result.metaDiaria = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'metaSemanal':
          result.metaSemanal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'metaMensal':
          result.metaMensal = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'carroselImg':
          result.carroselImg.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'Document__Reference__Field':
          result.reference = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
      }
    }

    return result.build();
  }
}

class _$ConfigRecord extends ConfigRecord {
  @override
  final String razSocial;
  @override
  final String nomeFant;
  @override
  final String cnpj;
  @override
  final String logoEmp;
  @override
  final double metaDiaria;
  @override
  final double metaSemanal;
  @override
  final double metaMensal;
  @override
  final BuiltList<String> carroselImg;
  @override
  final DocumentReference<Object> reference;

  factory _$ConfigRecord([void Function(ConfigRecordBuilder) updates]) =>
      (new ConfigRecordBuilder()..update(updates))._build();

  _$ConfigRecord._(
      {this.razSocial,
      this.nomeFant,
      this.cnpj,
      this.logoEmp,
      this.metaDiaria,
      this.metaSemanal,
      this.metaMensal,
      this.carroselImg,
      this.reference})
      : super._();

  @override
  ConfigRecord rebuild(void Function(ConfigRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ConfigRecordBuilder toBuilder() => new ConfigRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ConfigRecord &&
        razSocial == other.razSocial &&
        nomeFant == other.nomeFant &&
        cnpj == other.cnpj &&
        logoEmp == other.logoEmp &&
        metaDiaria == other.metaDiaria &&
        metaSemanal == other.metaSemanal &&
        metaMensal == other.metaMensal &&
        carroselImg == other.carroselImg &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc($jc(0, razSocial.hashCode),
                                    nomeFant.hashCode),
                                cnpj.hashCode),
                            logoEmp.hashCode),
                        metaDiaria.hashCode),
                    metaSemanal.hashCode),
                metaMensal.hashCode),
            carroselImg.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ConfigRecord')
          ..add('razSocial', razSocial)
          ..add('nomeFant', nomeFant)
          ..add('cnpj', cnpj)
          ..add('logoEmp', logoEmp)
          ..add('metaDiaria', metaDiaria)
          ..add('metaSemanal', metaSemanal)
          ..add('metaMensal', metaMensal)
          ..add('carroselImg', carroselImg)
          ..add('reference', reference))
        .toString();
  }
}

class ConfigRecordBuilder
    implements Builder<ConfigRecord, ConfigRecordBuilder> {
  _$ConfigRecord _$v;

  String _razSocial;
  String get razSocial => _$this._razSocial;
  set razSocial(String razSocial) => _$this._razSocial = razSocial;

  String _nomeFant;
  String get nomeFant => _$this._nomeFant;
  set nomeFant(String nomeFant) => _$this._nomeFant = nomeFant;

  String _cnpj;
  String get cnpj => _$this._cnpj;
  set cnpj(String cnpj) => _$this._cnpj = cnpj;

  String _logoEmp;
  String get logoEmp => _$this._logoEmp;
  set logoEmp(String logoEmp) => _$this._logoEmp = logoEmp;

  double _metaDiaria;
  double get metaDiaria => _$this._metaDiaria;
  set metaDiaria(double metaDiaria) => _$this._metaDiaria = metaDiaria;

  double _metaSemanal;
  double get metaSemanal => _$this._metaSemanal;
  set metaSemanal(double metaSemanal) => _$this._metaSemanal = metaSemanal;

  double _metaMensal;
  double get metaMensal => _$this._metaMensal;
  set metaMensal(double metaMensal) => _$this._metaMensal = metaMensal;

  ListBuilder<String> _carroselImg;
  ListBuilder<String> get carroselImg =>
      _$this._carroselImg ??= new ListBuilder<String>();
  set carroselImg(ListBuilder<String> carroselImg) =>
      _$this._carroselImg = carroselImg;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ConfigRecordBuilder() {
    ConfigRecord._initializeBuilder(this);
  }

  ConfigRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _razSocial = $v.razSocial;
      _nomeFant = $v.nomeFant;
      _cnpj = $v.cnpj;
      _logoEmp = $v.logoEmp;
      _metaDiaria = $v.metaDiaria;
      _metaSemanal = $v.metaSemanal;
      _metaMensal = $v.metaMensal;
      _carroselImg = $v.carroselImg?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ConfigRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ConfigRecord;
  }

  @override
  void update(void Function(ConfigRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ConfigRecord build() => _build();

  _$ConfigRecord _build() {
    _$ConfigRecord _$result;
    try {
      _$result = _$v ??
          new _$ConfigRecord._(
              razSocial: razSocial,
              nomeFant: nomeFant,
              cnpj: cnpj,
              logoEmp: logoEmp,
              metaDiaria: metaDiaria,
              metaSemanal: metaSemanal,
              metaMensal: metaMensal,
              carroselImg: _carroselImg?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'carroselImg';
        _carroselImg?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ConfigRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
