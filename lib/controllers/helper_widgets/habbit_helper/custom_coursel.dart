// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:lottie/lottie.dart';
import 'package:tickyfy/controllers/custom_widgets/color_controller.dart';
import 'package:tickyfy/controllers/custom_widgets/textstyle.dart';

class CarouselWithText extends StatelessWidget {
  final List<Map<String, String>> items;

  CarouselWithText({required this.items});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 18.0 / 9.0,
          enlargeCenterPage: true,
           autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(seconds: 2),
         
          height: 100.0,
        ),
        items: items.map((item) => buildCarouselItem(item)).toList(),
      ),
    );
  }

  Widget buildCarouselItem(Map<String, String> item) {
    String? lottiePath = item['Lottie'];
    String? text = item['text'];

    if (lottiePath == null || text == null) {
      return Container(
        color: const Color.fromARGB(255, 247, 18, 18),
        child: const Center(child: Text("Invalid item data")),
      );
    }

    return Container(
      margin: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        child: Stack(
          children: <Widget>[
            // Background gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    DarkPurple,
                    DarkPurple,
                    white,
                  ],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  lottiePath,
                ),
              ],
            ),
            // Text
            Positioned(
                left: 0.0,
                right: 0.0,
                bottom: 10.0,
                child: CustomText(
                  text: text,
          color: Colors.white,
          fontSize: 16,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
                )),
          ],
        ),
      ),
    );
  }
}
