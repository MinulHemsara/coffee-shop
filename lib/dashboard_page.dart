import 'package:coffee/color_pallette.dart';
import 'package:coffee/models/coffee_item.dart';
import 'package:coffee/screeens/item_detail.dart';
import 'package:coffee/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/fluent_mdl2.dart';
import 'package:iconify_flutter/icons/heroicons_solid.dart';
import 'package:iconify_flutter/icons/ph.dart';
import 'package:iconify_flutter/icons/ri.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> coffeeTypes = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Flat White'
  ];
  int counter = -1;

  String selectedItem = 'Cappuccino';

  final List<CoffeeItem> coffeeList = [
    CoffeeItem(
        rating: 4.5,
        Itemimg: "lib/img/coffeemain.jpg",
        price: 200.00,
        subtitle: 'With Milk',
        title: 'Cappucino'),
    CoffeeItem(
        rating: 3.5,
        Itemimg: "lib/img/secondary.jpg",
        price: 350.00,
        subtitle: 'With Chocolate',
        title: 'Cappucino')
  ];

  var images = "model.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPlatte().scaffoldBg,
      bottomNavigationBar: _buildBottomBar(),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => setState(() {}),
                  child: Container(
                      padding: EdgeInsets.all(7.0),
                      height: 42.0,
                      width: 42.0,
                      decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(12.0)),
                      child: const Iconify(
                        HeroiconsSolid.view_grid,
                        size: 12.0,
                        color: Color(0xFF4D4F52),
                      )),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: const EdgeInsets.all(7.0),
                    height: 42.0,
                    width: 42.0,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("lib/img/" + images),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12.0)),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15, top: 15),
            width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.sourceSansPro(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40.0,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SearchBar(),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 15),
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    begin: Alignment(0.7, -1.0),
                    end: Alignment(1.0, -1.0),
                    colors: <Color>[
                      Colors.black,
                      Colors.transparent,
                    ]).createShader(bounds);
              },
              blendMode: BlendMode.dstATop,
              child: Container(
                color: Color(0xFF0D0F14),
                width: MediaQuery.of(context).size.width - 20.0,
                height: 40.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    ...coffeeTypes.map((e) {
                      counter++;
                      if (counter <= 3)
                        return _buildTypes(e, counter);
                      else {
                        counter = 0;
                        return _buildTypes(e, counter);
                      }
                    }).toList()
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: (MediaQuery.of(context).size.height / 2) - 50,
            width: MediaQuery.of(context).size.width,
            child: ListView(
              padding: EdgeInsets.only(top: 5),
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 15),
                  child: Container(
                    color: Color(0xFF0D0F14),
                    width: MediaQuery.of(context).size.width - 10,
                    height: 255,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...coffeeList.map((e) => _buildCoffeItem(e)).toList()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Text(
                    "Special for you",
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    height: 125,
                    width: MediaQuery.of(context).size.width - 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            ColorPlatte().gradientTopLeft,
                            ColorPlatte().searchBarFill
                          ]),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 115,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage("lib/img/beansbottom.jpg"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: 115,
                          child: Column(children: [
                            Container(
                              height: 100,
                              width: MediaQuery.of(context).size.width - 185,
                              child: Text(
                                "5 Coffee Beans You Must Try",
                                style: GoogleFonts.sourceSansPro(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 17),
                              ),
                            )
                          ]),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      )),
    );
  }

  Widget _buildTypes(coffee, counter) {
    return Padding(
      padding: counter != 0
          ? EdgeInsets.only(left: 25.0)
          : EdgeInsets.only(left: 7.0),
      child: Container(
        height: 50.0,
        color: Color(0XFF0D0F14),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = coffee;
                });
              },
              child: Text(
                coffee,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: coffee == selectedItem
                        ? ColorPlatte().coffeeSelected
                        : ColorPlatte().coffeeUnselected,
                    fontSize: 17.0),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              height: 8,
              width: 8.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: coffee == selectedItem
                      ? ColorPlatte().coffeeSelected
                      : Colors.transparent),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25),
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFF1A1819),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Iconify(
              FluentMdl2.home,
              color: ColorPlatte().coffeeSelected,
            ),
          ),
          Iconify(
            Ph.hand_fill,
            color: Color(0xFF4E4F53),
          ),
          Iconify(
            Ri.heart_2_fill,
            color: Color(0xFF4E4F53),
          ),
          Container(
            child: Stack(
              children: [
                Iconify(
                  HeroiconsSolid.bell,
                  color: Color(0xFF4E4F53),
                ),
                Positioned(
                  top: 2,
                  left: 15,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3.2),
                        color: Colors.red),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildCoffeItem(CoffeeItem cItem) {
    return Padding(
      padding: EdgeInsets.only(left: 10.0, right: 10.0),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemDetailScreen(cItem: cItem),
        )),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: <Color>[ColorPlatte().gradientTopLeft, Colors.black],
                begin: Alignment.topLeft,
                end: Alignment.bottomLeft),
          ),
          height: 200,
          width: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 140,
                width: 150,
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        height: 120,
                        width: 130,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(cItem.Itemimg!),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(15)),
                      ),
                    ),
                    Positioned(
                        right: 10,
                        top: 10,
                        child: Container(
                          height: 25,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Color(0xFF342529).withOpacity(0.7),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomLeft: Radius.circular(15))),
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.star,
                                  color: ColorPlatte().coffeeSelected,
                                  size: 15,
                                ),
                                Text(
                                  cItem.rating.toString(),
                                  style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13),
                                )
                              ],
                            ),
                          ),
                        ))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  cItem.title!,
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 5),
                child: Text(
                  cItem.subtitle!,
                  style: GoogleFonts.sourceSansPro(
                      fontWeight: FontWeight.w200,
                      color: Colors.white,
                      fontSize: 12),
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 40,
                        width: 80,
                        child: Row(
                          children: [
                            Text(
                              '\Rs',
                              style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                  color: ColorPlatte().coffeeSelected,
                                  fontSize: 20),
                            ),
                            Text(
                              cItem.price.toString(),
                              style: GoogleFonts.sourceSansPro(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => null,
                        child: Container(
                          height: 30,
                          width: 30,
                          decoration: BoxDecoration(
                            color: ColorPlatte().coffeeSelected,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.add,
                              size: 11,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
