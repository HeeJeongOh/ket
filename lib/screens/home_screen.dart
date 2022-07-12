import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ket/constants.dart';
import 'package:ket/screens/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, String>> categoryCardData = [
    {"name": "전체보기", "color": "black"},
    {"name": "여행", "color": 'red'},
    {"name": "악세사리", "color": 'yellow'},
    {"name": "의류", "color": 'green'},
    {"name": "식당", "color": 'purple'},
  ];
  List todos = [];
  String input = "";

  @override
  void initState() {
    super.initState();
    todos.add("Item1");
    todos.add("Item2");
    todos.add("Item3");
    todos.add("Item4");
    todos.add("Item5");
    todos.add("Item6");
    todos.add("Item7");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: kPrimaryColor, elevation: 0, actions: [
        Expanded(flex: 4, child: Image.asset('assets/icons/ket_logo.png')),
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
          child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(children: [
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
                Expanded(
                    flex: 1,
                    child: Container(
                      //color: kPrimaryColor,
                      child: ListView.builder(
                          itemCount: todos.length,
                          itemBuilder: (BuildContext context, int index) {
                            return bucketItemCard(index);
                          }),
                    )),
              ]))),
      floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                        title: Text("버킷리스트 추가하기"),
                        content: Column(children: [
                          TextField(
                            onChanged: (String value) {
                              input = value;
                            },
                          )
                        ]),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                setState(() {
                                  todos.add(input);
                                });
                                Navigator.of(context)
                                    .pop(); // input 입력 후 창 닫히도록
                              },
                              child: Text("Add"))
                        ]);
                  });
            },
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )),
    );
  }

  Card bucketItemCard(int index) {
    return Card(
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Container(
            alignment: Alignment.center,
            height: 30,
            width: 60,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), color: kPrimaryColor),
            child: Text(todos[index], style: kNormalTextStyle),
          ),
          trailing: IconButton(
              icon: Icon(Icons.check_box_outline_blank_outlined,
                  color: kPrimaryColor),
              onPressed: () {
                setState(() {
                  todos.removeAt(index);
                });
              }),
          title: Text(todos[index]),
        ));
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
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Text(
            name!,
            textAlign: TextAlign.center,
            style: kNormalTextStyle,
          ),
          decoration: const BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ));
  }
}
