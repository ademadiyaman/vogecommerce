import 'package:flutter/material.dart';

enum TabItem {
  Anasayfa,
  Favoriler,
  Tasarim,
  Sepetim,
  Hesabim,
}

class TabItemData {
  final IconData icon;

  TabItemData(this.icon);
  static Map<TabItem, TabItemData> tumTablar = {
    TabItem.Anasayfa: TabItemData(Icons.home),
    TabItem.Favoriler: TabItemData(Icons.favorite_border_outlined),
    TabItem.Tasarim: TabItemData(Icons.cut_outlined),
    TabItem.Sepetim: TabItemData(Icons.shopping_cart_outlined),
    TabItem.Hesabim: TabItemData(Icons.person_outline),
  };
}
