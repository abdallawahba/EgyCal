import 'package:egycal/core/helper.dart';
import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/core/widgets/custom_text_field.dart';
import 'package:egycal/features/users_data/widgets/birthday_picker.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        backgroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text(
          'Create an account',
          style: TextStyle(fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(left: 20.r, right: 20.r),
            child: SingleChildScrollView(
                controller: _scrollController,
                physics: _currentPhysics,
                dragStartBehavior: DragStartBehavior.start,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.r, right: 15.r, top: MediaQuery.of(context).viewInsets.bottom > 0 ? 10.r:120.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextField(
                        textEditingController: _firstNameController,
                        focusNode: _firstNameFocusNode,
                        hintText: 'First name',
                        obscureText: false,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) {
                          FocusScope.of(context).requestFocus(_lastNameFocusNode);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      CustomTextField(
                        textEditingController: _lastNameController,
                        focusNode: _lastNameFocusNode,
                        hintText: 'Last name',
                        obscureText: false,
                        textInputAction: TextInputAction.done,
                        onSubmitted: (value) {
                          _lastNameFocusNode.unfocus();
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Date of birth",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 10),
                          BirthdayPickerWidget(key: _birthdayPickerKey),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Ensures full width
                        children: [
                        ],
                      ),
                      SizedBox(height: 25.h),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: CustomElevatedButton(
                          buttonName: 'Next',
                          onPressedFun: () {
                            if (_formKey.currentState != null &&
                                _formKey.currentState!.validate()) {
                              if (_birthdayPickerKey.currentState?.validateSelectedDate() ?? false) {
                                _formKey.currentState!.save();
                                Navigator.pushNamed(context, '/splash'); // Go back to the login page
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
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
