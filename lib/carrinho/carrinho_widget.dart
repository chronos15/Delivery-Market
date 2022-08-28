import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/excluir_widget.dart';
import '../components/quantidade_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../main.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CarrinhoWidget extends StatefulWidget {
  const CarrinhoWidget({Key key}) : super(key: key);

  @override
  _CarrinhoWidgetState createState() => _CarrinhoWidgetState();
}

class _CarrinhoWidgetState extends State<CarrinhoWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CarrinhoRecord>>(
      stream: queryCarrinhoRecord(
        queryBuilder: (carrinhoRecord) => carrinhoRecord
            .where('usuario', isEqualTo: currentUserReference)
            .where('fechado', isEqualTo: false),
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
        List<CarrinhoRecord> carrinhoCarrinhoRecordList = snapshot.data;
        return Title(
            title: 'carrinho',
            color: FlutterFlowTheme.of(context).primaryColor,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
                automaticallyImplyLeading: false,
                title: Text(
                  'Carrinho',
                  style: GoogleFonts.getFont(
                    'Outfit',
                    color: FlutterFlowTheme.of(context).secondaryText,
                    fontSize: 14,
                  ),
                ),
                actions: [
                  Visibility(
                    visible: carrinhoCarrinhoRecordList.length >= 1,
                    child: StreamBuilder<List<CarrinhoRecord>>(
                      stream: queryCarrinhoRecord(
                        queryBuilder: (carrinhoRecord) => carrinhoRecord
                            .where('usuario', isEqualTo: currentUserReference)
                            .where('fechado', isEqualTo: false),
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
                        List<CarrinhoRecord> iconButtonCarrinhoRecordList =
                            snapshot.data;
                        return FlutterFlowIconButton(
                          borderColor: Colors.transparent,
                          borderRadius: 30,
                          borderWidth: 1,
                          buttonSize: 60,
                          icon: Icon(
                            Icons.remove_shopping_cart_outlined,
                            color: FlutterFlowTheme.of(context).secondaryText,
                            size: 25,
                          ),
                          onPressed: () async {
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return AlertDialog(
                                      title: Text('Limpar'),
                                      content: Text(
                                          'Tem certeza que quer limpar o carrinho?'),
                                      actions: [
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, false),
                                          child: Text('Cancelar'),
                                        ),
                                        TextButton(
                                          onPressed: () => Navigator.pop(
                                              alertDialogContext, true),
                                          child: Text('Confirmar'),
                                        ),
                                      ],
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              await actions.updateData(
                                iconButtonCarrinhoRecordList
                                    .map((e) => e.reference)
                                    .toList(),
                              );
                            } else {
                              return;
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
                centerTitle: false,
                elevation: 0,
              ),
              backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
              body: SafeArea(
                child: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0, 1),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 5),
                          child: FFButtonWidget(
                            onPressed: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      NavBarPage(initialPage: 'HomePage'),
                                ),
                              );
                            },
                            text: 'Continuar Comprando',
                            icon: FaIcon(
                              FontAwesomeIcons.shoppingBasket,
                              color: FlutterFlowTheme.of(context).lineColor,
                              size: 20,
                            ),
                            options: FFButtonOptions(
                              width: 320,
                              height: 50,
                              color: Colors.transparent,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Outfit',
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal,
                                  ),
                              elevation: 0,
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).lineColor,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Container(
                              height: 320,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 10, 0),
                                child: StreamBuilder<List<CarrinhoRecord>>(
                                  stream: queryCarrinhoRecord(
                                    queryBuilder: (carrinhoRecord) =>
                                        carrinhoRecord
                                            .where('usuario',
                                                isEqualTo: currentUserReference)
                                            .where('fechado', isEqualTo: false),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 45,
                                          height: 45,
                                          child: SpinKitCubeGrid(
                                            color: FlutterFlowTheme.of(context)
                                                .lineColor,
                                            size: 45,
                                          ),
                                        ),
                                      );
                                    }
                                    List<CarrinhoRecord>
                                        listViewCarrinhoRecordList =
                                        snapshot.data;
                                    if (listViewCarrinhoRecordList.isEmpty) {
                                      return Center(
                                        child: Image.network(
                                          'https://cdni.iconscout.com/illustration/premium/thumb/man-receiving-canceled-orders-back-4438793-3718471.png',
                                          fit: BoxFit.scaleDown,
                                        ),
                                      );
                                    }
                                    return ListView.builder(
                                      padding: EdgeInsets.zero,
                                      shrinkWrap: true,
                                      scrollDirection: Axis.vertical,
                                      itemCount:
                                          listViewCarrinhoRecordList.length,
                                      itemBuilder: (context, listViewIndex) {
                                        final listViewCarrinhoRecord =
                                            listViewCarrinhoRecordList[
                                                listViewIndex];
                                        return Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 10),
                                          child: Material(
                                            color: Colors.transparent,
                                            elevation: 1,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(7),
                                            ),
                                            child: Container(
                                              width: 100,
                                              height: 70,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 3,
                                                    color: Color(0x33000000),
                                                    offset: Offset(0, 1),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(7),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .customColor3,
                                                  width: 0,
                                                ),
                                              ),
                                              child:
                                                  StreamBuilder<ProdutosRecord>(
                                                stream:
                                                    ProdutosRecord.getDocument(
                                                        listViewCarrinhoRecord
                                                            .codProduto),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 45,
                                                        height: 45,
                                                        child: SpinKitCubeGrid(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .lineColor,
                                                          size: 45,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowProdutosRecord =
                                                      snapshot.data;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            rowProdutosRecord
                                                                .imageIcon,
                                                            'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d1/Image_not_available.png/640px-Image_not_available.png',
                                                          ),
                                                          width: 60,
                                                          height: 60,
                                                          fit: BoxFit.scaleDown,
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 0, 0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                rowProdutosRecord
                                                                    .descricao,
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
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    functions.formatreal(
                                                                        rowProdutosRecord
                                                                            .valorAvista),
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
                                                                            2,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      rowProdutosRecord
                                                                          .unidadeS,
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
                                                              Text(
                                                                functions.somartudo(
                                                                    listViewCarrinhoRecord
                                                                        .valorUnitario,
                                                                    listViewCarrinhoRecord
                                                                        .quantidade),
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
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        0,
                                                                        10,
                                                                        0),
                                                            child: Material(
                                                              color: Colors
                                                                  .transparent,
                                                              elevation: 0,
                                                              shape:
                                                                  RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            7),
                                                              ),
                                                              child: Container(
                                                                width: 120,
                                                                height: 45,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              7),
                                                                  border: Border
                                                                      .all(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                  ),
                                                                ),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          40,
                                                                      icon:
                                                                          FaIcon(
                                                                        FontAwesomeIcons
                                                                            .minus,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            10,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        final carrinhoUpdateData =
                                                                            {
                                                                          'quantidade':
                                                                              FieldValue.increment(-(1.0)),
                                                                          'valorReg':
                                                                              FieldValue.increment(-(listViewCarrinhoRecord.valorUnitario)),
                                                                        };
                                                                        await listViewCarrinhoRecord
                                                                            .reference
                                                                            .update(carrinhoUpdateData);
                                                                        if (listViewCarrinhoRecord.quantidade <=
                                                                            1.0) {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height * 1,
                                                                                  child: ExcluirWidget(
                                                                                    recebeexcl: listViewCarrinhoRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                    ),
                                                                    InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        if (rowProdutosRecord.unidadeS ==
                                                                            'KG') {
                                                                          await showModalBottomSheet(
                                                                            isScrollControlled:
                                                                                true,
                                                                            backgroundColor:
                                                                                Colors.transparent,
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (context) {
                                                                              return Padding(
                                                                                padding: MediaQuery.of(context).viewInsets,
                                                                                child: Container(
                                                                                  height: MediaQuery.of(context).size.height * 1,
                                                                                  child: QuantidadeWidget(
                                                                                    recebeprodquant: listViewCarrinhoRecord.reference,
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        } else {
                                                                          return;
                                                                        }
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        formatNumber(
                                                                          listViewCarrinhoRecord
                                                                              .quantidade,
                                                                          formatType:
                                                                              FormatType.decimal,
                                                                          decimalType:
                                                                              DecimalType.commaDecimal,
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Outfit',
                                                                              fontSize: 12,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          20,
                                                                      borderWidth:
                                                                          1,
                                                                      buttonSize:
                                                                          40,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryText,
                                                                        size:
                                                                            15,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        final carrinhoUpdateData =
                                                                            {
                                                                          'quantidade':
                                                                              FieldValue.increment(1.0),
                                                                          'valorReg':
                                                                              FieldValue.increment(listViewCarrinhoRecord.valorUnitario),
                                                                        };
                                                                        await listViewCarrinhoRecord
                                                                            .reference
                                                                            .update(carrinhoUpdateData);
                                                                      },
                                                                    ),
                                                                  ],
                                                                ),
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
                      Align(
                        alignment: AlignmentDirectional(0, -0.3),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(10, 5, 0, 5),
                          child: StreamBuilder<List<CarrinhoRecord>>(
                            stream: queryCarrinhoRecord(
                              queryBuilder: (carrinhoRecord) => carrinhoRecord
                                  .where('usuario',
                                      isEqualTo: currentUserReference)
                                  .where('fechado', isEqualTo: false),
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 45,
                                    height: 45,
                                    child: SpinKitCubeGrid(
                                      color: FlutterFlowTheme.of(context)
                                          .lineColor,
                                      size: 45,
                                    ),
                                  ),
                                );
                              }
                              List<CarrinhoRecord> textCarrinhoRecordList =
                                  snapshot.data;
                              return Text(
                                formatNumber(
                                  functions.totalQuantidade(
                                      textCarrinhoRecordList
                                          .map((e) => e.quantidade)
                                          .toList()),
                                  formatType: FormatType.decimal,
                                  decimalType: DecimalType.periodDecimal,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Outfit',
                                      color: Color(0xFF00BE3F),
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                    ),
                              );
                            },
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: Container(
                          width: 320,
                          height: 55,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryBtnText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 3,
                                color: Color(0x33000000),
                                offset: Offset(0, 1),
                              )
                            ],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).primaryColor,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10, 0, 0, 0),
                                    child: Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
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
                              Expanded(
                                child: Align(
                                  alignment: AlignmentDirectional(0.85, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child:
                                            StreamBuilder<List<CarrinhoRecord>>(
                                          stream: queryCarrinhoRecord(
                                            queryBuilder: (carrinhoRecord) =>
                                                carrinhoRecord
                                                    .where('usuario',
                                                        isEqualTo:
                                                            currentUserReference)
                                                    .where('fechado',
                                                        isEqualTo: false),
                                          ),
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
                                            List<CarrinhoRecord>
                                                textCarrinhoRecordList =
                                                snapshot.data;
                                            return Text(
                                              functions.totalReal(
                                                  textCarrinhoRecordList
                                                      .map((e) => e.valorReg)
                                                      .toList()),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily: 'Outfit',
                                                        color:
                                                            Color(0xFF00BE3F),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      if (carrinhoCarrinhoRecordList.length >= 1)
                        Expanded(
                          child: Align(
                            alignment: AlignmentDirectional(0, 1),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 10, 0, 5),
                              child: StreamBuilder<List<CarrinhoRecord>>(
                                stream: queryCarrinhoRecord(
                                  queryBuilder: (carrinhoRecord) =>
                                      carrinhoRecord
                                          .where('usuario',
                                              isEqualTo: currentUserReference)
                                          .where('fechado', isEqualTo: false),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 45,
                                        height: 45,
                                        child: SpinKitCubeGrid(
                                          color: FlutterFlowTheme.of(context)
                                              .lineColor,
                                          size: 45,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CarrinhoRecord>
                                      buttonCarrinhoRecordList = snapshot.data;
                                  return FFButtonWidget(
                                    onPressed: () async {
                                      final pedidosCreateData = {
                                        ...createPedidosRecordData(
                                          userCod: currentUserReference,
                                          total: functions.totalQuantidade(
                                              buttonCarrinhoRecordList
                                                  .map((e) => e.valorReg)
                                                  .toList()),
                                          data: getCurrentTimestamp,
                                          situacao: 'Aberta',
                                          fechado: false,
                                        ),
                                        'produtosCart': buttonCarrinhoRecordList
                                            .map((e) => e.reference)
                                            .toList(),
                                      };
                                      await PedidosRecord.collection
                                          .doc()
                                          .set(pedidosCreateData);
                                      await actions.batchUpdate(
                                        buttonCarrinhoRecordList
                                            .map((e) => e.reference)
                                            .toList(),
                                        'fechado',
                                        false,
                                        true,
                                      );
                                    },
                                    text: 'Finalizar Pedido',
                                    icon: Icon(
                                      Icons.add_shopping_cart_outlined,
                                      color: Color(0xFF00BE3F),
                                      size: 20,
                                    ),
                                    options: FFButtonOptions(
                                      width: 320,
                                      height: 50,
                                      color: Colors.transparent,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .subtitle2
                                          .override(
                                            fontFamily: 'Outfit',
                                            color: Color(0xFF00BE3F),
                                            fontSize: 10,
                                            fontWeight: FontWeight.normal,
                                          ),
                                      elevation: 0,
                                      borderSide: BorderSide(
                                        color: Color(0xFF00BE3F),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  );
                                },
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
