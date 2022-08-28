// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produtos_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProdutosRecord> _$produtosRecordSerializer =
    new _$ProdutosRecordSerializer();

class _$ProdutosRecordSerializer
    implements StructuredSerializer<ProdutosRecord> {
  @override
  final Iterable<Type> types = const [ProdutosRecord, _$ProdutosRecord];
  @override
  final String wireName = 'ProdutosRecord';

  @override
  Iterable<Object> serialize(Serializers serializers, ProdutosRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object>[];
    Object value;
    value = object.descricao;
    if (value != null) {
      result
        ..add('descricao')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.codsubgrupo;
    if (value != null) {
      result
        ..add('codsubgrupo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.valorAvista;
    if (value != null) {
      result
        ..add('valorAvista')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.imageIcon;
    if (value != null) {
      result
        ..add('imageIcon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.gtin;
    if (value != null) {
      result
        ..add('gtin')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.ref;
    if (value != null) {
      result
        ..add('ref')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.promocao;
    if (value != null) {
      result
        ..add('promocao')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.rating;
    if (value != null) {
      result
        ..add('rating')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.quanti;
    if (value != null) {
      result
        ..add('quanti')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.codgrupo;
    if (value != null) {
      result
        ..add('codgrupo')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType(Object)])));
    }
    value = object.imagePrincipal;
    if (value != null) {
      result
        ..add('imagePrincipal')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.detalhes;
    if (value != null) {
      result
        ..add('detalhes')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.estoque;
    if (value != null) {
      result
        ..add('estoque')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.tipo;
    if (value != null) {
      result
        ..add('tipo')
        ..add(serializers.serialize(value,
            specifiedType:
                const FullType(BuiltList, const [const FullType(String)])));
    }
    value = object.unidadeS;
    if (value != null) {
      result
        ..add('unidadeS')
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
  ProdutosRecord deserialize(
      Serializers serializers, Iterable<Object> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProdutosRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object value = iterator.current;
      switch (key) {
        case 'descricao':
          result.descricao = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'codsubgrupo':
          result.codsubgrupo = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'valorAvista':
          result.valorAvista = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'image':
          result.image.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'imageIcon':
          result.imageIcon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'gtin':
          result.gtin = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'ref':
          result.ref = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'promocao':
          result.promocao = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool;
          break;
        case 'rating':
          result.rating = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int;
          break;
        case 'quanti':
          result.quanti = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'codgrupo':
          result.codgrupo = serializers.deserialize(value,
                  specifiedType: const FullType(
                      DocumentReference, const [const FullType(Object)]))
              as DocumentReference<Object>;
          break;
        case 'imagePrincipal':
          result.imagePrincipal = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'detalhes':
          result.detalhes = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String;
          break;
        case 'estoque':
          result.estoque = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double;
          break;
        case 'tipo':
          result.tipo.replace(serializers.deserialize(value,
                  specifiedType:
                      const FullType(BuiltList, const [const FullType(String)]))
              as BuiltList<Object>);
          break;
        case 'unidadeS':
          result.unidadeS = serializers.deserialize(value,
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

class _$ProdutosRecord extends ProdutosRecord {
  @override
  final String descricao;
  @override
  final DocumentReference<Object> codsubgrupo;
  @override
  final double valorAvista;
  @override
  final BuiltList<String> image;
  @override
  final String imageIcon;
  @override
  final String gtin;
  @override
  final String ref;
  @override
  final bool promocao;
  @override
  final int rating;
  @override
  final double quanti;
  @override
  final DocumentReference<Object> codgrupo;
  @override
  final String imagePrincipal;
  @override
  final String detalhes;
  @override
  final double estoque;
  @override
  final BuiltList<String> tipo;
  @override
  final String unidadeS;
  @override
  final DocumentReference<Object> reference;

  factory _$ProdutosRecord([void Function(ProdutosRecordBuilder) updates]) =>
      (new ProdutosRecordBuilder()..update(updates))._build();

  _$ProdutosRecord._(
      {this.descricao,
      this.codsubgrupo,
      this.valorAvista,
      this.image,
      this.imageIcon,
      this.gtin,
      this.ref,
      this.promocao,
      this.rating,
      this.quanti,
      this.codgrupo,
      this.imagePrincipal,
      this.detalhes,
      this.estoque,
      this.tipo,
      this.unidadeS,
      this.reference})
      : super._();

  @override
  ProdutosRecord rebuild(void Function(ProdutosRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProdutosRecordBuilder toBuilder() =>
      new ProdutosRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProdutosRecord &&
        descricao == other.descricao &&
        codsubgrupo == other.codsubgrupo &&
        valorAvista == other.valorAvista &&
        image == other.image &&
        imageIcon == other.imageIcon &&
        gtin == other.gtin &&
        ref == other.ref &&
        promocao == other.promocao &&
        rating == other.rating &&
        quanti == other.quanti &&
        codgrupo == other.codgrupo &&
        imagePrincipal == other.imagePrincipal &&
        detalhes == other.detalhes &&
        estoque == other.estoque &&
        tipo == other.tipo &&
        unidadeS == other.unidadeS &&
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
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc(
                                                $jc(
                                                    $jc(
                                                        $jc(
                                                            $jc(
                                                                $jc(
                                                                    $jc(
                                                                        0,
                                                                        descricao
                                                                            .hashCode),
                                                                    codsubgrupo
                                                                        .hashCode),
                                                                valorAvista
                                                                    .hashCode),
                                                            image.hashCode),
                                                        imageIcon.hashCode),
                                                    gtin.hashCode),
                                                ref.hashCode),
                                            promocao.hashCode),
                                        rating.hashCode),
                                    quanti.hashCode),
                                codgrupo.hashCode),
                            imagePrincipal.hashCode),
                        detalhes.hashCode),
                    estoque.hashCode),
                tipo.hashCode),
            unidadeS.hashCode),
        reference.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProdutosRecord')
          ..add('descricao', descricao)
          ..add('codsubgrupo', codsubgrupo)
          ..add('valorAvista', valorAvista)
          ..add('image', image)
          ..add('imageIcon', imageIcon)
          ..add('gtin', gtin)
          ..add('ref', ref)
          ..add('promocao', promocao)
          ..add('rating', rating)
          ..add('quanti', quanti)
          ..add('codgrupo', codgrupo)
          ..add('imagePrincipal', imagePrincipal)
          ..add('detalhes', detalhes)
          ..add('estoque', estoque)
          ..add('tipo', tipo)
          ..add('unidadeS', unidadeS)
          ..add('reference', reference))
        .toString();
  }
}

class ProdutosRecordBuilder
    implements Builder<ProdutosRecord, ProdutosRecordBuilder> {
  _$ProdutosRecord _$v;

  String _descricao;
  String get descricao => _$this._descricao;
  set descricao(String descricao) => _$this._descricao = descricao;

  DocumentReference<Object> _codsubgrupo;
  DocumentReference<Object> get codsubgrupo => _$this._codsubgrupo;
  set codsubgrupo(DocumentReference<Object> codsubgrupo) =>
      _$this._codsubgrupo = codsubgrupo;

  double _valorAvista;
  double get valorAvista => _$this._valorAvista;
  set valorAvista(double valorAvista) => _$this._valorAvista = valorAvista;

  ListBuilder<String> _image;
  ListBuilder<String> get image => _$this._image ??= new ListBuilder<String>();
  set image(ListBuilder<String> image) => _$this._image = image;

  String _imageIcon;
  String get imageIcon => _$this._imageIcon;
  set imageIcon(String imageIcon) => _$this._imageIcon = imageIcon;

  String _gtin;
  String get gtin => _$this._gtin;
  set gtin(String gtin) => _$this._gtin = gtin;

  String _ref;
  String get ref => _$this._ref;
  set ref(String ref) => _$this._ref = ref;

  bool _promocao;
  bool get promocao => _$this._promocao;
  set promocao(bool promocao) => _$this._promocao = promocao;

  int _rating;
  int get rating => _$this._rating;
  set rating(int rating) => _$this._rating = rating;

  double _quanti;
  double get quanti => _$this._quanti;
  set quanti(double quanti) => _$this._quanti = quanti;

  DocumentReference<Object> _codgrupo;
  DocumentReference<Object> get codgrupo => _$this._codgrupo;
  set codgrupo(DocumentReference<Object> codgrupo) =>
      _$this._codgrupo = codgrupo;

  String _imagePrincipal;
  String get imagePrincipal => _$this._imagePrincipal;
  set imagePrincipal(String imagePrincipal) =>
      _$this._imagePrincipal = imagePrincipal;

  String _detalhes;
  String get detalhes => _$this._detalhes;
  set detalhes(String detalhes) => _$this._detalhes = detalhes;

  double _estoque;
  double get estoque => _$this._estoque;
  set estoque(double estoque) => _$this._estoque = estoque;

  ListBuilder<String> _tipo;
  ListBuilder<String> get tipo => _$this._tipo ??= new ListBuilder<String>();
  set tipo(ListBuilder<String> tipo) => _$this._tipo = tipo;

  String _unidadeS;
  String get unidadeS => _$this._unidadeS;
  set unidadeS(String unidadeS) => _$this._unidadeS = unidadeS;

  DocumentReference<Object> _reference;
  DocumentReference<Object> get reference => _$this._reference;
  set reference(DocumentReference<Object> reference) =>
      _$this._reference = reference;

  ProdutosRecordBuilder() {
    ProdutosRecord._initializeBuilder(this);
  }

  ProdutosRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _descricao = $v.descricao;
      _codsubgrupo = $v.codsubgrupo;
      _valorAvista = $v.valorAvista;
      _image = $v.image?.toBuilder();
      _imageIcon = $v.imageIcon;
      _gtin = $v.gtin;
      _ref = $v.ref;
      _promocao = $v.promocao;
      _rating = $v.rating;
      _quanti = $v.quanti;
      _codgrupo = $v.codgrupo;
      _imagePrincipal = $v.imagePrincipal;
      _detalhes = $v.detalhes;
      _estoque = $v.estoque;
      _tipo = $v.tipo?.toBuilder();
      _unidadeS = $v.unidadeS;
      _reference = $v.reference;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProdutosRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProdutosRecord;
  }

  @override
  void update(void Function(ProdutosRecordBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  ProdutosRecord build() => _build();

  _$ProdutosRecord _build() {
    _$ProdutosRecord _$result;
    try {
      _$result = _$v ??
          new _$ProdutosRecord._(
              descricao: descricao,
              codsubgrupo: codsubgrupo,
              valorAvista: valorAvista,
              image: _image?.build(),
              imageIcon: imageIcon,
              gtin: gtin,
              ref: ref,
              promocao: promocao,
              rating: rating,
              quanti: quanti,
              codgrupo: codgrupo,
              imagePrincipal: imagePrincipal,
              detalhes: detalhes,
              estoque: estoque,
              tipo: _tipo?.build(),
              unidadeS: unidadeS,
              reference: reference);
    } catch (_) {
      String _$failedField;
      try {
        _$failedField = 'image';
        _image?.build();

        _$failedField = 'tipo';
        _tipo?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            r'ProdutosRecord', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
