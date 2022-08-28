import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../detalhes_produtp/detalhes_produtp_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../pesquisa_categoria/pesquisa_categoria_widget.dart';
import '../pesquisar_prod_todos/pesquisar_prod_todos_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  CarrinhoRecord teste;
  PagingController<DocumentSnapshot, ProdutosRecord> _pagingController;
  Query _pagingQuery;
  List<StreamSubscription> _streamSubscriptions = [];

  PageController pageViewController;
  String choiceChipsValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  var codigoreturn = '';

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await actions.lockOrientation();
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
    return Title(
        title: 'HomePage',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            automaticallyImplyLeading: false,
            title: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
              child: InkWell(
                onTap: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PesquisarProdTodosWidget(),
                    ),
                  );
                },
                child: Material(
                  color: Colors.transparent,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor1,
                      borderRadius: BorderRadius.circular(7),
                      shape: BoxShape.rectangle,
                    ),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                            child: Text(
                              'Pesquisa',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color: Color(0xFF57636C),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: AlignmentDirectional(0.9, 0),
                              child: FaIcon(
                                FontAwesomeIcons.search,
                                color: Color(0xFF57636C),
                                size: 18,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            actions: [
              FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 50,
                icon: Icon(
                  Icons.qr_code_scanner_rounded,
                  color: FlutterFlowTheme.of(context).lineColor,
                  size: 25,
                ),
                onPressed: () async {
                  codigoreturn = await FlutterBarcodeScanner.scanBarcode(
                    '#C62828', // scanning line color
                    'Cancelar', // cancel button text
                    true, // whether to show the flash icon
                    ScanMode.BARCODE,
                  );

                  setState(() {});
                },
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: DefaultTabController(
                length: 2,
                initialIndex: 0,
                child: Column(
                  children: [
                    TabBar(
                      labelColor: FlutterFlowTheme.of(context).lineColor,
                      unselectedLabelColor:
                          FlutterFlowTheme.of(context).secondaryText,
                      labelStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Outfit',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                              ),
                      indicatorColor: FlutterFlowTheme.of(context).lineColor,
                      indicatorWeight: 1,
                      tabs: [
                        Tab(
                          text: 'Inicio',
                        ),
                        Tab(
                          text: 'Loja',
                        ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 10, 0, 10),
                                      child: FlutterFlowChoiceChips(
                                        initiallySelected:
                                            choiceChipsValue != null
                                                ? [choiceChipsValue]
                                                : ['Todos'],
                                        options: [
                                          ChipData('Todos',
                                              FontAwesomeIcons.alignLeft),
                                          ChipData('Promoção',
                                              FontAwesomeIcons.fireAlt)
                                        ],
                                        onChanged: (val) => setState(
                                            () => choiceChipsValue = val.first),
                                        selectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor5,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: Colors.white,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor2,
                                          iconSize: 18,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          elevation: 0,
                                        ),
                                        unselectedChipStyle: ChipStyle(
                                          backgroundColor:
                                              FlutterFlowTheme.of(context)
                                                  .customColor1,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyText2
                                              .override(
                                                fontFamily: 'Outfit',
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryText,
                                                fontSize: 12,
                                                fontWeight: FontWeight.normal,
                                              ),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primaryBtnText,
                                          iconSize: 18,
                                          labelPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5, 5, 5, 5),
                                          elevation: 0,
                                        ),
                                        chipSpacing: 10,
                                        multiselect: false,
                                        initialized: choiceChipsValue != null,
                                        alignment: WrapAlignment.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Material(
                                      color: Colors.transparent,
                                      elevation: 0,
                                      child: Container(
                                        width: 100,
                                        height: 95,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                        ),
                                        child: StreamBuilder<
                                            List<CategoriaRecord>>(
                                          stream: queryCategoriaRecord(),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 45,
                                                  height: 45,
                                                  child: SpinKitCubeGrid(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .lineColor,
                                                    size: 45,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<CategoriaRecord>
                                                rowCategoriaRecordList =
                                                snapshot.data;
                                            return Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: List.generate(
                                                  rowCategoriaRecordList.length,
                                                  (rowIndex) {
                                                final rowCategoriaRecord =
                                                    rowCategoriaRecordList[
                                                        rowIndex];
                                                return InkWell(
                                                  onTap: () async {
                                                    await Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            PesquisaCategoriaWidget(
                                                          recebeCategoria:
                                                              rowCategoriaRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 0,
                                                    child: Container(
                                                      width: 80,
                                                      height: 70,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowCategoriaRecord
                                                                    .imagem,
                                                                'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                                                              ),
                                                              width: 70,
                                                              height: 70,
                                                              fit: BoxFit
                                                                  .scaleDown,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        5,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              rowCategoriaRecord
                                                                  .nome,
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
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
                                                                        11,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Builder(
                                          builder: (context) {
                                            final fotosbanner = FFAppState()
                                                .fotosbanner
                                                .map((e) => e)
                                                .toList();
                                            return Container(
                                              width: double.infinity,
                                              height: 120,
                                              child: Stack(
                                                children: [
                                                  PageView.builder(
                                                    controller:
                                                        pageViewController ??=
                                                            PageController(
                                                                initialPage: min(
                                                                    0,
                                                                    fotosbanner
                                                                            .length -
                                                                        1)),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        fotosbanner.length,
                                                    itemBuilder: (context,
                                                        fotosbannerIndex) {
                                                      final fotosbannerItem =
                                                          fotosbanner[
                                                              fotosbannerIndex];
                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            fotosbannerItem,
                                                            'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/food-facebook-cover-design-template-f3264bb60ba044cec9bc433b9293be1e_screen.jpg?ts=1628404887',
                                                          ),
                                                          width: 100,
                                                          height: 100,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 1),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 10),
                                                      child:
                                                          SmoothPageIndicator(
                                                        controller: pageViewController ??=
                                                            PageController(
                                                                initialPage: min(
                                                                    0,
                                                                    fotosbanner
                                                                            .length -
                                                                        1)),
                                                        count:
                                                            fotosbanner.length,
                                                        axisDirection:
                                                            Axis.horizontal,
                                                        onDotClicked: (i) {
                                                          pageViewController
                                                              .animateToPage(
                                                            i,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    500),
                                                            curve: Curves.ease,
                                                          );
                                                        },
                                                        effect:
                                                            ExpandingDotsEffect(
                                                          expansionFactor: 5,
                                                          spacing: 8,
                                                          radius: 16,
                                                          dotWidth: 8,
                                                          dotHeight: 7,
                                                          dotColor:
                                                              Color(0x8757636C),
                                                          activeDotColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .lineColor,
                                                          paintStyle:
                                                              PaintingStyle
                                                                  .fill,
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
                                  ],
                                ),
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: PagedListView<
                                            DocumentSnapshot<Object>,
                                            ProdutosRecord>(
                                          pagingController: () {
                                            final Query<Object> Function(
                                                    Query<Object>)
                                                queryBuilder =
                                                (produtosRecord) => produtosRecord
                                                    .where('tipo',
                                                        arrayContains:
                                                            choiceChipsValue !=
                                                                    ''
                                                                ? choiceChipsValue
                                                                : null)
                                                    .orderBy('descricao');
                                            if (_pagingController != null) {
                                              final query = queryBuilder(
                                                  ProdutosRecord.collection);
                                              if (query != _pagingQuery) {
                                                // The query has changed
                                                _pagingQuery = query;
                                                _streamSubscriptions.forEach(
                                                    (s) => s?.cancel());
                                                _streamSubscriptions.clear();
                                                _pagingController.refresh();
                                              }
                                              return _pagingController;
                                            }

                                            _pagingController =
                                                PagingController(
                                                    firstPageKey: null);
                                            _pagingQuery = queryBuilder(
                                                ProdutosRecord.collection);
                                            _pagingController
                                                .addPageRequestListener(
                                                    (nextPageMarker) {
                                              queryProdutosRecordPage(
                                                queryBuilder: (produtosRecord) =>
                                                    produtosRecord
                                                        .where('tipo',
                                                            arrayContains:
                                                                choiceChipsValue !=
                                                                        ''
                                                                    ? choiceChipsValue
                                                                    : null)
                                                        .orderBy('descricao'),
                                                nextPageMarker: nextPageMarker,
                                                pageSize: 6,
                                                isStream: true,
                                              ).then((page) {
                                                _pagingController.appendPage(
                                                  page.data,
                                                  page.nextPageMarker,
                                                );
                                                final streamSubscription = page
                                                    .dataStream
                                                    ?.listen((data) {
                                                  final itemIndexes =
                                                      _pagingController.itemList
                                                          .asMap()
                                                          .map((k, v) =>
                                                              MapEntry(
                                                                  v.reference
                                                                      .id,
                                                                  k));
                                                  data.forEach((item) {
                                                    final index = itemIndexes[
                                                        item.reference.id];
                                                    final items =
                                                        _pagingController
                                                            .itemList;
                                                    if (index != null) {
                                                      items.replaceRange(index,
                                                          index + 1, [item]);
                                                      _pagingController
                                                          .itemList = {
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
                                              PagedChildBuilderDelegate<
                                                  ProdutosRecord>(
                                            // Customize what your widget looks like when it's loading the first page.
                                            firstPageProgressIndicatorBuilder:
                                                (_) => Center(
                                              child: SizedBox(
                                                width: 45,
                                                height: 45,
                                                child: SpinKitCubeGrid(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .lineColor,
                                                  size: 45,
                                                ),
                                              ),
                                            ),
                                            noItemsFoundIndicatorBuilder: (_) =>
                                                Image.network(
                                              '',
                                            ),
                                            itemBuilder:
                                                (context, _, listViewIndex) {
                                              final listViewProdutosRecord =
                                                  _pagingController
                                                      .itemList[listViewIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 10, 5),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Badge(
                                                            badgeContent: Text(
                                                              'Hot',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Outfit',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize: 9,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                            showBadge:
                                                                listViewProdutosRecord
                                                                        .promocao ==
                                                                    true,
                                                            shape: BadgeShape
                                                                .circle,
                                                            badgeColor: Color(
                                                                0x5EE6070D),
                                                            elevation: 4,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        8,
                                                                        8,
                                                                        8,
                                                                        8),
                                                            position:
                                                                BadgePosition
                                                                    .topEnd(),
                                                            animationType:
                                                                BadgeAnimationType
                                                                    .scale,
                                                            toAnimate: true,
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await Navigator
                                                                    .push(
                                                                  context,
                                                                  PageTransition(
                                                                    type: PageTransitionType
                                                                        .fade,
                                                                    child:
                                                                        FlutterFlowExpandedImageView(
                                                                      image:
                                                                          CachedNetworkImage(
                                                                        imageUrl:
                                                                            valueOrDefault<String>(
                                                                          listViewProdutosRecord
                                                                              .imageIcon,
                                                                          'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                                                                        ),
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                      allowRotation:
                                                                          false,
                                                                      tag: valueOrDefault<
                                                                          String>(
                                                                        listViewProdutosRecord
                                                                            .imageIcon,
                                                                        'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png' +
                                                                            '$listViewIndex',
                                                                      ),
                                                                      useHeroAnimation:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                              child: Hero(
                                                                tag:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  listViewProdutosRecord
                                                                      .imageIcon,
                                                                  'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png' +
                                                                      '$listViewIndex',
                                                                ),
                                                                transitionOnUserGestures:
                                                                    true,
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              50),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl:
                                                                        valueOrDefault<
                                                                            String>(
                                                                      listViewProdutosRecord
                                                                          .imageIcon,
                                                                      'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                                                                    ),
                                                                    width: 60,
                                                                    height: 60,
                                                                    fit: BoxFit
                                                                        .scaleDown,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        InkWell(
                                                          onTap: () async {
                                                            await Navigator
                                                                .push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        DetalhesProdutpWidget(
                                                                  recebeproduto:
                                                                      listViewProdutosRecord
                                                                          .reference,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.45,
                                                            height: 60,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBtnText,
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Text(
                                                                      listViewProdutosRecord
                                                                          .descricao
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            20,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    Text(
                                                                      listViewProdutosRecord
                                                                          .ref,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryText,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        listViewProdutosRecord
                                                                            .gtin,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  children: [
                                                                    RatingBarIndicator(
                                                                      itemBuilder:
                                                                          (context, index) =>
                                                                              FaIcon(
                                                                        FontAwesomeIcons
                                                                            .circleNotch,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor5,
                                                                      ),
                                                                      direction:
                                                                          Axis.horizontal,
                                                                      rating: listViewProdutosRecord
                                                                          .rating
                                                                          .toDouble(),
                                                                      unratedColor:
                                                                          Color(
                                                                              0xFF9E9E9E),
                                                                      itemCount:
                                                                          5,
                                                                      itemSize:
                                                                          20,
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
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  AutoSizeText(
                                                                    functions
                                                                        .formatreal(
                                                                            listViewProdutosRecord.valorAvista)
                                                                        .maybeHandleOverflow(
                                                                          maxChars:
                                                                              8,
                                                                          replacement:
                                                                              '…',
                                                                        ),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Outfit',
                                                                          color:
                                                                              Color(0xFF00BE3F),
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                        ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        AutoSizeText(
                                                                      listViewProdutosRecord
                                                                          .unidadeS
                                                                          .maybeHandleOverflow(
                                                                        maxChars:
                                                                            8,
                                                                        replacement:
                                                                            '…',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Outfit',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).lineColor,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Card(
                                                                clipBehavior: Clip
                                                                    .antiAliasWithSaveLayer,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                elevation: 0,
                                                                child: Stack(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              0,
                                                                              5),
                                                                      child:
                                                                          FFButtonWidget(
                                                                        onPressed:
                                                                            () async {
                                                                          setState(() =>
                                                                              FFAppState().addToCarrinho(listViewProdutosRecord.reference));

                                                                          final carrinhoCreateData =
                                                                              createCarrinhoRecordData(
                                                                            usuario:
                                                                                currentUserReference,
                                                                            codProduto:
                                                                                listViewProdutosRecord.reference,
                                                                            valorUnitario:
                                                                                listViewProdutosRecord.valorAvista,
                                                                            quantidade:
                                                                                1.0,
                                                                            valorReg:
                                                                                listViewProdutosRecord.valorAvista,
                                                                            fechado:
                                                                                false,
                                                                          );
                                                                          var carrinhoRecordReference = CarrinhoRecord
                                                                              .collection
                                                                              .doc();
                                                                          await carrinhoRecordReference
                                                                              .set(carrinhoCreateData);
                                                                          teste = CarrinhoRecord.getDocumentFromData(
                                                                              carrinhoCreateData,
                                                                              carrinhoRecordReference);
                                                                          HapticFeedback
                                                                              .selectionClick();
                                                                          ScaffoldMessenger.of(context)
                                                                              .showSnackBar(
                                                                            SnackBar(
                                                                              content: Text(
                                                                                'Produto Adicionado ao Carrinho',
                                                                                style: GoogleFonts.getFont(
                                                                                  'Outfit',
                                                                                  color: FlutterFlowTheme.of(context).secondaryText,
                                                                                  fontSize: 12,
                                                                                ),
                                                                              ),
                                                                              duration: Duration(milliseconds: 2000),
                                                                              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              action: SnackBarAction(
                                                                                label: 'Carrinho',
                                                                                textColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                onPressed: () async {
                                                                                  await Navigator.push(
                                                                                    context,
                                                                                    MaterialPageRoute(
                                                                                      builder: (context) => NavBarPage(initialPage: 'carrinho'),
                                                                                    ),
                                                                                  );
                                                                                },
                                                                              ),
                                                                            ),
                                                                          );

                                                                          setState(
                                                                              () {});
                                                                        },
                                                                        text:
                                                                            'Add +',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .add_shopping_cart_outlined,
                                                                          color:
                                                                              Color(0xFF00BE3F),
                                                                          size:
                                                                              20,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              200,
                                                                          height:
                                                                              40,
                                                                          color:
                                                                              Colors.transparent,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .subtitle2
                                                                              .override(
                                                                                fontFamily: 'Outfit',
                                                                                color: Color(0xFF00BE3F),
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                          elevation:
                                                                              0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Color(0xFF00BE3F),
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8),
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
