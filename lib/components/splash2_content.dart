import 'package:flutter/material.dart';

class SplashContent2 extends StatefulWidget {
  const SplashContent2({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  State<SplashContent2> createState() => _SplashContentState();
}

class _SplashContentState extends State<SplashContent2> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        Image.asset(
          widget.image!,
          height: 400,
          width: 300,
        ),
        Text(widget.text!,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
            )),
      ],
    );
  }
}
