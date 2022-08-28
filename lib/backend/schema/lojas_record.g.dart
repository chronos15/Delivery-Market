// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lojas_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<LojasRecord> _$lojasRecordSerializer = new _$LojasRecordSerializer();

class _$LojasRecordSerializer implements StructuredSerializer<LojasRecord> {
  @override
  final Iterable<Type> types = const [LojasRecord, _$LojasRecord];
  @override
  final String wireName = 'LojasRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, LojasRecord object,
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
  LojasRecord deserialize(Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new LojasRecordBuilder();

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

class _$LojasRecord extends LojasRecord {
  @override
  final String nome;
  @override
  final DocumentReference<Object> reference;

  factory _$LojasRecord([void Function(LojasRecordBuilder) updates]) =>
      (new LojasRecordBuilder()..update(updates))._build();

  _$LojasRecord._({this.nome, this.reference}) : super._();

  @override
  LojasRecord rebuild(void Function(LojasRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LojasRecordBuilder toBuilder() => new LojasRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LojasRecord &&
        nome == other.nome &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc($jc(0, nome.hashCode), reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'LojasRecord')
          ..add('nome', nome)
          ..add('reference', reference))
        .toString();
  }
}

class LojasRecordBuilder implements Builder<LojasRecord, LojasRecordBuilder> {
  _$LojasRecord _$v;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  LojasRecordBuilder() {
    LojasRecord._initializeBuilder(this);
  }

  LojasRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nome = $v.nome;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LojasRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$LojasRecord;
  }

  @override
  void update(void Function(LojasRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  LojasRecord build() => _build();

  _$LojasRecord _build() {
    final _$result =
        _$v ?? new _$LojasRecord._(nome: nome, reference: reference);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
