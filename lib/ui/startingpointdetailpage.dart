import 'package:flutter/material.dart';

import '../strings.dart';
import '../models/startingpoint.dart';

class StartingPointDetailPage extends StatefulWidget {
  StartingPoint startingPoint;

  StartingPointDetailPage ({Key key, @required this.startingPoint}) : super(key: key);

  @override
  _StartingPointDetailPageState createState() => new _StartingPointDetailPageState();
}

class _StartingPointDetailPageState extends State<StartingPointDetailPage> {
  // @override
  // void initState() {
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(Strings.appTitle),
      ),
      body: new StartingPointForm(startingPoint: widget.startingPoint),
    );
  }
}

// Create a Form Widget
class StartingPointForm extends StatefulWidget {
  final StartingPoint startingPoint;

  StartingPointForm ({Key key, this.startingPoint}) : super(key: key);

  @override
  _StartingPointFormState createState() => new _StartingPointFormState();
}

// Create a corresponding State class. This class will hold the data related to
// the form.
class _StartingPointFormState extends State<StartingPointForm> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _stateController = TextEditingController();
  final _zipController = TextEditingController();
  final _latController = TextEditingController();
  final _longController = TextEditingController();


  @override
  void initState() {
    _nameController.text = widget.startingPoint.name;
    _cityController.text = widget.startingPoint.city;
    _stateController.text = widget.startingPoint.state;
    _zipController.text = widget.startingPoint.zip;
    _latController.text = widget.startingPoint.latitude.toString();
    _longController.text = widget.startingPoint.longitude.toString();
    return super.initState();
  }

  @override
  void dispose() {
    // Clean up the controllers when the Widget is disposed
    _nameController.dispose();
    _cityController.dispose();
    _stateController.dispose();
    _zipController.dispose();
    _latController.dispose();
    _longController.dispose();
    super.dispose();
  }

  Widget nameField() {
    return TextFormField(
      controller: _nameController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.place),
        labelText: 'Name',
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
    );
  }

  Widget cityField() {
    return TextFormField(
      controller: _cityController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.place),
        // hintText: 'Enter city',
        labelText: 'City',
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      // },
    );
  }

  Widget stateField() {
    return TextFormField(
      controller: _stateController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.place),
        // hintText: 'Enter state',
        labelText: 'State',
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      // },
    );
  }

  Widget zipField() {
    return TextFormField(
      controller: _zipController,
      decoration: const InputDecoration(
        icon: const Icon(Icons.place),
        // hintText: 'Enter zip',
        labelText: 'Zip',
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Please enter some text';
      //   }
      // },
    );
  }

  Widget latField() {
    return TextFormField(
      controller: _latController,
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: const InputDecoration(
        icon: const Icon(Icons.near_me),
        // hintText: 'Enter latitude',
        labelText: 'Latitude',
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Please enter a number';
      //   }
      // },
    );
  }

  Widget longField() {
    return TextFormField(
      controller: _longController,
      keyboardType: const TextInputType.numberWithOptions(),
      decoration: const InputDecoration(
        icon: const Icon(Icons.near_me),
        // hintText: 'Enter longitude',
        labelText: 'Longitude',
      ),
      // validator: (value) {
      //   if (value.isEmpty) {
      //     return 'Please enter a number';
      //   }
      // },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          nameField(),
          cityField(),
          stateField(),
          zipField(),
          latField(),
          longField(),
          SizedBox(height: 20.0),
          Center(
            child: RaisedButton(
              onPressed: () {
                // Validate will return true if the form is valid
                if (_formKey.currentState.validate()) {
                  // Scaffold.of(context)
                  //     .showSnackBar(SnackBar(content: Text(_nameController.text)));
                      // widget.startingPoint.name = _nameController.text;
                      Navigator.pop (context, widget.startingPoint);
                }
              },
              child: Text('Save'),
            ),
          ),
        ],
      ),
    );
  }
}
