class PDFModel{
   final String url;
   final String name;

  PDFModel({required this.url, required this.name});

  factory PDFModel.fromJson(Map<String, dynamic> json) {
    return PDFModel(
      url: json['url'],
      name: json['name'],
    );
  }
}

