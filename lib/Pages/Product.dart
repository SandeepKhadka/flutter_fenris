import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keyboard/Pages/According_to_Category.dart';
import 'package:keyboard/controller/getCategoryController.dart';
import 'package:keyboard/newAdded/api_constants.dart';

class Product extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Find Products',
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0, // Remove appbar shadow
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: GetBuilder<GetCategoryController>(
        builder: (_) => GridView.builder(
          padding: EdgeInsets.all(20),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            childAspectRatio: 1.2, // Adjust as needed for tile aspect ratio
          ),
          itemCount: _.getCategory.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(AccToCategory(
                  categoryId: _.getCategory[index].id,
                ));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      CATEGORY_IMAGE_URL + _.getCategory[index].image,
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    Text(
                      _.getCategory[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
