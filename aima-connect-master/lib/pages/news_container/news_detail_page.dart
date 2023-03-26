import 'package:flutter/material.dart';

class NewsDetailsPage extends StatefulWidget {
  const NewsDetailsPage({Key? key, required this.title, required this.image, required this.description}) : super(key: key);
  final String? description;
  final String? image;
  final String? title;


  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('News'), centerTitle: true,),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                  height: 200,
                  child: Image.network("${widget.image}", fit: BoxFit.contain,)
                  ),
                  Divider(height: 20,),
                  Text('${widget.title}', style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  Divider(height: 20,),
                  Text('${widget.description}')
                ],
              ),
          ),
        ),
      ),
    );
  }
}