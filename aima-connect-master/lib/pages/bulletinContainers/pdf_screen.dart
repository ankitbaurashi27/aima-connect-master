
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';


class PdfViewScreen extends StatefulWidget {
  
  const PdfViewScreen({Key? key, required this.url}) : super(key: key);
  final String url;

  @override
  State<PdfViewScreen> createState() => _PDFViewScreenState();
}

class _PDFViewScreenState extends State<PdfViewScreen> {
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PdfView(
             path: '',
        ),
      ),
    );
  }
}