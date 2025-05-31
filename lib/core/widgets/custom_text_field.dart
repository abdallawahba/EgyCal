import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatefulWidget {
  final String? hintText;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final TextEditingController? textEditingController;
  const CustomTextField({
    super.key,
    required this.obscureText,
    this.icon,
    this.validator,
    this.onSaved,
    this.focusNode,
    this.textInputAction,
    this.textEditingController,
    this.onChanged,
    this.hintText,
    this.onSubmitted,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _isObscured;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      elevation:3,
      shadowColor: Colors.grey,
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: _isObscured,
        focusNode: widget.focusNode,
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? IconButton(
            icon: Icon(
              _isObscured ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _isObscured = !_isObscured;
              });
            },
          )
              : null,
          contentPadding: EdgeInsets.all(20.r),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: Colors.grey),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: widget.hintText,
          prefixIcon: widget.icon != null ? Icon(widget.icon) : null,
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1.w),
          ),
        ),
        validator: widget.validator,
        onChanged: widget.onSaved,
        onSaved: widget.onSaved,
        onFieldSubmitted: widget.onSubmitted,
      ),
    );
  }
}
