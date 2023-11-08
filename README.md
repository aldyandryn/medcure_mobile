# medcure_mobile 
Nama: Aldyandry N ||
NPM: 2206809936 ||
Kelas: PBP B

# Tugas 7

## Perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter
 - Stateless widget merupakan widget yang statis dan tidak dapat diubah karena seluruh konfigurasinya telah diinisiasi sejak awal
 - Stateful widget merupakan widget yang dinamis sehingga tampilannya dapat diubah sesuai response dari events yang dilakukan

## Sebutkan widget yang digunakan dan fungsinya masing-masing
- `MyHomepage` yang merupakan `StatelessWidget` digunakan sebagai elemen kunci untuk mengorganisir tampilan dan kerangka halaman utama.
- `Scaffold` menyediakan kerangka dasar untuk aplikasi
- `AppBar` berfungsi sebagai bar aplikasi di bagian atas dengan teks dan warna latar.
- `SingleChildScrollView` memungkinkan isi untuk di-scroll apabila panjangnya melewati batas layar.
- `Padding` diterapkan untuk memberikan jarak di dalam elemen.
- `Column` menata item-item secara berurutan ke bawah.
- `Text` digunakan untuk menunjukkan teks di dalam aplikasi.
- `GridView.count` menciptakan susunan grid dengan jumlah kolom yang ditentukan, dalam hal ini tiga untuk menampung tiga card.
- `ShopCard`, yang juga merupakan `StatelessWidget`, berperan sebagai elemen untuk setiap kartu yang menampilkan teks dan ikon.
- `Material` menentukan tampilan visual dan interaksi dari kartu.
- `InkWell` menjadikan kartu sensitif terhadap sentuhan dan menangani reaksi dari interaksi tersebut.
- `Container` digunakan untuk memuat dan menempatkan `Text` dan `Icon` dalam card.

## Cara implementasi checklist
1. Membuat direktori baru dan melakukan create dengan perintah `flutter create medcure_mobile`
2. Menambahkan file `menu.dart` pada medcure_mobile/lib
3. Memindahkan class `MyHomePage` dan `_MyHomePageState` dari `main.dart` ke `menu.dart` dan melakukan import `menu.dart` ke `main.dart` untuk mengimport `MyHomePage` yang sudah dipindah
        ```dart
        import 'package:flutter/material.dart';
        ```
4. Mengubah `home` pada `main.dart`
    ```dart
        ...
        home: MyHomePage(),
        ...
        ```
    lalu lakukan import `import 'package:medcure_mobile/menu.dart';`
5. Menghapus state `MyHomePage` dari `menu.dart` yaitu `_MyHomePageState`
6. Merubah widget `MyHomePage` menjadi stateless
    ```dart
        class MyHomePage extends StatelessWidget {
            MyHomePage({Key? key}) : super(key: key);

            // This widget is the home page of your application. It is stateful, meaning
            // that it has a State object (defined below) that contains fields that affect
            // how it looks.

            // This class is the configuration for the state. It holds the values (in this
            // case the title) provided by the parent (in this case the App widget) and
            // used by the build method of the State. Fields in a Widget subclass are
            // always marked "final".


            @override
            Widget build(BuildContext context) {
                return Scaffold(
                    .....
                )
            }
        }
        ```
  7. Membuat class `ShopItem` untuk button pada homepage dengan attribute nama, icon, dan warna (bonus)
      ```dart
        class ShopItem {
        final String name;
        final IconData icon;

        ShopItem(this.name, this.icon);
        }
        ```
  9.  Membuat class `ShopCard` untuk mengatur tampilan dan action button termasuk untuk snackbar
      ```
      class ShopCard extends StatelessWidget {
          final ShopItem item;
        
          const ShopCard(this.item, {super.key}); // Constructor
        
          @override
          Widget build(BuildContext context) {
            return Material(
              child: InkWell(
                // Area responsive terhadap sentuhan
                onTap: () {
                  // Memunculkan SnackBar ketika diklik
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(SnackBar(
                        content: Text("Kamu telah menekan tombol ${item.name}!")));
                },
                child: Container(
                  // Container untuk menyimpan Icon dan Text
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          item.icon,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        const Padding(padding: EdgeInsets.all(3)),
                        Text(
                          item.name,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        }
        ```
10. Membuat list `items` berisi `ShopItem` pada class `MyHomePage`
    ```
     final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
    ];
    ```
11. Tambahkan kode berikut pada bagian padding di widget build
    ```
     GridView.count(
      // Container pada card kita.
      primary: true,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 3,
      shrinkWrap: true,
      children: items.map((ShopItem item) {
        // Iterasi untuk setiap item
        return ShopCard(item);
      }).toList(),
    ```

 ## Cara mengerjakan bonus
1. Di class `ShopItem` tambahkan constructor color
     ```
    class ShopItem {
      final String name;
      final IconData icon;
      final Color color;
    
      ShopItem(this.name, this.icon, this.color);
    }

   ```

2. Tambahkan `color: item.color` di kelas ShopCard, tepatnya di bawah `return Material ( ... ) ` sehingga menjadi:
 ```
  
  class ShopCard extends StatelessWidget {
    final ShopItem item;
  
    const ShopCard(this.item, {super.key}); // Constructor
  
    @override
    Widget build(BuildContext context) {
      return Material(
        color: item.color,
        child: InkWell(
          // Area responsive terhadap sentuhan
          onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")));
          },
          child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  const Padding(padding: EdgeInsets.all(3)),
                  Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
  ```

3. Ubah list `ShopItem` menjadi:
    ```
    final List<ShopItem> items = [
        ShopItem("Lihat Item", Icons.checklist, Colors.blueAccent),
        ShopItem("Tambah Item", Icons.add_shopping_cart,Colors.yellowAccent),
        ShopItem("Logout", Icons.logout, Colors.redAccent),
        ];
    ```

     
    
# Referensi
- [Flutter – Stateless Vs Stateful](https://www.kawankoding.id/flutter-stateless-vs-stateful/)
- [Flutter Documentation](https://api.flutter.dev/flutter/widgets/widgets-library.html)
