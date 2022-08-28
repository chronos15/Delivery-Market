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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_transition/page_transition.dart';
import 'package:text_search/text_search.dart';

class TodossubgruposWidget extends StatefulWidget {
  const TodossubgruposWidget({
    Key key,
    this.recebetodossub,
  }) : super(key: key);

  final DocumentReference recebetodossub;

  @override
  _TodossubgruposWidgetState createState() => _TodossubgruposWidgetState();
}

class _TodossubgruposWidgetState extends State<TodossubgruposWidget> {
  CarrinhoRecord te;
  PagingController<DocumentSnapshot, ProdutosRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  List<ProdutosRecord> simpleSearchResults = [];
  TextEditingController textController;
  var gtinReturn = '';
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() => FFAppState().textocompleto = true);
    });

    textController = TextEditingController(text: gtinReturn);
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _streamSubscriptions.forEach((s) => s?.cancel());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProdutosRecord>>(
      stream: queryProdutosRecord(
        queryBuilder: (produtosRecord) =>
            produtosRecord.where('codgrupo', isEqualTo: widget.recebetodossub),
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
        List<ProdutosRecord> todossubgruposProdutosRecordList = snapshot.data;
        return Title(
            title: 'todossubgrupos',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                automaticallyImplyLeading: false,
                leading: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 30,
                  borderWidth: 1,
                  buttonSize: 50,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).secondaryText,
                    size: 20,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
                title: Text(
                  'Produtos',
                  style: GoogleFonts.getFont(
                    'Open Sans',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontWeight: FontWeight.normal,
                    fontSize: 12,
                  ),
                ),
                actions: [],
                centerTitle: true,
                elevation: 0,
              ),
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              body: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            width: double.infinity,
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            child: ExpandableNotifier(
                              initialExpanded: false,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      30, 5, 0, 5),
                                  child: StreamBuilder<GrupoRecord>(
                                    stream: GrupoRecord.getDocument(
                                        widget.recebetodossub),
                                    builder: (context, snapshot) {
                                      // Customize what your widget looks like when it's loading.
                                      if (!snapshot.hasData) {
                                        return Center(
                                          child: SizedBox(
                                            width: 45,
                                            height: 45,
                                            child: SpinKitCubeGrid(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              size: 45,
                                            ),
                                          ),
                                        );
                                      }
                                      final textGrupoRecord = snapshot.data;
                                      return Text(
                                        textGrupoRecord.nome,
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Outfit',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      );
                                    },
                                  ),
                                ),
                                collapsed: Text(
                                  '1',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Outfit',
                                        color: FlutterFlowTheme.of(context)
                                            .lineColor,
                                        fontSize: 1,
                                      ),
                                ),
                                expanded: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      5, 0, 5, 5),
                                  child: Container(
                                    width: double.infinity,
                                    height: 60,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .customColor1,
                                      borderRadius: BorderRadius.circular(8),
                                      border: Border.all(
                                        color: Colors.transparent,
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          12, 8, 12, 8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5, 0, 0, 0),
                                            child: FaIcon(
                                              FontAwesomeIcons.search,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .lineColor,
                                              size: 20,
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(12, 0, 8, 0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  TextFormField(
                                                    controller: textController,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      'textController',
                                                      Duration(
                                                          milliseconds: 100),
                                                      () async {
                                                        setState(() {
                                                          simpleSearchResults =
                                                              TextSearch(
                                                            todossubgruposProdutosRecordList
                                                                .map(
                                                                  (record) =>
                                                                      TextSearchItem(
                                                                          record,
                                                                          [
                                                                        record
                                                                            .descricao,
                                                                        record
                                                                            .gtin,
                                                                        record
                                                                            .ref
                                                                      ]),
                                                                )
                                                                .toList(),
                                                          )
                                                                  .search(
                                                                      textController
                                                                          .text)
                                                                  .map((r) =>
                                                                      r.object)
                                                                  .toList();
                                                        });
                                                        setState(() => FFAppState()
                                                                .textocompleto =
                                                            false);
                                                      },
                                                    ),
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      hintText: 'Procurar',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                fontSize: 12,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily: 'Poppins',
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 0, 4, 0),
                                            child: FlutterFlowIconButton(
                                              borderColor: Color(0x1595A1AC),
                                              borderRadius: 8,
                                              borderWidth: 1,
                                              buttonSize: 35,
                                              icon: Icon(
                                                Icons.cancel_sharp,
                                                color: Color(0xFFC40000),
                                                size: 17,
                                              ),
                                              onPressed: () async {
                                                setState(() {
                                                  textController?.clear();
                                                });
                                                setState(() => FFAppState()
                                                    .textocompleto = true);
                                              },
                                            ),
                                          ),
                                          FlutterFlowIconButton(
                                            borderColor: Color(0x1595A1AC),
                                            borderRadius: 8,
                                            borderWidth: 1,
                                            buttonSize: 35,
                                            icon: FaIcon(
                                              FontAwesomeIcons.qrcode,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryText,
                                              size: 17,
                                            ),
                                            onPressed: () async {
                                              gtinReturn =
                                                  await FlutterBarcodeScanner
                                                      .scanBarcode(
                                                '#C62828', // scanning line color
                                                'Cancelar', // cancel button text
                                                true, // whether to show the flash icon
                                                ScanMode.BARCODE,
                                              );

                                              setState(() {});
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                  expandIcon: Icons.search,
                                  collapseIcon:
                                      Icons.keyboard_arrow_down_rounded,
                                  iconSize: 15,
                                  iconColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
                                  iconPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (FFAppState().textocompleto)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: PagedListView<DocumentSnapshot<Object>,
                                  ProdutosRecord>(
                                pagingController: () {
                                  final Query<Object> Function(Query<Object>)
                                      queryBuilder =
                                      (produtosRecord) => produtosRecord
                                          .where('codgrupo',
                                              isEqualTo: widget.recebetodossub)
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
                                              .where('codgrupo',
                                                  isEqualTo:
                                                      widget.recebetodossub)
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
                          if (!FFAppState().textocompleto)
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                              child: Builder(
                                builder: (context) {
                                  final pesquisaprod2 = simpleSearchResults
                                      .map((e) => e)
                                      .toList();
                                  return ListView.builder(
                                    padding: EdgeInsets.zero,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount: pesquisaprod2.length,
                                    itemBuilder: (context, pesquisaprod2Index) {
                                      final pesquisaprod2Item =
                                          pesquisaprod2[pesquisaprod2Index];
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
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Outfit',
                                                            color: Colors.white,
                                                            fontSize: 9,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                          ),
                                                    ),
                                                    showBadge: pesquisaprod2Item
                                                            .promocao ==
                                                        true,
                                                    shape: BadgeShape.circle,
                                                    badgeColor:
                                                        Color(0x5EE6070D),
                                                    elevation: 4,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 8, 8, 8),
                                                    position:
                                                        BadgePosition.topEnd(),
                                                    animationType:
                                                        BadgeAnimationType
                                                            .scale,
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
                                                                    pesquisaprod2Item
                                                                        .imageIcon,
                                                                fit: BoxFit
                                                                    .contain,
                                                              ),
                                                              allowRotation:
                                                                  false,
                                                              tag: pesquisaprod2Item
                                                                  .imageIcon,
                                                              useHeroAnimation:
                                                                  true,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      child: Hero(
                                                        tag: pesquisaprod2Item
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
                                                                pesquisaprod2Item
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
                                                              pesquisaprod2Item
                                                                  .reference,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.45,
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
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
                                                              pesquisaprod2Item
                                                                  .descricao
                                                                  .maybeHandleOverflow(
                                                                maxChars: 20,
                                                                replacement:
                                                                    '…',
                                                              ),
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
                                                          ],
                                                        ),
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              pesquisaprod2Item
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
                                                                    fontSize:
                                                                        12,
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
                                                                pesquisaprod2Item
                                                                    .gtin,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
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
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor5,
                                                              ),
                                                              direction: Axis
                                                                  .horizontal,
                                                              rating:
                                                                  pesquisaprod2Item
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
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        AutoSizeText(
                                                          functions
                                                              .formatreal(
                                                                  pesquisaprod2Item
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
                                                            pesquisaprod2Item
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
                                                                        pesquisaprod2Item
                                                                            .reference));

                                                                final carrinhoCreateData =
                                                                    createCarrinhoRecordData(
                                                                  usuario:
                                                                      currentUserReference,
                                                                  codProduto:
                                                                      pesquisaprod2Item
                                                                          .reference,
                                                                  valorUnitario:
                                                                      pesquisaprod2Item
                                                                          .valorAvista,
                                                                  quantidade:
                                                                      1.0,
                                                                  valorReg:
                                                                      pesquisaprod2Item
                                                                          .valorAvista,
                                                                  fechado:
                                                                      false,
                                                                );
                                                                await CarrinhoRecord
                                                                    .collection
                                                                    .doc()
                                                                    .set(
                                                                        carrinhoCreateData);
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
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
