import 'package:flutter/material.dart';
import 'package:vog_demo/Models/user.dart';
import 'package:vog_demo/Services/auth_base.dart';
import 'package:vog_demo/Widgets/sepete_ekle.dart';

class AnasayfaPage extends StatefulWidget {
  late final AuthBase? authService;
  late final Uzer? uzer;
  AnasayfaPage({Key? key, this.uzer}) : super(key: key);

  @override
  _AnasayfaPageState createState() => _AnasayfaPageState();
}

class _AnasayfaPageState extends State<AnasayfaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        title: Stack(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                "Teslimat Adresi",
                style: TextStyle(fontSize: 10, color: Colors.grey),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text(
                "İstanbul, Türkiye ",
                style: TextStyle(fontSize: 13, color: Colors.black),
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.messenger_outline,
                    color: Colors.black,
                    size: 28,
                  ),
                ),
                Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.black,
                  size: 28,
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 3,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 333,
                    height: 45,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          filled: true,
                          hintText: 'İstediğiniz Ürünleri Arayabilirsiniz!',
                          hintStyle:
                              TextStyle(fontSize: 13, color: Colors.grey)),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 333,
                    height: 120,
                    color: Colors.grey,
                    child: Center(
                      child: Text(
                        "Önce Dene Sonra Al",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "Kategoriler",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                    child: Icon(
                      Icons.person_add_alt_1_outlined,
                      size: 34,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                    child: Icon(
                      Icons.mail_outline,
                      size: 34,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                    child: Icon(
                      Icons.settings,
                      size: 34,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: ClipOval(
                    child: Icon(
                      Icons.whatshot,
                      size: 34,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Text(
                    "En Yeniler",
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black12,
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        "Vog Örgü SH 02 Grey",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "499 TL",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SepeteEkle(
                        text: 'Sepete Ekle',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black12,
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        "Vog Kashmir SH 04 Grey",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "999 TL",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SepeteEkle(
                        text: 'Sepete Ekle',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black12,
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        "Vog Örgü SH 02 Grey",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "499 TL",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SepeteEkle(
                        text: 'Sepete Ekle',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black12,
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        "Vog Örgü SH 02 Grey",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "499 TL",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SepeteEkle(
                        text: 'Sepete Ekle',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black12,
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        "Vog Örgü SH 02 Grey",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "499 TL",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SepeteEkle(
                        text: 'Sepete Ekle',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        color: Colors.black12,
                        width: 150,
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: Text(
                        "Vog Örgü SH 02 Grey",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        "499 TL",
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(1),
                      child: SepeteEkle(
                        text: 'Sepete Ekle',
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 90,
            ),
          ],
        ),
      ),
    );
  }
}
