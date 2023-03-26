import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/GalleryModel.dart';


class GalleryRepo {
  static Future<List<GalleryModel>> getGalleryImages() async {
    final List<GalleryModel> images = [];
    await FirebaseFirestore.instance
        .collection('gallery')
        .get()
        .then((QuerySnapshot querySnapshot) {
      querySnapshot.docs.forEach((doc) {
        images.add(GalleryModel.fromJson(doc));
      });
    });
    return images;
  }
}
