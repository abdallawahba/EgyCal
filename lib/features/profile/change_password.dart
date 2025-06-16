import 'package:egycal/core/widgets/custom_elevated_button.dart';
import 'package:egycal/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({
    super.key,
  });

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final repeatPasswordController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final ScrollPhysics _currentPhysics = const ClampingScrollPhysics();
  // final ChangePasswordModel changePasswordModel = ChangePasswordModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        toolbarHeight: 60,
        title: const Text('Change Password'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.pushReplacementNamed(context, '/account'),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal:20.r),
          child: SingleChildScrollView(
            controller: _scrollController,
              physics: _currentPhysics,
            child: Padding(
              padding: EdgeInsets.only(left: 15.r, right: 15.r, top: 200.r),
              child: Column(
                children: [
                  Center(
                      child: Text(
                    'Please enter your old and new \n       passwords to continue',
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  )),
                  const SizedBox(height: 150),
                  CustomTextField(
                    
                    textEditingController: oldPasswordController,
                    hintText: "Old password",
                    icon: Icons.lock_outline,
                    // focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {},
                    obscureText: true,
                    // validator: _validatePassword,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    textEditingController: newPasswordController,
                    hintText: "New Password",
                    icon: Icons.lock_outline,
                    // focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {},
                    obscureText: true,
                    // validator: _validatePassword,
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(
                    textEditingController: repeatPasswordController,
                    hintText: "Repeat new password",
                    icon: Icons.lock_outline,
                    // focusNode: _passwordFocusNode,
                    textInputAction: TextInputAction.next,
                    onSubmitted: (value) {},
                    obscureText: true,
                    // validator: _validatePassword,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).viewInsets.bottom > 0
                            ? 100.r
                            : 210.r,
                        bottom: 15.r),
                    child: CustomElevatedButton(
                      buttonName: 'Change',
                      onPressedFun: () {},
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
