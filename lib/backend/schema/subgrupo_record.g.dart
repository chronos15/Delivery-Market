// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subgrupo_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<SubgrupoRecord> _$subgrupoRecordSerializer =
    new _$SubgrupoRecordSerializer();

class _$SubgrupoRecordSerializer
    implements StructuredSerializer<SubgrupoRecord> {
  @override
  final Iterable<Type> types = const [SubgrupoRecord, _$SubgrupoRecord];
  @override
  final String wireName = 'SubgrupoRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, SubgrupoRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.nome;
    if (value != null) {
      result
        ..add('nome')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.codgrupo;
    if (value != null) {
      result
        ..add('codgrupo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
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
  SubgrupoRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new SubgrupoRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'nome':
          result.nome = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codgrupo':
          result.codgrupo = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
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

class _$SubgrupoRecord extends SubgrupoRecord {
  @override
  final String nome;
  @override
  final DocumentReference<Object> codgrupo;
  @override
  final DocumentReference<Object> reference;

  factory _$SubgrupoRecord([void Function(SubgrupoRecordBuilder) updates]) =>
      (new SubgrupoRecordBuilder()..update(updates))._build();

  _$SubgrupoRecord._({this.nome, this.codgrupo, this.reference}) : super._();

  @override
  SubgrupoRecord rebuild(void Function(SubgrupoRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  SubgrupoRecordBuilder toBuilder() =>
      new SubgrupoRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is SubgrupoRecord &&
        nome == other.nome &&
        codgrupo == other.codgrupo &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, nome.hashCode), codgrupo.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'SubgrupoRecord')
          ..add('nome', nome)
          ..add('codgrupo', codgrupo)
          ..add('reference', reference))
        .toString();
  }
}

class SubgrupoRecordBuilder
    implements Builder<SubgrupoRecord, SubgrupoRecordBuilder> {
  _$SubgrupoRecord _$v;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  DocumentReference<Object> _codgrupo;
  DocumentReference<Object> get codgrupo => _$this._codgrupo;
  set codgrupo(DocumentReference<Object> codgrupo) =>
      _$this._codgrupo = codgrupo;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  SubgrupoRecordBuilder() {
    SubgrupoRecord._initializeBuilder(this);
  }

  SubgrupoRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nome = $v.nome;
      _codgrupo = $v.codgrupo;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(SubgrupoRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$SubgrupoRecord;
  }

  @override
  void update(void Function(SubgrupoRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  SubgrupoRecord build() => _build();

  _$SubgrupoRecord _build() {
    final _$result = _$v ??
        new _$SubgrupoRecord._(
            nome: nome, codgrupo: codgrupo, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
