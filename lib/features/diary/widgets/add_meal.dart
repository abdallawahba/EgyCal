// import 'package:egycal/features/diary/presentation/widgets/textfield_of_meal.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class AddMealBottomSheet extends StatefulWidget {
//   final void Function(String name, int calories, String time) onMealAdded;

//   const AddMealBottomSheet({super.key, required this.onMealAdded});

//   @override
//   State<AddMealBottomSheet> createState() => _AddMealBottomSheetState();
// }

// class _AddMealBottomSheetState extends State<AddMealBottomSheet> {
//   final _formKey = GlobalKey<FormState>();
//   final mealNameController = TextEditingController();
//   final caloriesController = TextEditingController();

//   void saveMeal() {
//     if (_formKey.currentState!.validate()) {
//       final name = mealNameController.text.trim();
//       final cal = int.parse(caloriesController.text.trim());
//       final now = DateTime.now();
//       final formattedTime = DateFormat.jm().format(now);
//       widget.onMealAdded(name, cal, formattedTime);
//       Navigator.of(context).pop();
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: MediaQuery.of(context).viewInsets,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               const Text('Add Meal',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 16),
//               TextfieldOfMeal(
//                 controller: mealNameController,
//                 validator: (value) => (value == null || value.trim().isEmpty)
//                     ? 'Enter a meal name'
//                     : null,
//                 labelText: 'Meal Name',
//                 keyboardType: TextInputType.text,
//               ),
//               const SizedBox(height: 16),
//               TextfieldOfMeal(
//                 controller: caloriesController,
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   final val = int.tryParse(value ?? '');
//                   if (val == null || val <= 0) return 'Enter valid calories';
//                   return null;
//                 },
//                 labelText: 'Calories',
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Color(0xFF152D2F),
//                   foregroundColor: Colors.white,
//                   fixedSize: Size(100, 30),
//                 ),
//                 onPressed: saveMeal,
//                 child: const Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
