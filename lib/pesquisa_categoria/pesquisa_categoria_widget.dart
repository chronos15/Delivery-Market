import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../detalhes_produtp/detalhes_produtp_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';

class PesquisaCategoriaWidget extends StatefulWidget {
  const PesquisaCategoriaWidget({
    Key key,
    this.recebeCategoria,
  }) : super(key: key);

  final CategoriaRecord recebeCategoria;

  @override
  _PesquisaCategoriaWidgetState createState() =>
      _PesquisaCategoriaWidgetState();
}

class _PesquisaCategoriaWidgetState extends State<PesquisaCategoriaWidget> {
  CarrinhoRecord te;
  PagingController<DocumentSnapshot, ProdutosRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().textocompleto = true);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriaRecord>>(
      stream: queryCategoriaRecord(
        queryBuilder: (categoriaRecord) => categoriaRecord.where('nome',
            isEqualTo: widget.recebeCategoria.nome),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 45,
              height: 45,
              child: SpinKitCubeGrid(
                color: FlutterFlowTheme.of(context).lineColor,
                size: 45,
              ),
            ),
          );
        }
        List<CategoriaRecord> pesquisaCategoriaCategoriaRecordList =
            snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final pesquisaCategoriaCategoriaRecord =
            pesquisaCategoriaCategoriaRecordList.isNotEmpty
                ? pesquisaCategoriaCategoriaRecordList.first
                : null;
        return Title(
            title: 'pesquisaCategoria',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(100),
                child: AppBar(
                  backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                  automaticallyImplyLeading: false,
                  flexibleSpace: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 14),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                                child: FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30,
                                  borderWidth: 1,
                                  buttonSize: 50,
                                  icon: Icon(
                                    Icons.close_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 20,
                                  ),
                                  onPressed: () async {
                                    Navigator.pop(context);
                                  },
                                ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                                child: Text(
                                  'Voltar',
                                  style: FlutterFlowTheme.of(context)
                                      .title2
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                          child: Text(
                            widget.recebeCategoria.nome,
                            style: FlutterFlowTheme.of(context).title2.override(
                                  fontFamily: 'Outfit',
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  actions: [],
                  elevation: 0,
                ),
              ),
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 100,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                          ),
                          child: Visibility(
                            visible: FFAppState().textocompleto,
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: PagedListView<DocumentSnapshot<Object>,
                                  ProdutosRecord>(
                                pagingController: () {
                                  final Query<Object> Function(Query<Object>)
                                      queryBuilder =
                                      (produtosRecord) => produtosRecord
                                          .whereIn(
                                              'codgrupo',
                                              pesquisaCategoriaCategoriaRecord
                                                  .codgrupos
                                                  .toList())
                                          .orderBy('descricao');
                                  if (_pagingController != null) {
                                    final query =
                                        queryBuilder(ProdutosRecord.collection);
                                    if (query != _pagingQuery) {
                                      // The query has changed
                                      _pagingQuery = query;
                                      _streamSubscriptions
                                          .forEach((s) => s?.cancel());
                                      _streamSubscriptions.clear();
                                      _pagingController.refresh();
                                    }
                                    return _pagingController;
                                  }

                                  _pagingController =
                                      PagingController(firstPageKey: null);
                                  _pagingQuery =
                                      queryBuilder(ProdutosRecord.collection);
                                  _pagingController
                                      .addPageRequestListener((nextPageMarker) {
                                    queryProdutosRecordPage(
                                      queryBuilder: (produtosRecord) =>
                                          produtosRecord
                                              .whereIn(
                                                  'codgrupo',
                                                  pesquisaCategoriaCategoriaRecord
                                                      .codgrupos
                                                      .toList())
                                              .orderBy('descricao'),
                                      nextPageMarker: nextPageMarker,
                                      pageSize: 15,
                                      isStream: true,
                                    ).then((page) {
                                      _pagingController.appendPage(
                                        page.data,
                                        page.nextPageMarker,
                                      );
                                      final streamSubscription =
                                          page.dataStream?.listen((data) {
                                        final itemIndexes = _pagingController
                                            .itemList
                                            .asMap()
                                            .map((k, v) =>
                                                MapEntry(v.reference.id, k));
                                        data.forEach((item) {
                                          final index =
                                              itemIndexes[item.reference.id];
                                          final items =
                                              _pagingController.itemList;
                                          if (index != null) {
                                            items.replaceRange(
                                                index, index + 1, [item]);
                                            _pagingController.itemList = {
                                              for (var item in items)
                                                item.reference: item
                                            }.values.toList();
                                          }
                                        });
                                        setState(() {});
                                      });
                                      _streamSubscriptions
                                          .add(streamSubscription);
                                    });
                                  });
                                  return _pagingController;
                                }(),
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                builderDelegate:
                                    PagedChildBuilderDelegate<ProdutosRecord>(
                                  // Customize what your widget looks like when it's loading the first page.
                                  firstPageProgressIndicatorBuilder: (_) =>
                                      Center(
                                    child: SizedBox(
                                      width: 45,
                                      height: 45,
                                      child: SpinKitCubeGrid(
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        size: 45,
                                      ),
                                    ),
                                  ),

                                  itemBuilder: (context, _, listViewIndex) {
                                    final listViewProdutosRecord =
                                        _pagingController
                                            .itemList[listViewIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 0, 10, 5),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Badge(
                                                  badgeContent: Text(
                                                    'Hot',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 9,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  showBadge:
                                                      listViewProdutosRecord
                                                              .promocao ==
                                                          true,
                                                  shape: BadgeShape.circle,
                                                  badgeColor: Color(0x5EE6070D),
                                                  elevation: 4,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(8, 8, 8, 8),
                                                  position:
                                                      BadgePosition.topEnd(),
                                                  animationType:
                                                      BadgeAnimationType.scale,
                                                  toAnimate: true,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      await Navigator.push(
                                                        context,
                                                        PageTransition(
                                                          type:
                                                              PageTransitionType
                                                                  .fade,
                                                          child:
                                                              FlutterFlowExpandedImageView(
                                                            image:
                                                                CachedNetworkImage(
                                                              imageUrl:
                                                                  listViewProdutosRecord
                                                                      .imageIcon,
                                                              fit: BoxFit
                                                                  .contain,
                                                            ),
                                                            allowRotation:
                                                                false,
                                                            tag:
                                                                listViewProdutosRecord
                                                                    .imageIcon,
                                                            useHeroAnimation:
                                                                true,
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                    child: Hero(
                                                      tag:
                                                          listViewProdutosRecord
                                                              .imageIcon,
                                                      transitionOnUserGestures:
                                                          true,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl:
                                                              listViewProdutosRecord
                                                                  .imageIcon,
                                                          width: 60,
                                                          height: 60,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          DetalhesProdutpWidget(
                                                        recebeproduto:
                                                            listViewProdutosRecord
                                                                .reference,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Container(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.45,
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBtnText,
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Text(
                                                            listViewProdutosRecord
                                                                .descricao
                                                                .maybeHandleOverflow(
                                                                    maxChars:
                                                                        25),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Text(
                                                            listViewProdutosRecord
                                                                .ref,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        0,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              listViewProdutosRecord
                                                                  .gtin,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryText,
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          RatingBarIndicator(
                                                            itemBuilder:
                                                                (context,
                                                                        index) =>
                                                                    FaIcon(
                                                              FontAwesomeIcons
                                                                  .circleNotch,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor5,
                                                            ),
                                                            direction:
                                                                Axis.horizontal,
                                                            rating:
                                                                listViewProdutosRecord
                                                                    .rating
                                                                    .toDouble(),
                                                            unratedColor: Color(
                                                                0xFF9E9E9E),
                                                            itemCount: 5,
                                                            itemSize: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(1, 0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 0, 10, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AutoSizeText(
                                                          functions
                                                              .formatreal(
                                                                  listViewProdutosRecord
                                                                      .valorAvista)
                                                              .maybeHandleOverflow(
                                                                maxChars: 8,
                                                                replacement:
                                                                    '…',
                                                              ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: Color(
                                                                    0xFF00BE3F),
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(2,
                                                                      0, 0, 0),
                                                          child: AutoSizeText(
                                                            listViewProdutosRecord
                                                                .unidadeS
                                                                .maybeHandleOverflow(
                                                              maxChars: 8,
                                                              replacement: '…',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .lineColor,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Card(
                                                      clipBehavior: Clip
                                                          .antiAliasWithSaveLayer,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBtnText,
                                                      elevation: 0,
                                                      child: Stack(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        0,
                                                                        5),
                                                            child:
                                                                FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                setState(() => FFAppState()
                                                                    .addToCarrinho(
                                                                        listViewProdutosRecord
                                                                            .reference));

                                                                final carrinhoCreateData =
                                                                    createCarrinhoRecordData(
                                                                  usuario:
                                                                      currentUserReference,
                                                                  codProduto:
                                                                      listViewProdutosRecord
                                                                          .reference,
                                                                  valorUnitario:
                                                                      listViewProdutosRecord
                                                                          .valorAvista,
                                                                  quantidade:
                                                                      1.0,
                                                                  valorReg:
                                                                      listViewProdutosRecord
                                                                          .valorAvista,
                                                                  fechado:
                                                                      false,
                                                                );
                                                                var carrinhoRecordReference =
                                                                    CarrinhoRecord
                                                                        .collection
                                                                        .doc();
                                                                await carrinhoRecordReference
                                                                    .set(
                                                                        carrinhoCreateData);
                                                                te = CarrinhoRecord
                                                                    .getDocumentFromData(
                                                                        carrinhoCreateData,
                                                                        carrinhoRecordReference);
                                                                HapticFeedback
                                                                    .selectionClick();
                                                                ScaffoldMessenger.of(
                                                                        context)
                                                                    .showSnackBar(
                                                                  SnackBar(
                                                                    content:
                                                                        Text(
                                                                      'Produto Adicionado ao Carrinho',
                                                                      style: GoogleFonts
                                                                          .getFont(
                                                                        'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontSize:
                                                                            12,
                                                                      ),
                                                                    ),
                                                                    duration: Duration(
                                                                        milliseconds:
                                                                            2000),
                                                                    backgroundColor:
                                                                        FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                    action:
                                                                        SnackBarAction(
                                                                      label:
                                                                          'Carrinho',
                                                                      textColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .secondaryText,
                                                                      onPressed:
                                                                          () async {
                                                                        await Navigator
                                                                            .push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                NavBarPage(initialPage: 'carrinho'),
                                                                          ),
                                                                        );
                                                                      },
                                                                    ),
                                                                  ),
                                                                );

                                                                setState(() {});
                                                              },
                                                              text: 'Add +',
                                                              icon: Icon(
                                                                Icons
                                                                    .add_shopping_cart_outlined,
                                                                color: Color(
                                                                    0xFF00BE3F),
                                                                size: 20,
                                                              ),
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 200,
                                                                height: 40,
                                                                color: Colors
                                                                    .transparent,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .subtitle2
                                                                    .override(
                                                                      fontFamily:
                                                                          'Outfit',
                                                                      color: Color(
                                                                          0xFF00BE3F),
                                                                      fontSize:
                                                                          10,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                    ),
                                                                elevation: 0,
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0xFF00BE3F),
                                                                  width: 0.5,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      },
    );
  }
}
