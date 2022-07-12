import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ket/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        elevation: 0,
        // 전체 화면의 중간이 아닌 화살표를 제외한 영역의 중간
        title: const Center(
            child: Text(
          'Settings',
          style: kTitleTextStyle,
        )),
        leading: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset("assets/icons/arrow-left.svg")),
      ),
    );
  }
}
