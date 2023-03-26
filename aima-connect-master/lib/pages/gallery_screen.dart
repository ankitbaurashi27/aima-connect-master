import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'galleryScreen/gallery_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({Key? key}) : super(key: key);

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {

  CollectionReference imageRef = FirebaseFirestore.instance.collection('gallery');

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text('Gallery', style: TextStyle(fontSize: 18),),
      ),
      body:  MobileGalleryScreen(),
    // ignore: empty_statements
      //  FutureBuilder<dynamic>(
      //   future: imageRef.get(),
      //   builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
      //      if(snapshot.hasData){
      //       return ListView.builder(
      //         itemCount: snapshot.data.docs.length,
      //         itemBuilder:(context, i) {
      //           return ListTile(
      //             title: Text("${snapshot.data.docs[i].data()['title']}"),
      //             leading: Image.network("${snapshot.data.docs[i].data()['image']}", width: 50,),
      //           );
      //           }, 
      //       );
      //     }if(snapshot.hasError){
      //       print('errror');
      //     }
      //     if(snapshot.connectionState == ConnectionState.waiting){
      //       return Center(child: CircularProgressIndicator(),);
      //     }
      //     return Text("No widget to build");
      //   },
      //  ),
    );
  }
}
