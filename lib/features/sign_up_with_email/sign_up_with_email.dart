import 'package:flutter/material.dart';
import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpWithEmail extends StatefulWidget {
  const SignUpWithEmail({super.key});

  @override
  State<SignUpWithEmail> createState() => _SignUpWithEmailState();
}

class _SignUpWithEmailState extends State<SignUpWithEmail> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  ScrollPhysics _currentPhysics = const ClampingScrollPhysics();
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  late FocusNode _repeatPasswordFocusNode;
  double _previousBottomInset = 0;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _repeatPasswordFocusNode = FocusNode();
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
    _passwordFocusNode.dispose();
    _repeatPasswordFocusNode.dispose();
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
            duration: const Duration(milliseconds: 150),
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
    }
    // Keyboard closed
    else if (newBottomInset < _previousBottomInset && newBottomInset == 0) {
      // Keyboard is now hidden
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

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateRepeatPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please repeat your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
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
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: SingleChildScrollView(
              controller: _scrollController,
              physics: _currentPhysics,
              child: Padding(
                padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 150.r),
                child: Column(
                  children: [
                    CustomTextField(
                      textEditingController: emailController,
                      hintText: 'Email',
                      icon: Icons.email,
                      focusNode: _emailFocusNode,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {
                        FocusScope.of(context).requestFocus(_passwordFocusNode);
                      },
                      obscureText: false,
                      validator: _validateEmail,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      textEditingController: passwordController,
                      hintText: "Password",
                      icon: Icons.lock_outline,
                      focusNode: _passwordFocusNode,
                      textInputAction: TextInputAction.next,
                      onSubmitted: (value) {
                        FocusScope.of(context)
                            .requestFocus(_repeatPasswordFocusNode);
                      },
                      obscureText: true,
                      validator: _validatePassword,
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      textEditingController: repeatPasswordController,
                      hintText: "Repeat password",
                      icon: Icons.lock_outline,
                      focusNode: _repeatPasswordFocusNode,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (value) {
                        _repeatPasswordFocusNode.unfocus();
                      },
                      obscureText: true,
                      validator: _validateRepeatPassword,
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).viewInsets.bottom > 0
                              ? 100.r
                              : 175.r,
                          bottom: 15.r),
                      child: CustomElevatedButton(
                          buttonName: 'Sign Up',
                          onPressedFun: () {
                            if (_formKey.currentState!.validate()) {
                              // If the form is valid, display a snackbar or navigate.
                              // ScaffoldMessenger.of(context).showSnackBar(
                              //   const SnackBar(content: Text('Processing Data')),
                              // );
                              Navigator.pushNamed(context, '/NameAndBirthDate');
                            }
                          }
                      ),
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
