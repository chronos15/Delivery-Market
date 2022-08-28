import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'auth/firebase_user_provider.dart';
import 'auth/auth_util.dart';
import 'backend/push_notifications/push_notifications_util.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'index.dart';

import 'backend/stripe/payment_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();

  FFAppState(); // Initialize FFAppState

  await initializeStripe();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  Stream<MobAPIFirebaseUser> userStream;
  MobAPIFirebaseUser initialUser;
  bool displaySplashImage = true;

  final authUserSub = authenticatedUserStream.listen((_) {});
  final fcmTokenSub = fcmTokenUserStream.listen((_) {});

  @override
  void initState() {
    super.initState();
    userStream = mobAPIFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 1),
      () => setState(() => displaySplashImage = false),
    );
  }

  @override
  void dispose() {
    authUserSub.cancel();
    fcmTokenSub.cancel();
    super.dispose();
  }

  void setLocale(String language) =>
      setState(() => _locale = createLocale(language));
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobAPI',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [
        Locale('pt'),
      ],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      home: initialUser == null || displaySplashImage
          ? Container(
              color: Colors.white,
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/FOOD.gif',
                  fit: BoxFit.scaleDown,
                ),
              ),
            )
          : currentUser.loggedIn
              ? PushNotificationsHandler(child: NavBarPage())
              : LoginWidget(),
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key key, this.initialPage}) : super(key: key);

  final String initialPage;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPage = 'HomePage';

  @override
  void initState() {
    super.initState();
    _currentPage = widget.initialPage ?? _currentPage;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'HomePage': HomePageWidget(),
      'Grupos': GruposWidget(),
      'carrinho': CarrinhoWidget(),
      'Pedidos': PedidosWidget(),
      'perfil': PerfilWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPage);
    return Scaffold(
      body: tabs[_currentPage],
      bottomNavigationBar: GNav(
        selectedIndex: currentIndex,
        onTabChange: (i) =>
            setState(() => _currentPage = tabs.keys.toList()[i]),
        backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
        color: Color(0xFF838383),
        activeColor: FlutterFlowTheme.of(context).lineColor,
        tabBackgroundColor: Color(0x00000000),
        tabActiveBorder: Border.all(
          color: Color(0x574B39EF),
          width: 0.9,
        ),
        tabBorderRadius: 10,
        tabMargin: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
        padding: EdgeInsetsDirectional.fromSTEB(20, 15, 10, 15),
        gap: 10,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        duration: Duration(milliseconds: 500),
        haptic: true,
        tabs: [
          GButton(
            icon: FontAwesomeIcons.home,
            text: 'Inicio',
            textStyle: GoogleFonts.getFont(
              'Poppins',
              color: FlutterFlowTheme.of(context).secondaryText,
            ),
            iconSize: 20,
          ),
          GButton(
            icon: Icons.format_list_bulleted_rounded,
            text: 'Grupos',
            textStyle: GoogleFonts.getFont(
              'Poppins',
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12,
            ),
            iconSize: 25,
          ),
          GButton(
            icon: Icons.shopping_cart_outlined,
            text: 'Carrinho',
            textStyle: TextStyle(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12,
            ),
            iconSize: 24,
          ),
          GButton(
            icon: Icons.note,
            text: 'Pedidos',
            textStyle: TextStyle(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12,
            ),
            iconSize: 24,
          ),
          GButton(
            icon: FontAwesomeIcons.solidUser,
            text: 'Perfil',
            textStyle: TextStyle(
              color: FlutterFlowTheme.of(context).secondaryText,
              fontSize: 12,
            ),
            iconSize: 19,
          )
        ],
      ),
    );
  }
}
