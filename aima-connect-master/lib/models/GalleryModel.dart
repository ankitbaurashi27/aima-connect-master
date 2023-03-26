class GalleryModel{
   final String url;

  GalleryModel({required this.url});

  factory GalleryModel.fromJson(dynamic json) {
    return GalleryModel(
      url: json['url'],
    );
  }
}

