import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/core/widgets/custom_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import '../../core/models/current_users_data_model.dart';
import '../../core/utils/constants.dart';
import '../../core/utils/helper.dart';

class LogInWithEmail extends StatefulWidget {
  const LogInWithEmail({super.key});

  @override
  State<LogInWithEmail> createState() => _LogInWithEmailState();
}

class _LogInWithEmailState extends State<LogInWithEmail> with WidgetsBindingObserver {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  ScrollPhysics _currentPhysics = const ClampingScrollPhysics();
  late FocusNode _emailFocusNode;
  late FocusNode _passwordFocusNode;
  double _previousBottomInset = 0;
  String? _password;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
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
    else if (newBottomInset < _previousBottomInset && newBottomInset == 0) {
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
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(kSecondaryColor),
        strokeWidth: 3.0,
      ),
      opacity: 0.2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          scrolledUnderElevation: 0.0,
          backgroundColor: Colors.white,
          centerTitle: true,
          toolbarHeight: 60,
          title: Text(
            'Log In',
            style: TextStyle(fontSize: 20.sp),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () => Navigator.pushReplacementNamed(context, '/welcome')
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
                  padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 200.r),
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
                      SizedBox(height: 18.h),
                      CustomTextField(
                        textEditingController: passwordController,
                        hintText: "Password",
                        icon: Icons.lock_outline,
                        focusNode: _passwordFocusNode,
                        textInputAction: TextInputAction.next,
                        onSubmitted: (value) {
                        },
                        obscureText: true,
                        validator: _validatePassword,
                      ),
                      SizedBox(height: 2.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Forgot your password ?',
                            style: TextStyle(
                                fontFamily: kInterFont,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: kSubTitlesColor
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, '/resetPassword');
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.only(left: 5.r),
                              minimumSize: Size(0,0),
                            ),
                            child: Text('reset ',
                              style: TextStyle(
                                fontFamily: kInterFont,
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: kSecondaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).viewInsets.bottom > 0
                                ? 100.r
                                : 210.r,
                            bottom: 15.r),
                        child: CustomElevatedButton(
                            buttonName: 'Log in',
                            onPressedFun: () async {
                              _isLoading = true;
                              setState(() {});
                              try {
                                Provider.of<CurrentUserDataModel>(context, listen: false).fetch();
                                final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                                    email: emailController.text.trim(),
                                    password: passwordController.text,
                                );
                                Navigator.pushReplacementNamed(context, '/home');
                              } on FirebaseAuthException {
                                showCustomSnackBar('Invalid credentials', context);
                              }
                              _isLoading = false;
                              setState(() {});
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
      ),
    );
  }
}
