import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../models/PDFMode.dart';

class BulletinView extends StatefulWidget {
  const BulletinView({Key? key}) : super(key: key);

  @override
  State<BulletinView> createState() => _BulletinViewState();
}

class _BulletinViewState extends State<BulletinView> {
    Stream<List<PDFModel>> getPdfs() {
    return FirebaseFirestore.instance.collection('bulletin').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => PDFModel.fromJson(doc.data())).toList() ;
    });
  }


  @override
  void initState() {
    getPdfs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(mobile: PdfListScreen(),desktop: PdfListScreen(),);
  }
}

class PdfListScreen extends StatelessWidget {

  Stream<List<PDFModel>> getPdfs() {
    return FirebaseFirestore.instance.collection('bulletin').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => PDFModel.fromJson(doc.data())).toList() ;
    });
  }


  @override
  void initState() {
    getPdfs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bulletins'),
        centerTitle: true,
      ),
      body: StreamBuilder<List<PDFModel>>(
        stream: getPdfs(),
        builder: (context, snapshot) {
          if  (!snapshot.hasData) {
            print('no data');
            return Center(child: CircularProgressIndicator());
          }
          List<PDFModel> pdfs = snapshot.data!;
          return ListView.builder(
            itemCount: pdfs.length,
            itemBuilder: (context, index) {
              PDFModel pdf = pdfs[index];
              return ListTile(
                title: Text(pdf.name),
                trailing: Icon(Icons.picture_as_pdf),
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => PdfViewScreen(url: pdf.url),
                  //   ),
                  //);
                },
              );
            },
          );
        },
      ),
      // body: StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection("bulletin").snapshots(),
      //   builder: ( context,snapshot) {
      //    return !snapshot.hasData?Center(child: CircularProgressIndicator(),):
      //      ListView.builder(
      //       itemCount: snapshot.data!.docs.length,
      //       itemBuilder: (context,index) {
      //         DocumentSnapshot data = snapshot.data!.docs[index];
      //         return Container(
      //           child: ListTile(
      //               title: data['name']
      //           ),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}




