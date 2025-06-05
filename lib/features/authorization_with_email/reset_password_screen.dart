import 'package:egycal/core/helper.dart';
import 'package:egycal/core/models/user_data_model.dart';
import 'package:flutter/material.dart';
import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import '../../core/constants.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword>
    with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  ScrollPhysics _currentPhysics = const ClampingScrollPhysics();
  late FocusNode _emailFocusNode;
  double _previousBottomInset = 0;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _previousBottomInset = MediaQuery.of(context).viewInsets.bottom;
      }
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    emailController.dispose();
    passwordController.dispose();
    repeatPasswordController.dispose();
    _emailFocusNode.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final newBottomInset = WidgetsBinding.instance.window.viewInsets.bottom;
    if (newBottomInset > _previousBottomInset) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _scrollController.hasClients) {
          _scrollController
              .animateTo(
            _scrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 50),
            curve: Curves.easeOut,
          )
              .whenComplete(() {
            if (mounted) {
              setState(() {
                _currentPhysics = const NeverScrollableScrollPhysics();
              });
            }
          });
        }
      });
    } else if (newBottomInset < _previousBottomInset && newBottomInset == 0) {
      if (mounted) {
        setState(() {
          _currentPhysics = const ClampingScrollPhysics();
        });
      }
    }
    _previousBottomInset = newBottomInset;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  void disable() {
    Provider.of<UserDataModel>(context, listen: false).disabled =
        DateTime.now();
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
        title: Text(
          'Reset Password',
          style: TextStyle(fontSize: 20.sp),
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
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: _currentPhysics,
              child: Padding(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 260.r),
                child: Column(
                  children: [
                    CustomTextField(
                      textEditingController: emailController,
                      hintText: 'Email',
                      icon: Icons.email,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {},
                      obscureText: false,
                      validator: _validateEmail,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.bottom > 0
                              ? 100.r
                              : 290.r,
                          bottom: 15.r),
                      child: CustomElevatedButton(
                          buttonName: 'Send Verification Email',
                          onPressedFun: () {
                            if (Provider.of<UserDataModel>(context,
                                    listen: false)
                                .isDisabled()) {
                              showCustomSnackBar(
                                  "You may try again after ${Provider.of<UserDataModel>(context, listen: false).getRemainingTimeUntilThreeMinutesPass(Provider.of<UserDataModel>(context, listen: false).disabled)}",
                                  context);
                            } else {
                              showCustomSnackBar(
                                  "Verification email has been Sent successfully",
                                  context);
                              disable();
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
