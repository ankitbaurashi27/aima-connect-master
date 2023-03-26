import 'package:flutter/cupertino.dart';


class PdfViewScreen extends StatefulWidget {
  
  const PdfViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<PdfViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PdfViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
         child: Text(widget.url),
    );
  }
}