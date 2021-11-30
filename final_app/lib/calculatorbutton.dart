// import 'package:flutter/material.dart';

// class calculatorButton extends StatelessWidget {
//   final String? text;
//   final Function? callBack;
//   final double? textSize;


 

//   const calculatorButton({
//     Key? key,
//     this.text, 
//     this.callBack,
//     this.textSize,


//   }): super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       child:  SizedBox(
//         height: 98,
//         width: 98,
//         child: TextButton(
//           style: TextButton.styleFrom(
//             side: BorderSide(color: Colors.grey),
//             backgroundColor: Colors.blueGrey[900],
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(24.0),
//             child: Text(text!,
//               style: TextStyle(
//                 fontSize: 24,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//          ),
//         onPressed: () => callBack!(text),
     
        
//         ),
//       ),
//     );
//   }
// }

// Widget calculatorButton(String buttonText) {
//   return Expanded(
//     child: OutlinedButton(
//       child: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Text(buttonText,
//           style: TextStyle(
//             fontWeight: FontWeight.bold
//             ),
//         ),
//       ),
//       onPressed: () => buttonPressed(buttonText)

  