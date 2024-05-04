import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailEdc = TextEditingController();
  final passEdc = TextEditingController();
  bool passInvisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: ListView(
          children: [
            Image.asset(
              'assets/images/login.png',
              width: 200,
              height: 200,
            ),
            SizedBox(
              height: 15,
            ),
            // Text(
            //   "Silahkan masukan username dan password anda",
            //   style: TextStyle(
            //     fontSize: 14,
            //   ),
            // ),
            SizedBox(
              height: 25,
            ),
            Text(
              "username",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: emailEdc,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "password",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: passEdc,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(
                      passInvisible ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      passInvisible = !passInvisible;
                    });
                  },
                ),
              ),
              obscureText: !passInvisible,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00CBE1),
                  elevation: 4,
                  // shape: RoundedRectangleBorder(
                  //     borderRadius: BorderRadius.circular(50))
                ),
                child: Text(
                  "Masuk",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white),
                )),
            SizedBox(
              height: 25,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Belum punya akun ?"),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/register');
                  },
                  child: Text(
                    "Daftar",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      decoration:
                          TextDecoration.combine([TextDecoration.underline]),
                      decorationColor: Colors.black,
                      decorationThickness: 2,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
