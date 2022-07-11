import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ket/constants.dart';
import 'package:ket/screens/setting_screen.dart';

class HomeScreen extends StatelessWidget {
  List<Map<String, String>> categoryCardData = [
    {"name": "전체보기", "color": "black"},
    {"name": "여행", "color": 'red'},
    {"name": "악세사리", "color": 'yellow'},
    {"name": "의류", "color": 'green'},
    {"name": "식당", "color": 'purple'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor, elevation: 0, actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/search.svg")),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingScreen()),
                  );
                },
                icon: SvgPicture.asset("assets/icons/more-vertical.svg")),
          ],
        )
      ]),
      body: Center(
          child: Column(children: [
        SizedBox(
          height: 10,
        ),
        SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                    width: 80 * (categoryCardData.length + 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        categoryCardData.length,
                        (index) => CategoryMediumCard(
                            name: categoryCardData[index]['name'],
                            bcolor: categoryCardData[index]['color']),
                      ),
                    )))),
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
              padding: EdgeInsets.all(20),
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: ((context, index) => bucketCard()))),
        )
      ])),
      // 전체 배경
    );
  }
}

class bucketCard extends StatelessWidget {
  const bucketCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Expanded(
            child: Row(
          children: [
            Text(
              '카테고리 ',
              style: kSubtitleTextStyle,
            ),
            SvgPicture.asset('assets/icons/user.png')
          ],
        )));
  }
}

class CategoryMediumCard extends StatelessWidget {
  const CategoryMediumCard({Key? key, required this.name, required this.bcolor})
      : super(key: key);

  final String? name;
  final String? bcolor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        onTap: () {},
        child: Container(
          width: 80,
          height: 50,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            name!,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          decoration: const BoxDecoration(
            color: kBlueColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ));
  }
}
