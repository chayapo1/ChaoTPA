import 'dart:async';

import 'package:chao_tpa/models/listvideomodel.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ShowListVideo extends StatefulWidget {
  @override
  _ShowListVideoState createState() => _ShowListVideoState();
}

class _ShowListVideoState extends State<ShowListVideo> {
  // Explicit
  Firestore firestore = Firestore.instance;
  StreamSubscription<QuerySnapshot> subscription;
  List<DocumentSnapshot> snapshots; // Array
  List<ListVideoModel> listVideoModels = []; // Array

  // Method
  @override
  void initState() {
    super.initState();
    readFirestore();
  }

  Future<void> readFirestore() async {
    CollectionReference collectionReference = firestore.collection('ListVideo');
    subscription = await collectionReference.snapshots().listen((data) {
      snapshots = data.documents;
      snapshots.forEach((doc) {
        String name = doc['Name'];
        String detail = doc['Detail'];
        String imagePath = doc['ImagePath'];
        String videoPath = doc['VideoPath'];
        print('Detail: $detail');
        ListVideoModel listVideoModel =
            ListVideoModel(name, detail, imagePath, videoPath);
        setState(() {
          listVideoModels.add(listVideoModel);
        });
      });
      // for (var item in snapshots) {
      //   String nameVideo = item.data['Name'];
      //   String detailVideo = item.data['Detail'];
      //   String imagePath = item.data['ImagePath'];
      //   String videoPath = item.data['VideoPath'];
      //   print('Video name : $nameVideo');
      // }
    });
  }

  Widget showImage(int index) {
    return Container(
      height: 120,
      // width: 200,
      padding: EdgeInsets.all(5),
      child: Image.network(
        listVideoModels[index].imagePath,
        fit: BoxFit.contain,
      ),
    );
  }

  Widget showText(int index) {
    return Container(
      // margin: EdgeInsets.all(5),
      padding: EdgeInsets.only(top: 5, right: 5, left: 10, bottom: 5),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              listVideoModels[index].name,
              style: TextStyle(
                fontSize: 18,
                color: Colors.orange[900],
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            child: Text(
              listVideoModels[index].detail,
            ),
          )
        ],
      ),
    );
  }

  Widget myDivider() {
    return Divider(
      height: 5,
      color: Colors.grey,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: ListView.builder(
        itemCount: listVideoModels.length,
        itemBuilder: (context, int index) {
          return Container(
              child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  showImage(index),
                  showText(index),
                ],
              ),
              myDivider(),
            ],
          ));
        },
      ),
    );
    // return StreamBuilder<QuerySnapshot>(
    //   stream: Firestore.instance.collection('ListVideo').snapshots(),
    //   builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
    //     if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
    //     switch (snapshot.connectionState) {
    //       case ConnectionState.waiting:
    //         return new Text('Loading...');
    //       default:
    //         return new ListView(
    //           children:
    //               snapshot.data.documents.map((DocumentSnapshot document) {
    //             return new ListTile(
    //               title: new Text(document['Name']),
    //               subtitle: new Text(document['Detail']),
    //             );
    //           }).toList(),
    //         );
    //     }
    //   },
    // );
  }
}
