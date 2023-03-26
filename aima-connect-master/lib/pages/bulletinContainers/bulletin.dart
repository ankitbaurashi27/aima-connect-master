// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:aima_connect/pages/bulletinContainers/pdf_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:responsive_builder/responsive_builder.dart';


class BulletinView extends StatefulWidget {
  const BulletinView({Key? key}) : super(key: key);

  @override
  State<BulletinView> createState() => _BulletinViewState();
}

class _BulletinViewState extends State<BulletinView> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: PdfListScreen(),desktop: PdfListScreen(),);
  }
}

class PdfListScreen extends StatelessWidget {

  CollectionReference imageRef = FirebaseFirestore.instance.collection('bulletin');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulletins'),
        centerTitle: true,
      ),
      body: FutureBuilder<dynamic>(
        future: imageRef.get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot){
           if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data.docs.length,
              itemBuilder:(context, i) {
                return  Card(
                      child: ListTile(
                      title: Text("${snapshot.data.docs[i].data()['name']}"),
                      leading: Icon(Icons.picture_as_pdf,color: Colors.red.shade400,),
                      trailing: Icon(Icons.arrow_forward_ios,color: Colors.blue,),
                      onTap: (){
                          Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => PdfViewScreen(url: "${snapshot.data.docs[i].data()['name']}",)),
                            );
                      },
                    ),
                );
                
                }, 
            );
          }if(snapshot.hasError){
            print('errror');
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(),);
          }
          return Text("No widget to build");
        },
       ),
    );
  }
}




