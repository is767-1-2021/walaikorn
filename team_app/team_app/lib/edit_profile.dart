// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:date_field/date_field.dart';
// import 'model/user_model.dart';

// class EditProfilePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text('Edit Profile'),
//         backgroundColor: Colors.deepPurple[600],
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pushNamed(context, '/profile');
//           },
//           icon: Icon(Icons.arrow_back),
//         ),
//       ),
//       body: EditProfileForm(),
//     );
//   }
// }

// class EditProfileForm extends StatefulWidget {
//   @override
//   _EditProfileFormState createState() => _EditProfileFormState();
// }

// class _EditProfileFormState extends State<EditProfileForm> {
//   bool _isHiden = true;

//   final _formKey = GlobalKey<FormState>();
//   String? _userName;
//   String? _phoneNumber;
//   String? _email;
//   String? _dateOfBirth;
//   int? _age;
//   String? _gender;

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//         key: _formKey,
//         child: SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 width: 500,
//                 padding: EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: "Name",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(color: Colors.deepPurple.shade600),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(
//                         color: Colors.amber,
//                       ),
//                     ),
//                     hintText: "Enter Name",
//                     prefixIcon: Icon(Icons.face_retouching_natural,
//                         color: Colors.black45),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter name';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _userName = value;
//                   },
//                   initialValue: context.read<ProfileFormModel>().userName,
//                 ),
//               ),
//               Container(
//                 width: 500,
//                 padding: EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: "Phone",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(color: Colors.deepPurple.shade600),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(
//                         color: Colors.amber,
//                       ),
//                     ),
//                     hintText: "Enter phone number",
//                     prefixIcon: Icon(Icons.phone, color: Colors.black45),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter phone number';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _phoneNumber = value;
//                   },
//                   initialValue: context.read<ProfileFormModel>().phoneNumber,
//                 ),
//               ),
//               Container(
//                 width: 500,
//                 padding: EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   keyboardType: TextInputType.emailAddress,
//                   decoration: InputDecoration(
//                     labelText: "Email",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(color: Colors.deepPurple.shade600),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(
//                         color: Colors.amber,
//                       ),
//                     ),
//                     hintText: "Enter email",
//                     prefixIcon:
//                         Icon(Icons.account_circle, color: Colors.black45),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter email';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _email = value;
//                   },
//                   initialValue: context.read<ProfileFormModel>().email,
//                 ),
//               ),
//               Container(
//                 width: 500,
//                 padding: EdgeInsets.all(10.0),
//                 child: DateTimeFormField(
//                   decoration: const InputDecoration(
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.all(Radius.circular(28.0)),
//                       borderSide: BorderSide(color: Colors.deepPurple),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.all(Radius.circular(28.0)),
//                         borderSide: BorderSide(
//                           color: Colors.amber,
//                         )),
//                     hintText: "Pick date of birth",
//                     prefixIcon: Icon(Icons.calendar_today),
//                     suffixIcon: Icon(Icons.event_note),
//                     labelText: 'Date of Birth',
//                   ),
//                   mode: DateTimeFieldPickerMode.date,
//                   autovalidateMode: AutovalidateMode.always,
//                   validator: (e) =>
//                       (e?.day ?? 0) == 1 ? 'Please select date of birth' : null,
//                   onDateSelected: (DateTime value) {
//                     print(value);
//                   },
//                 ),
//               ),
//               Container(
//                 width: 500,
//                 padding: EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: "Age",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(color: Colors.deepPurple.shade600),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(
//                         color: Colors.amber,
//                       ),
//                     ),
//                     hintText: "Enter age",
//                     prefixIcon: Icon(Icons.face, color: Colors.black45),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter age';
//                     }
//                     if (int.parse(value) < 18) {
//                       return 'Please enter valid age';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _age = int.parse(value!);
//                   },
//                   initialValue: context.read<ProfileFormModel>().age.toString(),
//                 ),
//               ),
//               Container(
//                 width: 500,
//                 padding: EdgeInsets.all(10.0),
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     labelText: "Gender",
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(color: Colors.deepPurple.shade600),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(28.0),
//                       borderSide: BorderSide(
//                         color: Colors.amber,
//                       ),
//                     ),
//                     hintText: "Enter gender",
//                     prefixIcon: Icon(Icons.group, color: Colors.black45),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter gender';
//                     }
//                     return null;
//                   },
//                   onSaved: (value) {
//                     _gender = value;
//                   },
//                   initialValue: context.read<ProfileFormModel>().gender,
//                 ),
//               ),
//               Padding(padding: EdgeInsets.all(10)),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _formKey.currentState!.save();

//                     context.read<ProfileFormModel>().userName = _userName;
//                     context.read<ProfileFormModel>().phoneNumber = _phoneNumber;
//                     context.read<ProfileFormModel>().email = _email;
//                     context.read<ProfileFormModel>().age = _age;
//                     context.read<ProfileFormModel>().gender = _gender;

//                     Navigator.pop(context);
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   primary: Colors.deepPurple.shade600,
//                   onPrimary: Colors.white,
//                 ),
//                 child: Text('Submit'),
//               ),
//             ],
//           ),
//         ));
//   }
// }
