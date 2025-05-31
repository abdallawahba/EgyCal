import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomDropdown extends StatefulWidget {
  final int? value;
  final String labelText;
  final List<int> items;
  final String? Function(int?)? validator;
  final void Function(int?)? onChanged;
  final bool enabled;

  const CustomDropdown({
    super.key,
    this.value,
    required this.labelText,
    required this.items,
    this.validator,
    this.onChanged,
    this.enabled = true,
  });

  @override
  State<CustomDropdown> createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    Color borderColor = widget.enabled ? Colors.grey : Colors.grey.withOpacity(0.5);
    TextStyle labelStyle = TextStyle(
        color: widget.enabled ? Colors.black54 : Colors.grey.withOpacity(0.7));
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: PhysicalModel(
        color: widget.enabled ? Colors.white : Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
        elevation: widget.enabled ? 4 : 0,
        shadowColor: Colors.grey,
        child: SizedBox(
          width: 200,
          height: 35,
          child: DropdownButtonFormField<int>(
            isDense: true,
            isExpanded: true,
            menuMaxHeight: 250,
            style: TextStyle(
                fontSize: 15,
                color: widget.enabled ? Colors.black : Colors.grey),
            dropdownColor: Colors.white,
            value: widget.value,
            decoration: InputDecoration(
              labelText: widget.labelText,
              labelStyle: labelStyle,
              errorStyle: const TextStyle(fontSize: 0, height: 0),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: borderColor),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1.5, color: Theme.of(context).primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.red, width: 1.5),
                borderRadius: BorderRadius.circular(8),
              ),
              disabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 8.r, horizontal: 10.r),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
            ),
            items: widget.items.map((int itemValue) {
              return DropdownMenuItem<int>(
                value: itemValue,
                child: Text(itemValue.toString()),
              );
            }).toList(),
            onChanged: widget.enabled ? widget.onChanged : null,
            validator: widget.enabled ? widget.validator : null,
          ),
        ),
      ),
    );
  }
}