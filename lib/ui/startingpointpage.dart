import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

import '../strings.dart';
import '../models/startingpoint.dart';
import 'startingpointdetailpage.dart';

class StartingPointPage extends StatefulWidget {
  @override
  createState() => new _StartingPointPageState();
}

class _StartingPointPageState extends State<StartingPointPage> {
  @override
  void initState() {
    super.initState();
  }

  final List<StartingPoint> _startingPoints = StartingPoint.allStartingPoints();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: Center(
        child: new Column(
          children: <Widget>[
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new IconButton(
                  icon: Icon(Icons.near_me),
                  onPressed: null,
                ),
                new IconButton(
                  icon: Icon(Icons.add),
                  onPressed: null,
                ),
              ],
            ),
            new Flexible(
              child: _getStartingPointList(context),
            ),
            // new SizedBox(height: 200.0),
            // new Image.network(
            //   'https://cdn.cnn.com/cnn/.e1mo/img/4.0/logos/logo_cnn_badge_2up.png',
            //   fit: BoxFit.cover,
            // ),
          ],
        ),
      ),
    );
  }

  _getStartingPointList(BuildContext context) {
    return ListView.builder(
      itemCount: _startingPoints.length,
      itemBuilder: _getStartingPoint,
      padding: EdgeInsets.all(0.0),
    );
  }

  _navigateToDetailPage(BuildContext context, int index) async {
    final result = Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              StartingPointDetailPage(startingPoint: _startingPoints[index])),
    );
  }

  Widget _getStartingPoint(BuildContext context, int index) {
//    return new Card(
//      child: new Column(
//        children: <Widget>[
//          new Text(_startingPoints[index].name),
//          new Text(_startingPoints[index].city),
//          new Text(_startingPoints[index].state),
//          new Text(_startingPoints[index].zip),
//        ],
//      ),
//    );
//    return new Text(_startingPoints[index].name);
    String _subtitle = _startingPoints[index].city +
        ', ' +
        _startingPoints[index].state +
        '  ' +
        _startingPoints[index].zip;
    return new ListTile(
      title: new Text(_startingPoints[index].name),
      subtitle: new Text(_subtitle),
      trailing: new Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
        new IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            final result = Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => StartingPointDetailPage(
                      startingPoint: _startingPoints[index])),
            );
            Scaffold.of(context)
                .showSnackBar(SnackBar(content: Text('$result.name')));
          },
        ),
        Icon(Icons.delete),
      ]),
    );
  }
}
