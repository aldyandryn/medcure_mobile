import 'package:flutter/material.dart';
import 'package:medcure_mobile/widgets/shop_card.dart';
import 'package:medcure_mobile/widgets/left_drawer.dart';


class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<Button> items = [
    Button("Lihat Item", Icons.checklist, Colors.blueAccent),
    Button("Tambah Item", Icons.add_shopping_cart,Colors.yellowAccent),
    Button("Logout", Icons.logout, Colors.redAccent),
    ];

    @override
    Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'MedCure',
              style: TextStyle(
                color: Colors.white
              ),
            ),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'Welcome To MedCure', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: items.map((Button item) {
                      // Iterasi untuk setiap item
                      return ShopCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ), 
        );
    }
}

