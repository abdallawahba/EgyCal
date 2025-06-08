import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../../core/models/users_data_model.dart';
import 'custom_dropdown.dart'; // Import your CustomDropdown

class BirthdayPickerWidget extends StatefulWidget {
  const BirthdayPickerWidget({super.key});

  @override
  State<BirthdayPickerWidget> createState() => BirthdayPickerWidgetState();
}

class BirthdayPickerWidgetState extends State<BirthdayPickerWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int? selectedYear;
  int? selectedMonth;
  int? selectedDay;

  final List<int> _yearItems = [];
  final List<int> _monthItems = List<int>.generate(12, (i) => i + 1);
  List<int> _dayItems = [];

  @override
  void initState() {
    super.initState();
    for (int i = 2020; i >= 1930; i--) {
      _yearItems.add(i);
    }
    _updateDayItems();
  }

  bool _isLeapYear(int year) {
    return (year % 4 == 0 && year % 100 != 0) || (year % 400 == 0);
  }

  int _getDaysInMonth(int year, int month) {
    if (month == 2) {
      return _isLeapYear(year) ? 29 : 28;
    } else if ([4, 6, 9, 11].contains(month)) {
      return 30;
    } else {
      return 31;
    }
  }

  void _updateDayItems() {
    if (selectedYear != null && selectedMonth != null) {
      int daysInMonth = _getDaysInMonth(selectedYear!, selectedMonth!);
      _dayItems = List<int>.generate(daysInMonth, (i) => i + 1);
      if (selectedDay != null && selectedDay! > daysInMonth) {
        selectedDay = null;
      }
    } else {
      _dayItems = List<int>.generate(31, (i) => i + 1);
    }
  }

  String? _validateDropdown(int? value) {
    if (value == null) {
      return 'Required';
    }
    return null;
  }

  bool validateSelectedDate() {
    if (_formKey.currentState!.validate()) {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool isDayDropdownEnabled = selectedYear != null && selectedMonth != null;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.r),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CustomDropdown(
              labelText: 'Year',
              value: selectedYear,
              items: _yearItems,
              onChanged: (newValue) {
                setState(() {
                  Provider.of<UserDataModel>(context,listen: false).saveYear(newValue);
                  selectedYear = newValue;
                  _updateDayItems();
                });
              },
              validator: _validateDropdown,
            ),
            CustomDropdown(
              labelText: 'Month',
              value: selectedMonth,
              items: _monthItems,
              onChanged: (newValue) {
                setState(() {
                  Provider.of<UserDataModel>(context,listen: false).saveMonth(newValue);
                  selectedMonth = newValue;
                  _updateDayItems();
                });
              },
              validator: _validateDropdown,
            ),
            CustomDropdown(
              labelText: 'Day',
              value: selectedDay,
              items: _dayItems,
              enabled: isDayDropdownEnabled,
              onChanged: (newValue) {
                setState(() {
                  Provider.of<UserDataModel>(context,listen: false).saveDay(newValue);
                  selectedDay = newValue;
                });
              },
              validator: isDayDropdownEnabled
                  ? _validateDropdown
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
