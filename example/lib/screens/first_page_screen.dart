import 'package:example/util/constant.dart';
import 'package:example/util/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer_pro/sizer.dart';

class FirstPageScreen extends StatefulWidget {
  const FirstPageScreen({Key? key}) : super(key: key);

  @override
  FirstPageScreenState createState() => FirstPageScreenState();
}

class FirstPageScreenState extends State<FirstPageScreen> {
  @override
  Widget build(BuildContext context) {
    return SizerUtil.orientation == Orientation.portrait
        ? _widPortrait()
        : _widLandScape();
  }

  Widget _widPortrait() {
    return Material(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              _widMainImg(),
              Expanded(
                  child: Column(
                children: [_widTitle(), _widDesc()],
              )),
            ],
          ),
        ),
      ),
    );
  }

  _widMainImg() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Image.asset(Constant.img1, height: 50.h),
    );
  }

  _widTitle() {
    return Padding(
      padding: EdgeInsets.only(top: 1.5.h),
      child: Text(Strings.appname,
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 15.f, color: Colors.black),
          )),
    );
  }

  _widDesc() {
    return Padding(
        padding: EdgeInsets.only(right: 10.w, left: 10.w, top: 2.h),
        child: Text(
          Strings.appDesc,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(height: 1.3, fontSize: 8.f, color: Colors.grey),
          ),
        ));
  }

//landscape
  _widLandScape() {
    return Material(
      child: SingleChildScrollView(
        child: SizedBox(
          height: 100.h,
          child: Column(
            children: [
              _widMainImgLand(),
              Expanded(
                  child: Column(
                children: [_widTitleLand(), _widDescLand()],
              )),
            ],
          ),
        ),
      ),
    );
  }

  _widMainImgLand() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: Image.asset(Constant.img1, height: 25.h),
    );
  }

  _widTitleLand() {
    return Padding(
      padding: EdgeInsets.only(top: 1.0.h),
      child: Text(Strings.appname,
          style: GoogleFonts.lato(
            textStyle: TextStyle(fontSize: 30.f, color: Colors.black),
          )),
    );
  }

  _widDescLand() {
    return Padding(
        padding: EdgeInsets.only(right: 25.w, left: 25.w, top: 1.5.h),
        child: Text(
          Strings.appDesc,
          textAlign: TextAlign.center,
          style: GoogleFonts.lato(
            textStyle:
                TextStyle(height: 1.3, fontSize: 20.f, color: Colors.grey),
          ),
        ));
  }
}
