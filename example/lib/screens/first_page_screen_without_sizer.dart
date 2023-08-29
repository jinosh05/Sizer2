import 'package:example/util/constant.dart';
import 'package:example/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstPageScreenWithoutSizer extends StatefulWidget {
  const FirstPageScreenWithoutSizer({
    Key? key,
  }) : super(key: key);

  @override
  FirstPageScreenWithoutSizerState createState() =>
      FirstPageScreenWithoutSizerState();
}

class FirstPageScreenWithoutSizerState
    extends State<FirstPageScreenWithoutSizer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          widMainImg(),
          Expanded(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              widTitle(),
              const SizedBox(
                height: 20,
              ),
              widDesc()
            ],
          )),
        ],
      ),
    );
  }

  widMainImg() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Image.asset(Constant.img1,
          height: MediaQuery.of(context).size.height / 2),
    );
  }

  widTitle() {
    return Text(Strings.appname,
        style: GoogleFonts.lato(
          textStyle: const TextStyle(fontSize: 35.0, color: Colors.black),
        ));
  }

  widDesc() {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Text(
          Strings.appDesc,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle: const TextStyle(
                height: 1.3, fontSize: 15.0, color: Colors.grey),
          ),
        ));
  }
}
