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
        leading: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: IconButton(
            icon: const Icon(Icons.logout),
            color: const Color.fromRGBO(0, 203, 225, 1),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, rLogin, (route) => false);
            },
          ),
        ),
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
              Navigator.pushNamed(context, rCart);
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
                          'description':
                              "Kamar mandi yang bersih dan harum adalah impian semua keluarga. Memiliki kamar mandi yang bebas dari noda, wangi, sehingga nyaman untuk digunakan. Vixal Pembersih Porselen Ekstra Kuat 800ml, cairan pembersih porselen dengan formula hydrochloric acid yang efektif untuk membersihkan noda membandel bahkan karat sekalipun di kamar mandi. Tidak seperti pembersih lainnya*, Vixal membersihkan 10x lebih tangguh segala noda pada permukaan porselen, keramik, mosaik, dan sejenisnya di kamar mandi Anda. Formula tangguhnya dengan cepat membersihkan segala noda pada permukaan poselen, mosaik, keramik, dan sejenisnya pada kamar mandi. Tidak perlu khawatir, meskipun dengan formula tangguh untuk membersihkan noda, Vixal Ekstra Kuat tetap aman digunakan untuk berbagai warna porselen.",
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
                          'description':
                              "MAMA LIME Mama Lemon Extra Clean Fresh Lemon 780ml. Merupakan varian baru cairan pencuci piring dari Sunlight dengan kekuatan lebih dari 100 lemon. Dibuat dengan ekstrak lemon asli dan paduan garam mineral alami yang mampu menghilangkan lemak membandel dan menghilangkan bakteri. Formula barunya mampu membersihkan lemak membandel lebih maksimal, bahkan pada piring atau alat memasak berbahan plastik sekalipun. Juga lembut ditangan Refill 780Ml merupakan varian baru cairan pencuci piring dari Sunlight dengan kekuatan lebih dari 100 lemon.",
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
                          'description':
                              "So Klin Liquid Softergent merupakan deterjen cair konsentrat yang diformulasi memadukan kekuatan concentrate formula yang membersihkan dengan mudah dan cepat dan formula anti bakteri yang membuat pakaian tidak bau meski direndam lama untuk menghasilkan pakaian bersih, bebas bau dan wangi sepanjang hari. Dengan 50% ekstra konsentrat dibanding deterjen cair lainnya dan formula baru Clean and Soft Formula, So Klin Liquid Softergent mampu membersihkan dan mencuci pakaian 2x lebih bersih, serta 2x lebih lembut dan harum.",
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
                          'description':
                              "Lantai yang bersih dan harum tak hanya menjadi dambaan tapi juga dapat menjadi pemberi keceriaan bagi seluruh keluarga. Super Pell Pembersih Lantai Fresh Apple, cairan pembersih lantai dengan formula acti-shine technology yang tak hanya bekerja secara maksimal membersihkan kotoran pada lantai diseluruh ruangan rumah hingga besih dan mengkilau, tapi juga memberikan kesegaran dan kenyamanan tahan lama kepada seluruh keluarga dengan aroma wangi alami, segar dan khas dari ekstrak buah apel. Kandungan formula dalam Super Pell Pembersih Lantai Fresh Apple aktif dan efektif untuk membersihkan lantai rumah secara menyeluruh sehingga lantai menjadi berkilau bersih maksimal dengan wangi alami yang tahan lama.",
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
                          'description':
                              "Memiliki lantai dan ruangan yang bersih dari kuman merupakan salah satu indikasi penting kebersihan rumah secara menyeluruh. Wipol Pembersih Lantai Karbol Cemara memiliki 5 manfaat efektif yaitu: 1) Aktif dan efektif membunuh kuman, 2) Membersihkan lantai hingga bersih dan kesat, 3) Mengandung formula efektif sehingga mampu melindungi keluarga dengan maksimal, 4) Dengan pine action yang efektif untuk menghilangkan bau tidak sedap di lantai, kamar mandi, WC, got, tempat sampah, kandang binatang dan sumber lainnya, 5) Diperkaya dengan kekuatan cemara yang memberi aroma kesegaran di dalam rumah serta perlindungan secara alami. Formula aktif yang terkandung dalam kelima manfaat dalam satu kemasan Wipol Pembersih Lantai Cemara dapat dengan efektif, mudah dan cepat membersihkan kuman yang menempel di seluruh penjuru lantai di setiap ruangan rumah Anda. Setelah penggunaannya, lantai rumah akan terasa lebih higienis, bersih, kesat dan terlihat berkilau sehingga keluarga dapat nyaman bermain di lantai rumah tanpa perlu khawatir terkontaminasi kuman pembawa penyakit dan kesehatan keluarga akan selalu terjaga.",
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
                          'description':
                              "Head & Shoulders Shampoo Anti Dandruff Menthol Dingin dengan formula tiga aksi baru, mampu membersihkan, melindungi, sekaligus melembabkan kulit kepala Anda. Merupakan sampo dengan sensasi dingin yang mampu menyegarkan kulit kepala, anti dandruf, dan mengatasi gatal di kulit kepala.",
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
