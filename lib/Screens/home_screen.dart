import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vog_demo/Models/user.dart';
import 'package:vog_demo/Screens/anasayfa.dart';
import 'package:vog_demo/Screens/favoriler.dart';
import 'package:vog_demo/Screens/hesabim.dart';
import 'package:vog_demo/Screens/sepetim.dart';
import 'package:vog_demo/Screens/tasarim.dart';
import 'package:vog_demo/Services/auth_base.dart';
import 'package:vog_demo/Services/firebase_auth_service.dart';
import 'package:vog_demo/ViewModels/user_model.dart';
import 'package:vog_demo/Widgets/my_custom_bottom_navigation.dart';
import 'package:vog_demo/Widgets/tab_items.dart';
import 'package:vog_demo/locator.dart';

class HomeScreen extends StatefulWidget {
  final Uzer? uzer;
  AuthBase authService = locator<FirebaseAuthService>();
  HomeScreen({Key? key, this.uzer}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TabItem _currentTab = TabItem.Anasayfa;

  Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys = {
    TabItem.Anasayfa: GlobalKey<NavigatorState>(),
    TabItem.Favoriler: GlobalKey<NavigatorState>(),
    TabItem.Tasarim: GlobalKey<NavigatorState>(),
    TabItem.Sepetim: GlobalKey<NavigatorState>(),
    TabItem.Hesabim: GlobalKey<NavigatorState>(),
  };
  Map<TabItem, Widget> tumSayfalar() {
    return {
      TabItem.Anasayfa: AnasayfaPage(),
      TabItem.Favoriler: FavorilerPage(),
      TabItem.Tasarim: TasarimPage(),
      TabItem.Sepetim: SepetimPage(),
      TabItem.Hesabim: HesabimPage(),
    };
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: MyCustomBottomNavigation(
          currentTab: _currentTab,
          onSelectedTab: (secilenTab) {
            if (secilenTab == _currentTab) {
              navigatorKeys[secilenTab]!
                  .currentState!
                  .popUntil((route) => route.isFirst);
            } else {
              setState(() {
                _currentTab = secilenTab;
              });
            }
          },
          sayfaOlusturucu: tumSayfalar(),
          navigatorKeys: navigatorKeys),
      onWillPop: () async =>
          await navigatorKeys[_currentTab]!.currentState!.maybePop(),
    );
  }
}
