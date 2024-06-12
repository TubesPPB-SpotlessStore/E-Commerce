import 'package:flutter/material.dart';

import '../../constant.dart';
// import '../screens/login.dart';
import '../../components/splash2_content.dart';

class SplashScreen2 extends StatefulWidget {
  static String routeName = "/splash2";

  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen2> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      "text":
          "Belanja \nJelajahi fitur - fitur kami dan \ntemukan yang terbaik untuk Anda.",
      "image": "assets/images/splash_1.png"
    },
    {
      "text":
          "Promo \nRaih promo belanja eksklusif \ndan mulai nikmati penawaran \nistimewa hari ini",
      "image": "assets/images/splash_2.png"
    },
    {
      "text":
          "Belanja \nSetiap produk yang kamu beli \nadalah kontribusi nyata untuk Kebersihan",
      "image": "assets/images/splash_3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => SplashContent2(
                      image: splashData[index]["image"],
                      text: splashData[index]['text'],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            splashData.length,
                            (index) => AnimatedContainer(
                              duration: kAnimationDuration,
                              margin: const EdgeInsets.only(right: 5),
                              height: 6,
                              width: currentPage == index ? 20 : 6,
                              decoration: BoxDecoration(
                                color: currentPage == index
                                    ? kPrimaryColor
                                    : const Color(0xFFD8D8D8),
                                borderRadius: BorderRadius.circular(3),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          // Modified this part
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/login");
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF00CBE1),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Text("Next",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // Positioned untuk meletakkan widget di atas stack
            Positioned(
              top: 10,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Row(
                  children: [
                    const Text(
                      "Skip",
                      style: TextStyle(
                        fontSize: 20,
                        color: kPrimaryColor,
                      ),
                    ),
                    Image.asset(
                      'assets/icons/arrow.png',
                      height: 40,
                      width: 25,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
