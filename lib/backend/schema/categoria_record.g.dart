// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categoria_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoriaRecord> _$categoriaRecordSerializer =
    new _$CategoriaRecordSerializer();

class _$CategoriaRecordSerializer
    implements StructuredSerializer<CategoriaRecord> {
  @override
  final Iterable<Type> types = const [CategoriaRecord, _$CategoriaRecord];
  @override
  final String wireName = 'CategoriaRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, CategoriaRecord object,
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
    value = object.imagem;
    if (value != null) {
      result
        ..add('imagem')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.codgrupos;
    if (value != null) {
      result
        ..add('codgrupos')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(BuiltList, const [
              const FullType(DocumentReference, const [const FullType(Object)])
            ])));
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
  CategoriaRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoriaRecordBuilder();

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
        case 'imagem':
          result.imagem = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codgrupos':
          result.codgrupos.replace(serializers.deserialize(value,
              specifiedType: const FullType(BuiltList, const [
                const FullType(
                    DocumentReference, const [const FullType(Object)])
              ])) as BuiltList<Object>);
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

class _$CategoriaRecord extends CategoriaRecord {
  @override
  final String nome;
  @override
  final String imagem;
  @override
  final BuiltList<DocumentReference<Object>> codgrupos;
  @override
  final DocumentReference<Object> reference;

  factory _$CategoriaRecord([void Function(CategoriaRecordBuilder) updates]) =>
      (new CategoriaRecordBuilder()..update(updates))._build();

  _$CategoriaRecord._({this.nome, this.imagem, this.codgrupos, this.reference})
      : super._();

  @override
  CategoriaRecord rebuild(void Function(CategoriaRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoriaRecordBuilder toBuilder() =>
      new CategoriaRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoriaRecord &&
        nome == other.nome &&
        imagem == other.imagem &&
        codgrupos == other.codgrupos &&
        reference == other.reference;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, nome.hashCode), imagem.hashCode), codgrupos.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'CategoriaRecord')
          ..add('nome', nome)
          ..add('imagem', imagem)
          ..add('codgrupos', codgrupos)
          ..add('reference', reference))
        .toString();
  }
}

class CategoriaRecordBuilder
    implements Builder<CategoriaRecord, CategoriaRecordBuilder> {
  _$CategoriaRecord _$v;

  String _nome;
  String get nome => _$this._nome;
  set nome(String nome) => _$this._nome = nome;

  String _imagem;
  String get imagem => _$this._imagem;
  set imagem(String imagem) => _$this._imagem = imagem;

  ListBuilder<DocumentReference<Object>> _codgrupos;
  ListBuilder<DocumentReference<Object>> get codgrupos =>
      _$this._codgrupos ??= new ListBuilder<DocumentReference<Object>>();
  set codgrupos(ListBuilder<DocumentReference<Object>> codgrupos) =>
      _$this._codgrupos = codgrupos;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  CategoriaRecordBuilder() {
    CategoriaRecord._initializeBuilder(this);
  }

  CategoriaRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _nome = $v.nome;
      _imagem = $v.imagem;
      _codgrupos = $v.codgrupos?.toBuilder();
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoriaRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoriaRecord;
  }

  @override
  void update(void Function(CategoriaRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  CategoriaRecord build() => _build();

  _$CategoriaRecord _build() {
    _$CategoriaRecord _$result;
    try {
      _$result = _$v ??
          new _$CategoriaRecord._(
              nome: nome,
              imagem: imagem,
              codgrupos: _codgrupos?.build(),
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'codgrupos';
        _codgrupos?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'CategoriaRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
