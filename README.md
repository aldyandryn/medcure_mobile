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


# TUGAS 8

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
Jawab:
- `Navigator.push()`: untuk menavigasi menuju halaman lain dalam stack navigation dan dapat back ke halaman sebelumnya dengan tombol kembali/`Navigator.pop()`. Contoh penggunaan :
```
// Menambah navigasi pada tombol Tambah Item
          if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ));
          }
          // Menambah navigasi pada tombol Lihat Item
          if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowItems(itemList: Item.itemList),
                ));
          }
```
- `Navigator.pushReplacement()`:     - Digunakan untuk routing halaman baru juga tapi dengan dengan mereplace halaman dimana user berada dengan halaman baru pada stack navigation, sehingga user tidak dapat kembali ke halaman sebelumnya.
. Contoh penggunaan :
```
Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowItems(itemList: Item.itemList),
                  )
              );
            },
```

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
Jawab:
- Center: menyesuaikan posisi child di tengah.
- Row: sama seperti column, tapi secara horizontal
- Stack: menyusun children secara bertumpuk.
- Expanded:memperluas child dari Row, Column, atau Flex.
- Column: menampilkan daftar child widget secara vertikal.
- Container: mengelompokkan widget lain dan mengatur terhadap layout attribute seperti margin dan padding.
- ListView: membuat daftar widget menjadi scrollable.
- GridView: menempatkan children dalam grid/daftar grid yang diatur secara vertikal dan horizontal untuk mengatur letak/card.
- Flexible: mengontrol bagaimana child dari widget flex dapat mengisi ruang yang masih ada.
- Wrap: menampilkan childnya dalam beberapa baris vertikal atau horizontal selama ruangnya cukup


### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Jawab:
Saya membuat 4 elemen input dalam Form, antara lain: 
- `Nama Item` menggunakan widget TextFormField yang menerima input 'Nama Item' dari user yang ditambahkan validator agar field ini tidak boleh kosong.
- `Harga` menggunakan widget TextFormField yang menerima input 'Harga Item' dari user yang ditambahkan validator agar field ini tidak boleh kosong dan harus berupa angka.
- `Amount` menggunakan widget TextFormField yang menerima input 'Jumlah Item' dari user yang ditambahkan validator agar field ini tidak boleh kosong dan harus berupa angka.
- `Deskripsi` menggunakan widget TextFormField yang menerima input 'Deskripsi Item' dari user yang ditambahkan validator agar field ini tidak boleh kosong..

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
Jawab:
Clean architecture merupakan prinsip *software design* yang memisahkan kode menjadi beberapa lapisan yang memiliki tujuan dan tanggung jawab yang berbeda. Hal ini untuk menjadikan kode menjadi modular, dapat diskalakan, dan dapat diuji (separation of concern). Clean Architecture pada aplikasi Flutter terdiri dari tiga lapisan utama (separation of concerns):

- Domain Layer:
    - Logika bisnis dan aturan aplikasi.
    - Model dan use case yang independen.

- Data Layer:
    - Implementasi akses data eksternal.
    - Mengimplementasikan interface dari domain layer.

- Feature Layer:
    - Menangani logika UI dan interaksi pengguna.
    - Membangun UI dengan widget flutter


### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
Jawab:
- Membuat minimal satu halaman baru pada aplikasi, yaitu halaman formulir tambah item baru 
   * Membuat file `shoplist_form.dart` yang berisikan kode untuk membuat form yang menerima input nama item, harga, amount, dan deskripsi.
     - Memakai minimal tiga elemen input, yaitu name, amount, description. Tambahkan elemen input sesuai dengan model pada aplikasi tugas Django yang telah kamu buat. 
        ```
          // Variabel untuk menyimpan input dari tiap field
          String _name = "";
          int _price = 0;
          int _amount = 0;
          String _description = "";

        ```
        * Di sini saya menggunakan 4 variabel input yang masing-masing menggunakan TextField
     - Memiliki sebuah tombol Save.
        ```
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Colors.amber),
                  ),
                  .....
               )
          )
        ```
        * Tombol tersebut dibungkus oleh widget Align.
        * Menggunakan onPressed() untuk melakukan aksi ketika tombol diklik dan apabila valid akan muncul Pop-up.
     - Setiap elemen input di formulir juga harus divalidasi dengan ketentuan
          * Menggunakan validator di tiap TextFormField()
          ```
          validator: (String? value) {
               ....
          }
          ```
          Jika input tidak sesuai ketentuan, maka akan meminta input kembali 
          * Memastikan input tidak kosong
          ```
          validator: (String? value) {
               if (value == null || value.isEmpty) {
                    ....
               }
               ....
          }
          ```
          * Memastikan input berisikan data dengan tipe data atribut model.
          => Jika tipe data int
          ```
          validator: (String? value) {
               ....
               if (int.tryParse(value) == null) {
                    ....
               }
               return null;
          },
          ```
          => Jika tipe data String hanya perlu memastikan field tidak kosong

- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol Tambah Item pada halaman utama.
   * menggunakan `Navigator.push()` untuk redirect ke halaman form. 
     ```
    if (item.name == "Tambah Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ShopFormPage(),
                ));
          }
     ```

- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
   * Menggunakan onPressed() dan `showDialog()` serta `AlertDialog()`
     ```
    onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: const Color.fromRGBO(237, 222, 173, 1.0),
                            title: const Text('Item berhasil disimpan'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: $_name'),
                                  Text('Harga: $_price'),
                                  Text('Amount: $_amount'),
                                  Text('Deskripsi: $_description'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                   _formKey.currentState!.reset();
                                    Item.itemList.add(Item(_name, _price, _amount, _description));
                                },
                              ),
                            ],
                          );
                        },
                      );
                      _formKey.currentState!.reset();
                    }
                  },
     ```

- Membuat sebuah drawer pada aplikasi dengan ketentuan sebagai berikut:
   * Membuat file `left_drawer.dart`
     - Drawer minimal memiliki dua buah opsi, yaitu Halaman Utama dan Tambah Item.
        * Menambahkan widget yaitu `ListTile()` untuk dua opsi tersebut
        ```
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('Halaman Utama'),
            // Bagian redirection ke MyHomePage
           ...
          ),

          ListTile(
            leading: const Icon(Icons.add_task),
            title: const Text('Tambah Item'),
            // Bagian redirection ke ShopFormPage
            ....
          ),
        ```
     - Ketika memiih opsi Halaman Utama, maka aplikasi akan mengarahkan pengguna ke halaman utama.
        * Membuat routing dengan menggunakan `Navigator.pushReplacement()` dan mengarahkan ke `MyHomePage()`
        ```
        ListTile(
              ...
              // Redirection ke MyHomePage
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(),
                  )
                );
              },
            ),
        ```
     - Ketika memiih opsi Tambah Item, maka aplikasi akan mengarahkan pengguna ke halaman form tambah item baru
        * Membuat routing dengan menggunakan `Navigator.push()` dan mengarahkan ke `ShopFormPage()`
        ```
        ListTile(
              ...
              // Redirection ke ShopFormPage
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShopFormPage(),
                  )
                );
              },
            ),
        ```

### 2. Implementasi Bonus
- Membuat sebuah halaman baru, yaitu halaman daftar item yang sudah dibuat dengan isi halamannya adalah setiap data produk yang sudah pernah dibuat
  * Membuat list dengan nama itemList
    ```
      class Item {
      static List<Item> itemList = [];
      String name;
      int price;
      int amount;
      String description;

      Item(this.name, this.price, this.amount, this.description);
    }
    ```

  * Nanti setiap menambahkan produk, maka produk tersebut akan disimpan ke list ini
    ```
    actions: [
      TextButton(
        child: const Text('OK'),
        onPressed: () {
          ...
            Item.itemList.add(Item(_name, _price, _amount, _description));
        },
      ),
    ],
    ```
  
  * Membuat halaman show_product untuk menampilkan product yang di-add
    ```
    import 'package:flutter/material.dart';
    import 'package:medcure_mobile/screens/shoplist_form.dart';
    import 'package:medcure_mobile/widgets/left_drawer.dart';

    class ShowItems extends StatelessWidget {
      final List<Item> itemList;

      const ShowItems({Key? key, required this.itemList}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Center(
              child : Text(
                  'Daftar Item',
                  style: TextStyle(
                      color: Colors.white
                  )
              ),
            ),
            backgroundColor: Colors.blueGrey,
            foregroundColor: Colors.white,
          ),
          drawer: const LeftDrawer(),
          body: ListView.builder(
            itemCount: itemList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(itemList[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Harga: ${itemList[index].price}'),
                        Text('Jumlah: ${itemList[index].amount}'),
                        Text('Deskripsi: ${itemList[index].description}'),
                      ],
                    ),
                    onTap: () {
                      // Untuk menambahkan logika untuk menavigasi ke halaman detail produk jika diperlukan.
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Detail Item'),
                            content: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Nama: ${itemList[index].name}'),
                                  Text('Harga: ${itemList[index].price}'),
                                  Text('Jumlah: ${itemList[index].amount}'),
                                  Text('Deskripsi: ${itemList[index].description}'),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                  ),
                  Divider(), // Add this line to insert a divider between items
                ],
              );
            },
          ),
        );
      }
    }
    ```
  
  * Menambahkan drawer di `left_drawer.dart`
    ```
    ListTile(
            leading: const Icon(Icons.list_sharp),
            title: const Text('Daftar Item'),
            // Bagian redirection ke Show product
            onTap: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ShowItems(itemList: Item.itemList),
                  )
              );
            },
          ),
    ```
  
  * Menambahkan navigasi `Lihat Item` di `shop_card.dart`
  ```
  // Menambah navigasi pada tombol Lihat Item
          if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ShowItems(itemList: Item.itemList),
                ));
          }
  ```
  
# Referensi
- [Memahami Navigasi Routing di Flutter](https://belajarflutter.com/memahami-navigasi-routing-di-flutter/)
- [Flutter #4 – Mengenal Dasar Widget Flutter](https://juragankoding.com/2020/08/mengenal-dasar-widget-flutter/)
- [Clean Architecture untuk Development REST-API yang Maintainable](https://blog.dot.co.id/clean-architecture-untuk-development-rest-api-yang-maintainable-9212e05fe38b)

# Tugas 9

## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
1. Sistem autentikasi dan halaman login
- melakukan startapp authentication lalu tambahkan authentication di Installed Apps settings.py dan corsheader
- Install lib corsheader dan tambahkan  dan tambahkan variabel berikut
```
CORS_ALLOW_ALL_ORIGINS = True
CORS_ALLOW_CREDENTIALS = True
CSRF_COOKIE_SECURE = True
SESSION_COOKIE_SECURE = True
CSRF_COOKIE_SAMESITE = 'None'
SESSION_COOKIE_SAMESITE = 'None'
```
- tambahkan ini di view.py di authentication

```
from django.shortcuts import render
from django.contrib.auth import authenticate, login as auth_login
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

@csrf_exempt
def login(request):
    username = request.POST['username']
    password = request.POST['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        if user.is_active:
            auth_login(request, user)
            # Status login sukses.
            return JsonResponse({
                "username": user.username,
                "status": True,
                "message": "Login sukses!"
                # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
            }, status=200)
        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, akun dinonaktifkan."
            }, status=401)

    else:
        return JsonResponse({
            "status": False,
            "message": "Login gagal, periksa kembali email atau kata sandi."
        }, status=401)
```
- Buat file urls.py di authenticatin dan tambahkan:
```
from django.urls import path
from authentication.views import login

app_name = 'authentication'

urlpatterns = [
    path('login/', login, name='login'),
]
```
- Tambahkan path('auth/', include('authentication.urls')), pada file medcure/urls.py
- Buat halaman login.dart di screen project flutter
```
import 'package:medcure_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("http://localhost:8000//auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                }
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```
- Pada file main.dart, pada Widget MaterialApp(...), ubah home: MyHomePage() menjadi home: LoginPage()

2. Membuat model kustom sesuai dengan proyek aplikasi Django.
- Menggunakan QuickType (hampir sama seperti tutorial)

3. Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
- Buat halaman list_product.dart di screen
```
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:medcure_mobile/models/product.dart';
import 'package:medcure_mobile/screens/item_details_page.dart';
import 'package:medcure_mobile/widgets/left_drawer.dart';

class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Product>> fetchProduct() async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'http://localhost:8000//json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Product
    List<Product> list_product = [];
    for (var d in data) {
        if (d != null) {
            list_product.add(Product.fromJson(d));
        }
    }
    return list_product;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text('Product'),
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchProduct(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data produk.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                        "${snapshot.data![index].fields.name}",
                                        style: const TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("${snapshot.data![index].fields.price}"),
                                      const SizedBox(height: 10),
                                      Text("${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "${snapshot.data![index].fields.description}"),
                                      const SizedBox(height: 10),
                                      ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                                  Colors.grey.shade700),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => ItemDetailsPage(
                                                    snapshot.data![index])),
                                          );
                                        },
                                        child: const Text(
                                          "See Details",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                  ],
                                
                                ),
                            ));
                    }
                }
            }));
    }
}
```

- Ubah redirection daftar item di left_drawer.dart menjadi:
  
```
ListTile(
            leading: const Icon(Icons.shopping_basket),
            title: const Text('Daftar Item'),
            onTap: () {
                // Route menu ke halaman produk
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProductPage(),
                )
              );
            },
          ),
```

- Begitu juga di shop_card.dart, ubah material page route nya:
  
```
else if (item.name == "Lihat Item") {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProductPage()));
          }
```

4.  Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.
- Buat file di screen dengan nama item_details_pager.dart

- tambahkan elevated button dan redirecting ke ItemDetailsPage di dalam children

```
ElevatedButton(
style: ButtonStyle(
backgroundColor:
 MaterialStateProperty.all<Color>(Colors.blueGrey),
),
onPressed: () {
Navigator.push(context,MaterialPageRoute(builder: (context) => ItemDetailsPage(snapshot.data![index])),
);
},
child: const Text(
"See Details",
style: TextStyle(color: Colors.white),
),
),
```
