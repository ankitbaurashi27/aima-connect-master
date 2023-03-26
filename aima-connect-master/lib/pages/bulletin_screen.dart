import 'package:flutter/material.dart';

import 'bulletinContainers/bulletin.dart';


class Bulletin extends StatefulWidget {
  const Bulletin({Key? key}) : super(key: key);

  @override
  State<Bulletin> createState() => _BulletinState();
}

class _BulletinState extends State<Bulletin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfListScreen(),
    );
  }
}