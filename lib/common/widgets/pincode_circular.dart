// import 'package:flutter/material.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';
//
// class CircularPinCodeFields extends StatelessWidget {
//   final TextEditingController pinController = TextEditingController();
//
//   CircularPinCodeFields({super.key,});
//
//   @override
//   Widget build(BuildContext context) {
//     return PinCodeTextField(
//       appContext: context,
//       length: 6, // Number of pin code fields
//       controller: pinController,
//       onChanged: (value) {
//         // Handle pin code changes
//         print(value);
//       },
//       pinTheme: PinTheme(
//         shape: PinCodeFieldShape.circle,
//         fieldHeight: 60,
//         fieldWidth: 60,
//         activeFillColor: Colors.white,
//         inactiveFillColor: Colors.white,
//         selectedFillColor: Colors.white,
//         borderWidth: 2,
//         borderRadius: BorderRadius.circular(30),
//         activeColor: Colors.purple,
//         inactiveColor: Colors.purple.shade100,
//         selectedColor: Colors.purple,
//       ),
//       cursorColor: Colors.black,
//       animationType: AnimationType.fade,
//       keyboardType: TextInputType.number,
//       boxShadows: [
//         BoxShadow(
//           offset: Offset(0, 1),
//           color: Colors.black12,
//           blurRadius: 10,
//         )
//       ],
//     );
//   }
// }