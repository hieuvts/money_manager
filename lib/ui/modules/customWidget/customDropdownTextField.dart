import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/material.dart';

class CustomDropdownTextField extends StatefulWidget {
  @override
  _CustomDropdownTextFieldState createState() =>
      _CustomDropdownTextFieldState();
}

class _CustomDropdownTextFieldState extends State<CustomDropdownTextField> {
  String _myActivity;
  String _myActivityResult;
  final formKey = new GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _myActivity = '';
    _myActivityResult = '';
  }

  _saveForm() {
    var form = formKey.currentState;
    if (form.validate()) {
      form.save();
      setState(() {
        _myActivityResult = _myActivity;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return DropDownFormField(
      titleText: 'My workout',
      hintText: 'Please choose one',
      value: _myActivity,
      onSaved: (value) {
        setState(() {
          _myActivity = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _myActivity = value;
        });
      },
      dataSource: [
        {
          "display": "Running",
          "value": "Running",
        },
        {
          "display": "Climbing",
          "value": "Climbing",
        },
        {
          "display": "Walking",
          "value": "Walking",
        },
      ],
    );
  }
}
