import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:keyboard/controller/get_banner_controller.dart';
import 'package:keyboard/newAdded/api_constants.dart';

class MySlider extends StatefulWidget {
  @override
  State<MySlider> createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  final GetBannersController bannerController = Get.find();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Obx(() {
      if (bannerController.isLoading.value) {
        // Show circular progress indicator while loading
        return Center(
          child: CircularProgressIndicator(),
        );
      }

      if (bannerController.getBanner.isEmpty) {
        return Text("Sorry No Banner Found");
      }

      List<String> imageUrls =
          bannerController.getBanner.map((banner) => banner.image).toList();

      return Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: imageUrls
                    .map(
                      (imageUrl) =>
                          _buildImageWithBorder(imageUrl, screenWidth),
                    )
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 2.0,
                  autoPlayInterval: Duration(seconds: 2),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                ),
              ),
            ],
          ),
          SizedBox(height: 1),
        ],
      );
    });
  }

  Widget _buildImageWithBorder(String imageUrl, double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: Image.network(
        BANNER_IMAGE_URL + imageUrl,
        fit: BoxFit.cover,
        width: screenWidth,
      ),
    );
  }
}
