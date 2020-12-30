import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CustomDatePicker extends StatefulWidget {
  @override
  _CustomDatePickerState createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () {
          _selectDate(context); // Call Function that has showDatePicker()
        },
        child: IgnorePointer(
          child: new TextFormField(
            decoration: new InputDecoration(
              hintText: DateFormat("dd/MM/yyyy", "vi_VN").format(selectedDate),
              hintStyle: TextStyle(color: Colors.grey, fontSize: 22),
            ),
            maxLength: 10,
            onSaved: (String val) {},
          ),
        ),
      ),
    );
  }
}
