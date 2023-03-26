import 'package:aima_connect/models/GalleryModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../repository/gallery_repo.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: MobileGalleryScreen(),
      desktop: MobileGalleryScreen(),
    );
  }
}

class MobileGalleryScreen extends StatefulWidget {
  const MobileGalleryScreen({Key? key}) : super(key: key);

  @override
  State<MobileGalleryScreen> createState() => _MobileGalleryScreenState();
}

class _MobileGalleryScreenState extends State<MobileGalleryScreen> {
  bool isLoading = true;
  final List<GalleryModel> images = [];

  Future<List<GalleryModel>> getData() async {
    isLoading = true;
    final result = await GalleryRepo.getGalleryImages();
    setState(() {
      isLoading = false;
    });
    images.addAll(result);

    return result;
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          // ignore: prefer_const_constructors
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
          ),
          itemCount: images.length,
          itemBuilder: (_, index) {
            if (isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return GestureDetector(
                //onTap: () => routetoDetail(movies2[index]),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Container(
                    
                    child: Image.network(images[index].image, fit: BoxFit.cover,),
                  ),
                ),
              );
            }
          }),
    );
  }
}
