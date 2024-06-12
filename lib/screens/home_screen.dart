import 'package:flutter/material.dart';
import 'package:spotless_store/components/custom_card.dart';
import 'package:spotless_store/components/product_card.dart';
import 'package:spotless_store/utils/routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Have a nice day!'),
        actions: [
          IconButton(
            onPressed: () {
              // Aksi ketika ikon notifikasi ditekan
            },
            icon: const Icon(Icons.notifications),
            color: const Color.fromRGBO(0, 203, 225, 1),
          ),
          IconButton(
            onPressed: () {
              // Aksi ketika ikon keranjang ditekan
            },
            icon: const Icon(Icons.shopping_cart),
            color: const Color.fromRGBO(0, 203, 225, 1),
          ),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Container(
              height: 140,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 203, 225, 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Hello, Shopping!',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                        height: 40), // Spasi antara judul dan TextField
                    TextField(
                      style: const TextStyle(
                          fontSize: 16), // Mengatur ukuran teks TextField
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Search...',
                        hintStyle: const TextStyle(
                            fontSize: 16), // Mengatur ukuran teks placeholder
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                              15), // Membuat border rounded
                          borderSide:
                              BorderSide.none, // Menghilangkan garis pinggir
                        ),
                        prefixIcon: const Icon(
                            Icons.search), // Menambahkan ikon pencarian
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 12), // Padding dalam TextField
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text(
              "Kategori",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/sampo.png',
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/cuci.png',
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/pelembut.png',
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/lantai.png',
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Image.asset(
                        'assets/images/deterjen.png',
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/paket.png',
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/wc.png',
                      ),
                    ),
                    Expanded(
                      child: Image.asset(
                        'assets/images/lainnya.png',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Rekomendasi",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  ProductCard(
                    imagePath: 'assets/images/vixal.png',
                    title: 'Vixal',
                    price: "Rp21.000",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        rProductDetail,
                        arguments: {
                          'imagePath': 'assets/images/vixal.png',
                          'title': 'Vixal',
                          'price': "Rp21.000",
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductCard(
                    imagePath: 'assets/images/lemon.png',
                    title: 'Mama Lemon',
                    price: "Rp14.000",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        rProductDetail,
                        arguments: {
                          'imagePath': 'assets/images/lemon.png',
                          'title': 'Mama Lemon',
                          'price': "Rp14.000",
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductCard(
                    imagePath: 'assets/images/soklin.png',
                    title: 'SoKlin',
                    price: "Rp13.000",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        rProductDetail,
                        arguments: {
                          'imagePath': 'assets/images/soklin.png',
                          'title': 'SoKlin',
                          'price': "Rp13.000",
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductCard(
                    imagePath: 'assets/images/super.png',
                    title: 'Super Pell',
                    price: "Rp18.000",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        rProductDetail,
                        arguments: {
                          'imagePath': 'assets/images/super.png',
                          'title': 'Super Pell',
                          'price': "Rp18.000",
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductCard(
                    imagePath: 'assets/images/wipol.png',
                    title: 'Wipol',
                    price: "Rp10.000",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        rProductDetail,
                        arguments: {
                          'imagePath': 'assets/images/wipol.png',
                          'title': 'Wipol',
                          'price': "Rp10.000",
                        },
                      );
                    },
                  ),
                  const SizedBox(width: 10),
                  ProductCard(
                    imagePath: 'assets/images/lifebuoy.png',
                    title: 'Lifebuoy',
                    price: "Rp25.000",
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        rProductDetail,
                        arguments: {
                          'imagePath': 'assets/images/lifebuoy.png',
                          'title': 'Lifebuoy',
                          'price': "Rp25.000",
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
            const CustomCard(
              imagePath: 'assets/images/card.png',
              title:
                  'Jadikan rumah Anda bersih dan nyaman dengan produk-produk pilihan kami!',
              description:
                  'Dapatkan pengalaman berbelanja yang menyenangkan untuk kebutuhan kebersihan rumah Anda.',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue, // Warna ikon saat dipilih
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Transaksi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Pesan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Akun',
          ),
        ],
        onTap: (index) {
          // Handle navigation to different screens based on index
        },
      ),
    );
  }
}
