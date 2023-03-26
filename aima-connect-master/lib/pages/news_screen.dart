// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import 'news_container/news_detail_page.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  CollectionReference news = FirebaseFirestore.instance.collection('news');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AIMA News'),
      ),
      body: FutureBuilder<dynamic>(
        future: news.get(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: snapshot.data.docs.length,
              itemBuilder: (context, i) {
                return Card(
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                      title: Text("${snapshot.data.docs[i].data()['title']}", style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: ReadMoreText(
                        '${snapshot.data.docs[i].data()['description']}',
                        trimLines: 2,
                        colorClickableText: Colors.pink,
                        trimMode: TrimMode.Line,
                        trimCollapsedText: ' Show more',
                        trimExpandedText: ' Show less',
                        moreStyle:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                        lessStyle:  
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                      ),
                      leading: Image.network(
                        "${snapshot.data.docs[i].data()['image']}",
                        width: 50,
                      ),
                      onTap: (){
                          Navigator.push(
                         context,
                         MaterialPageRoute(
                          builder: (context) => NewsDetailsPage(title: "${snapshot.data.docs[i].data()['title']}", image: "${snapshot.data.docs[i].data()['image']}", description: "${snapshot.data.docs[i].data()['description']}",),
                          ));
                      },
                     hoverColor: Colors.blue,
                  ),

                );
                
              },
            );
          }
          if (snapshot.hasError) {
            print('errror');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Text("No widget to build");
        },
      ),
    );
  }
}
