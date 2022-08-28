import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/finalizar_widget.dart';
import '../flutter_flow/flutter_flow_expanded_image_view.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';

class PedidosWidget extends StatefulWidget {
  const PedidosWidget({Key key}) : super(key: key);

  @override
  _PedidosWidgetState createState() => _PedidosWidgetState();
}

class _PedidosWidgetState extends State<PedidosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'Pedidos',
        color: FlutterFlowTheme.of(context).primaryColor,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
            automaticallyImplyLeading: false,
            title: Text(
              'Pedidos',
              style: GoogleFonts.getFont(
                'Outfit',
                color: FlutterFlowTheme.of(context).secondaryText,
                fontSize: 14,
              ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 0),
                      child: StreamBuilder<List<PedidosRecord>>(
                        stream: queryPedidosRecord(
                          queryBuilder: (pedidosRecord) => pedidosRecord.where(
                              'userCod',
                              isEqualTo: currentUserReference),
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
                          List<PedidosRecord> listViewPedidosRecordList =
                              snapshot.data;
                          if (listViewPedidosRecordList.isEmpty) {
                            return Center(
                              child: Image.network(
                                'https://cdni.iconscout.com/illustration/premium/thumb/404-error-5788048-4843548.png',
                              ),
                            );
                          }
                          return ListView.builder(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewPedidosRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewPedidosRecord =
                                  listViewPedidosRecordList[listViewIndex];
                              return Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 10),
                                      child: InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: FinalizarWidget(),
                                              );
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(7),
                                          ),
                                          child: Container(
                                            width: 100,
                                            height: 215,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 10),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        functions.formatdate(
                                                            listViewPedidosRecord
                                                                .data),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Outfit',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 2,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(10),
                                                        bottomRight:
                                                            Radius.circular(10),
                                                        topLeft:
                                                            Radius.circular(0),
                                                        topRight:
                                                            Radius.circular(0),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBtnText,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            blurRadius: 3,
                                                            color: Color(
                                                                0x33000000),
                                                            offset:
                                                                Offset(0, 1),
                                                          )
                                                        ],
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          bottomLeft:
                                                              Radius.circular(
                                                                  10),
                                                          bottomRight:
                                                              Radius.circular(
                                                                  10),
                                                          topLeft:
                                                              Radius.circular(
                                                                  0),
                                                          topRight:
                                                              Radius.circular(
                                                                  0),
                                                        ),
                                                      ),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    listViewPedidosRecord
                                                                        .situacao,
                                                                    'Não respondido...',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Outfit',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                      ),
                                                                ),
                                                                Expanded(
                                                                  child: Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            1,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              14,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        functions
                                                                            .formatreal(listViewPedidosRecord.total),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .keyboard_arrow_right_rounded,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Divider(
                                                            color: Color(
                                                                0x4B57636C),
                                                          ),
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final produtosList =
                                                                    listViewPedidosRecord
                                                                        .produtosCart
                                                                        .toList()
                                                                        .take(3)
                                                                        .toList();
                                                                return ListView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  primary:
                                                                      false,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      produtosList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          produtosListIndex) {
                                                                    final produtosListItem =
                                                                        produtosList[
                                                                            produtosListIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              20,
                                                                              1,
                                                                              10,
                                                                              1),
                                                                      child: StreamBuilder<
                                                                          CarrinhoRecord>(
                                                                        stream:
                                                                            CarrinhoRecord.getDocument(produtosListItem),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          final rowCarrinhoRecord =
                                                                              snapshot.data;
                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  StreamBuilder<ProdutosRecord>(
                                                                                    stream: ProdutosRecord.getDocument(rowCarrinhoRecord.codProduto),
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
                                                                                      final imageProdutosRecord = snapshot.data;
                                                                                      return InkWell(
                                                                                        onTap: () async {
                                                                                          await Navigator.push(
                                                                                            context,
                                                                                            PageTransition(
                                                                                              type: PageTransitionType.fade,
                                                                                              child: FlutterFlowExpandedImageView(
                                                                                                image: Image.network(
                                                                                                  valueOrDefault<String>(
                                                                                                    imageProdutosRecord.imageIcon,
                                                                                                    'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                                                                                                  ),
                                                                                                  fit: BoxFit.contain,
                                                                                                ),
                                                                                                allowRotation: true,
                                                                                                tag: valueOrDefault<String>(
                                                                                                  imageProdutosRecord.imageIcon,
                                                                                                  'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png' + '$produtosListIndex',
                                                                                                ),
                                                                                                useHeroAnimation: true,
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                        child: Hero(
                                                                                          tag: valueOrDefault<String>(
                                                                                            imageProdutosRecord.imageIcon,
                                                                                            'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png' + '$produtosListIndex',
                                                                                          ),
                                                                                          transitionOnUserGestures: true,
                                                                                          child: ClipRRect(
                                                                                            borderRadius: BorderRadius.circular(50),
                                                                                            child: Image.network(
                                                                                              valueOrDefault<String>(
                                                                                                imageProdutosRecord.imageIcon,
                                                                                                'https://upload.wikimedia.org/wikipedia/commons/d/d1/Image_not_available.png',
                                                                                              ),
                                                                                              width: 40,
                                                                                              height: 40,
                                                                                              fit: BoxFit.cover,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Container(
                                                                                    width: MediaQuery.of(context).size.width * 0.45,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                      child: StreamBuilder<ProdutosRecord>(
                                                                                        stream: ProdutosRecord.getDocument(rowCarrinhoRecord.codProduto),
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
                                                                                          final columnProdutosRecord = snapshot.data;
                                                                                          return Column(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    columnProdutosRecord.descricao.maybeHandleOverflow(
                                                                                                      maxChars: 15,
                                                                                                      replacement: '…',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.min,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    columnProdutosRecord.ref,
                                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                          fontFamily: 'Outfit',
                                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                          fontSize: 12,
                                                                                                          fontWeight: FontWeight.normal,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                                    child: Text(
                                                                                                      columnProdutosRecord.gtin,
                                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                            fontFamily: 'Outfit',
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            fontSize: 12,
                                                                                                            fontWeight: FontWeight.normal,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    functions.formatreal(rowCarrinhoRecord.valorReg).maybeHandleOverflow(
                                                                                          maxChars: 20,
                                                                                          replacement: '…',
                                                                                        ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: Color(0xFF02B31B),
                                                                                          fontSize: 12,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    formatNumber(
                                                                                      rowCarrinhoRecord.quantidade,
                                                                                      formatType: FormatType.custom,
                                                                                      format: 'x',
                                                                                      locale: '',
                                                                                    ).maybeHandleOverflow(
                                                                                      maxChars: 20,
                                                                                      replacement: '…',
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Outfit',
                                                                                          color: FlutterFlowTheme.of(context).secondaryText,
                                                                                          fontSize: 12,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          );
                                                                        },
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
