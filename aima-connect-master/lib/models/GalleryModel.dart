class GalleryModel{
  final String image;
  String?  title;

  GalleryModel({required this.image, this.title});

  factory GalleryModel.fromJson(dynamic json) {
    return GalleryModel(
      image: json['image'],
      title: json['title'],
    );
  }
}

