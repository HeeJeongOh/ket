import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ket/constants.dart';

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
                onPressed: () {},
                icon: SvgPicture.asset("assets/icons/more-vertical.svg")),
          ],
        )
      ]),
      body: SingleChildScrollView(
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
                          name: categoryCardData[index]['name']),
                    ),
                  )))),
      // 전체 배경
    );
  }
}

class CategoryMediumCard extends StatelessWidget {
  const CategoryMediumCard({Key? key, required this.name}) : super(key: key);

  final String? name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        borderRadius: BorderRadius.all(Radius.circular(6)),
        onTap: () {},
        child: Container(
          width: 80,
          height: 50,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            name!,
            textAlign: TextAlign.center,
            style: TextStyle(
                color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ));
  }
}
