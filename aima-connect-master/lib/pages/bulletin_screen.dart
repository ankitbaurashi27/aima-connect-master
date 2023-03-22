import 'package:flutter/material.dart';

import 'bulletinContainers/bulletin.dart';

class Bulletin extends StatelessWidget {
  const Bulletin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Bulletins'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            BulletinView()
          ],
        ),
      ),
    );
  }
}
