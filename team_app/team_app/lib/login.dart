import 'package:flutter/material.dart';
import 'package:team_app/controllers/deal_controller.dart';
import 'package:team_app/deal_page.dart';
import 'package:team_app/register.dart';
import 'package:team_app/services/deal_services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'nav.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepPurple[700],
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back_outlined))),
      body: MyCustomForm(),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

class _MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Container(
            child: Padding(
          padding: const EdgeInsets.all(30.0),
          //child: Form(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "WeDeal",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                      color: Colors.black54),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: Colors.black87),
                ),
                SizedBox(height: 20),

                //Text("Email", style: TextStyle(fontSize: 16)),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      labelText: 'Email',
                      hintText: 'Please input your Email',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Email';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                //Text("Password", style: TextStyle(fontSize: 16)),
                TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_clock_outlined),
                      suffixIcon: Icon(Icons.visibility_off_outlined),
                      labelText: 'Password',
                      hintText: 'Please input your Password',
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade400),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade400))),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Password';
                    }

                    return null;
                  },
                  onSaved: (value) {
                    _password = value;
                  },
                ),

                SizedBox(height: 5),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.black45,
                          textStyle: const TextStyle(
                              fontSize: 14, color: Colors.black54)),
                      onPressed: () {},
                      child: const Text("Forgot Password?"),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple[700],
                        ),
                        child: Text("Login",
                            style: TextStyle(
                              fontSize: 20,
                            )),
                        onPressed: () async {
                          var services = FirebaseServices();
                          var controller = DealController(services);

                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            /*check email ถ้าไม่มีใน database ให้ฟ้อง*/
                            if (!EmailValidator.validate(_email!)) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          'Please input the valid Email')));
                            }

                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _email!, password: _password!)
                                  .then((value) {
                                /*ถ้าเช็คเมล์กับพาสเวิร์ดแล้ว ให้มันไปรีเซตค่าในฟอร์ม*/
                                _formKey.currentState!.reset();
                                /*login สำเร็จ*/
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => DealPage(
                                              controller: controller,
                                            )));
                              });
                              /*e = error try on catch เป็นการแจ้งว่ามี exit route เดิมไปแล้ว*/
                              /*เป็น default code*/
                            } on FirebaseAuthException catch (e) {
                              if (e.code == 'user-not-found') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'No user found for This Email')));
                              } else if (e.code == 'wrong-password') {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Email or password is incorrect')));
                              }
                            }
                          }
                        })),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            primary: Colors.deepPurple,
                            textStyle: const TextStyle(
                                fontSize: 14, color: Colors.deepPurple)),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                        child: const Text("Sign Up"),
                      ),
                    ],
                  ),
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "- Or -",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Sign In with",
                        style: TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      //ใส่รูป
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            height: 55.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/facebook.png"),
                            )),
                          ),
                          Container(
                            height: 55.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/google.png"),
                            )),
                          ),
                          Container(
                            height: 55.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/line.png"),
                            )),
                          ),
                          Container(
                            height: 55.0,
                            width: 55.0,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("image/twitter.png"),
                            )),
                          ),
                        ],
                      ),
                    ])
              ],
            ),
          ),
        )));
  }
}
