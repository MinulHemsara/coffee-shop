import 'package:coffee/color_pallette.dart';
import 'package:coffee/models/coffee_item.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/ph.dart';

class ItemDetailScreen extends StatefulWidget {
  final CoffeeItem cItem;

  const ItemDetailScreen({super.key, required this.cItem});

  @override
  State<ItemDetailScreen> createState() => _ItemDetailScreenState();
}

class _ItemDetailScreenState extends State<ItemDetailScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
            color: Colors.black,
          ),
          Hero(
              tag: widget.cItem.Itemimg as String,
              child: Container(
                height: (screenHeight / 2) + 70,
                width: screenWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.cItem.Itemimg as String),
                      fit: BoxFit.cover),
                ),
              )),
          Positioned(
              top: 35,
              left: 10,
              child: Container(
                color: Colors.transparent,
                height: 50,
                width: screenWidth - 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0XFF14181D),
                          border:
                              Border.all(color: Color(0xFF322B2E), width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFF525154),
                          size: 17,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          color: Color(0XFF14181D),
                          border:
                              Border.all(color: Color(0xFF322B2E), width: 1.0),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Icon(
                          Icons.favorite_rounded,
                          color: Color(0xFF525154),
                          size: 17,
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            top: (screenHeight / 2) - 30,
            child: GlassContainer(
              height: 150,
              width: screenWidth,
              blur: 4,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(30),
              color: Colors.black.withOpacity(0.6),
              child: Container(
                height: 140,
                width: screenWidth - 20,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.cItem.title!,
                            style: GoogleFonts.sourceSansPro(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.cItem.subtitle!,
                            style: GoogleFonts.sourceSansPro(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: ColorPlatte().coffeeSelected,
                                size: 22,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                widget.cItem.rating.toString(),
                                style: GoogleFonts.sourceSansPro(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                '(6,986)',
                                style: GoogleFonts.sourceSansPro(
                                    color: Color(0xFFADADAD), fontSize: 15),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      height: 140,
                      width: (screenWidth - 20) / 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF07419)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Iconify(
                                      Ph.coffee,
                                      color: ColorPlatte().coffeeSelected,
                                      size: 21,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Coffee',
                                      style: GoogleFonts.sourceSansPro(
                                          color: Color(0xFFADADAD),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF07419)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Iconify(
                                      Ic.round_water_drop,
                                      color: ColorPlatte().coffeeSelected,
                                      size: 21,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      'Milk',
                                      style: GoogleFonts.sourceSansPro(
                                          color: Color(0xFFADADAD),
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 35,
                                width: 120,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF0F1419)),
                                child: Center(
                                  child: Text(
                                    'Medium Roasted',
                                    style: GoogleFonts.sourceSansPro(
                                      color: Color(0xff909193),
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight / 2 + 140,
            child: Container(
              height: screenHeight / 2 - 140,
              width: screenWidth,
              child: ListView(
                padding: EdgeInsets.only(left: 15),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Description",
                        style: GoogleFonts.sourceSansPro(
                            color: Colors.white, fontSize: 17),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 50,
                        width: screenWidth - 30,
                        child: Text(
                          "A Cappuccino is a coffee-based drink made primarly from espresso and milk",
                          style: GoogleFonts.sourceSansPro(
                              color: Colors.white, fontSize: 17),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Size',
                        style: GoogleFonts.sourceSansPro(
                            color: Color(0xFF999A9B), fontSize: 17),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildSizeButton('S', 0),
                            _buildSizeButton('M', 1),
                            _buildSizeButton('L', 2),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: screenWidth - 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 50,
                              child: Column(
                                children: [
                                  Text(
                                    'Prices',
                                    style: GoogleFonts.sourceSansPro(
                                        color: Color(0xFF999A9B), fontSize: 17),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        '\Rs.',
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.bold,
                                            color: ColorPlatte().coffeeSelected,
                                            fontSize: 20),
                                      ),
                                      Text(
                                        widget.cItem.price.toString(),
                                        style: GoogleFonts.sourceSansPro(
                                            fontWeight: FontWeight.bold,
                                            color:
                                                ColorPlatte().coffeeUnselected,
                                            fontSize: 20),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 50,
                                width: (screenWidth / 2) + 54,
                                decoration: BoxDecoration(
                                    color: ColorPlatte().coffeeSelected,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Center(
                                  child: Text(
                                    'Buy Now',
                                    style: GoogleFonts.sourceSansPro(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildSizeButton(String title, int index) {
    return AnimatedContainer(
      duration: Duration(seconds: 4),
      curve: Curves.easeIn,
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          height: 40,
          width: 100,
          decoration: BoxDecoration(
              color: index == selectedIndex ? Colors.black : Color(0xFF0D0F14),
              borderRadius: BorderRadius.circular(10),
              border: index == selectedIndex
                  ? Border.all(
                      color: ColorPlatte().coffeeSelected,
                      style: BorderStyle.solid,
                      width: 1)
                  : Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 1,
                    )),
          child: Center(
              child: Text(
            title,
            style: GoogleFonts.sourceSansPro(
              color: index == selectedIndex
                  ? ColorPlatte().coffeeSelected
                  : Color(0xFF999A9B),
              fontSize: 15,
            ),
          )),
        ),
      ),
    );
  }
}
