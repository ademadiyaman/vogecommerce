import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vog_demo/Widgets/tab_items.dart';

class MyCustomBottomNavigation extends StatelessWidget {
  const MyCustomBottomNavigation(
      {Key? key,
      required this.currentTab,
      required this.onSelectedTab,
      required this.sayfaOlusturucu,
      required this.navigatorKeys})
      : super(key: key);
  final TabItem currentTab;
  final ValueChanged<TabItem> onSelectedTab;
  final Map<TabItem, Widget> sayfaOlusturucu;
  final Map<TabItem, GlobalKey<NavigatorState>> navigatorKeys;

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        height: 60,
        activeColor: Colors.green.shade500,
        iconSize: 28,
        items: [
          _navItemOlustur(TabItem.Anasayfa),
          _navItemOlustur(TabItem.Favoriler),
          _navItemOlustur(TabItem.Tasarim),
          _navItemOlustur(TabItem.Sepetim),
          _navItemOlustur(TabItem.Hesabim),
        ],
      ),
      tabBuilder: (context, index) {
        final gosterilecekItem = TabItem.values[index];
        return CupertinoTabView(
          navigatorKey: navigatorKeys[gosterilecekItem],
          builder: (context) {
            return sayfaOlusturucu[gosterilecekItem]!;
          },
        );
      },
    );
  }

  BottomNavigationBarItem _navItemOlustur(TabItem tabItem) {
    final olusturulacakTab = TabItemData.tumTablar[tabItem];
    return BottomNavigationBarItem(
      icon: Icon(olusturulacakTab!.icon),
    );
  }
}
