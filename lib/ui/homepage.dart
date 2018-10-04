import 'package:flutter/material.dart';

import '../strings.dart';
import 'startingpointpage.dart';

class HomePage extends StatefulWidget {

  @override
  createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new Padding(
        padding: new EdgeInsets.all(16.0),
        child: new Center (
          // Add Column here:
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new RaisedButton(
                  onPressed: () { 
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => new StartingPointPage()));
                  },
                  child: Text ('Starting Points'),
                ),
              new Text(''),
              new RaisedButton(
                  onPressed: () { 
                    Navigator.of(context).push(
                        new MaterialPageRoute(builder: (context) => new StartingPointPage()));
                  },
                  child: Text ('Get Route'),
                ),
            ]),
        ),
      )
    );
  }
}


