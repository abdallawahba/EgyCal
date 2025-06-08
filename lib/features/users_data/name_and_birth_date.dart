import 'package:egycal/core/utils/helper.dart';
import 'package:egycal/core/models/users_data_model.dart';
import 'package:egycal/core/widgets/custom_navigation_button.dart';
import 'package:egycal/core/widgets/custom_text.dart';
import 'package:egycal/core/widgets/custom_text_field.dart';
import 'package:egycal/features/users_data/widgets/birthday_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:egycal/core/utils/constants.dart';
import 'package:provider/provider.dart';

class NameAndBirthDate extends StatefulWidget {
  const NameAndBirthDate({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NameAndBirthDateState createState() => _NameAndBirthDateState();
}

class _NameAndBirthDateState extends State<NameAndBirthDate> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  List<int> years = List<int>.generate(2020, (i) => i + 1951);
  List<int> days = List<int>.generate(31, (i) => i + 1);
  final GlobalKey<BirthdayPickerWidgetState> _birthdayPickerKey = GlobalKey<BirthdayPickerWidgetState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();

  late FocusNode _firstNameFocusNode;
  late FocusNode _lastNameFocusNode;

  final ScrollController _scrollController = ScrollController();
  ScrollPhysics _currentPhysics = const ClampingScrollPhysics();
  double _previousBottomInset = 0;

  @override
  void initState() {
    super.initState();
    _firstNameFocusNode = FocusNode();
    _lastNameFocusNode = FocusNode();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _previousBottomInset = MediaQuery.of(context).viewInsets.bottom;
      }
    });
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _firstNameFocusNode.dispose();
    _lastNameFocusNode.dispose();
    _scrollController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final newBottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (newBottomInset > _previousBottomInset) {
      if (_firstNameFocusNode.hasFocus || _lastNameFocusNode.hasFocus) {
         WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _currentPhysics = const NeverScrollableScrollPhysics();
              });
            }
         });
      }
    }
    else if (newBottomInset < _previousBottomInset && newBottomInset == 0) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
          if (mounted) {
            setState(() {
              _currentPhysics = const ClampingScrollPhysics();
            });
          }
      });
    }
    _previousBottomInset = newBottomInset;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
              controller: _scrollController,
              physics: _currentPhysics,
              dragStartBehavior: DragStartBehavior.start,
              child: Padding(
                padding: EdgeInsets.only(left: 30.r, right: 30.r, top: 80.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                        title: 'Enter your name and birth date',
                        description: 'Tell us a bit about yourself \n            to get started',
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom:15.r, top:35.r),
                      child: Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: kTitlesColor,
                        ),
                      ),
                    ),
                    CustomTextField(
                      textEditingController: _firstNameController,
                      focusNode: _firstNameFocusNode,
                      hintText: 'First name',
                      obscureText: false,
                      textInputAction: TextInputAction.next,
                      onChanged: (value) {
                        Provider.of<UserDataModel>(context,listen: false).saveFirstName(value);
                        FocusScope.of(context).requestFocus(_lastNameFocusNode);
                      },
                      onSubmitted: (value) {
                        Provider.of<UserDataModel>(context,listen: false).saveFirstName(value);
                        _lastNameFocusNode.unfocus();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(top:20.r),
                      child: CustomTextField(
                        textEditingController: _lastNameController,
                        focusNode: _lastNameFocusNode,
                        hintText: 'Last name',
                        obscureText: false,
                        textInputAction: TextInputAction.done,
                        onChanged: (value) {
                            Provider.of<UserDataModel>(context,listen: false).saveLastName(value);
                          _lastNameFocusNode.unfocus();
                        },
                        onSubmitted: (value) {
                          Provider.of<UserDataModel>(context,listen: false).saveLastName(value);
                          _lastNameFocusNode.unfocus();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding:  EdgeInsets.only(top:40.r),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Date of birth",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: kTitlesColor,
                            ),
                          ),
                          BirthdayPickerWidget(key: _birthdayPickerKey),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.r,top: 25.r),
                      child: NavigationButtons(
                          onBack: (){Navigator.pop(context);},
                          onNext: (){if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            if (_birthdayPickerKey.currentState?.validateSelectedDate() ?? false) {
                              _formKey.currentState!.save();
                              Navigator.pushNamed(context, '/goal');
                              Provider.of<UserDataModel>(context, listen: false).saveFirstName(_firstNameController.text.trim());
                              Provider.of<UserDataModel>(context, listen: false).saveLastName(_lastNameController.text.trim());

                            } else {
                              showCustomSnackBar('Please select a valid date of birth.', context);
                            }
                          } else {
                            if (_firstNameController.text.isEmpty && _lastNameController.text.isEmpty) {
                              showCustomSnackBar('Please enter your first and last name.', context);
                            } else if (_firstNameController.text.isEmpty) {
                              showCustomSnackBar('Please enter your first name.', context);
                            } else if (_lastNameController.text.isEmpty) {
                              showCustomSnackBar('Please enter your last name.', context);
                            }
                          }}
                      )
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
