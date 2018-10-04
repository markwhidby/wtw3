import 'package:flutter/material.dart';

import 'member.dart';

class MemberWidget extends StatefulWidget {
  final Member member;

  MemberWidget(this.member) {
    if (member == null) {
      throw new ArgumentError("member of MemberWidget cannot be null. "
          "Received: '$member'");
    }
  }

  @override
  createState() => new MemberState(member);
}

class MemberState extends State<MemberWidget> {
  final Member member;

  MemberState(this.member);

@override
Widget build(BuildContext context) {
  return new Scaffold (
    appBar: new AppBar(
      title: new Text(member.login),
    ),
    body: new Padding(
      padding: new EdgeInsets.all(16.0),
      // Add Column here:
      child: new Column(
        children: [
          new Image.network(member.avatarUrl),
          new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.blue, size: 48.0),
            onPressed: () { Navigator.pop(context); }
            ),
        ]),
    )
  );
}
}
