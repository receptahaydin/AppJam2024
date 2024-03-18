import 'package:app_jam_2024/reusable_widgets/reusable_widget.dart';
import 'package:app_jam_2024/screens/signIn_screen.dart';
import 'package:app_jam_2024/sizin/main_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2b2831),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              10,
              MediaQuery.of(context).size.height * 0.1,
              10,
              0,
            ),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/logo.png"),
                SizedBox(height: 20),
                reusableTextField(
                    "E-posta Adresi", Icons.email, false, _emailTextController),
                SizedBox(height: 20),
                reusableTextField("Şifre", Icons.lock_outline, true,
                    _passwordTextController),
                SizedBox(height: 20),
                signInSignUpButton(context, false, () async {
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text);
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  } on FirebaseAuthException catch (e) {
                    // ignore: use_build_context_synchronously
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Hata'),
                          content:
                              Text('${e.message}'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Popup'ı kapat
                              },
                              child: Text('Tamam'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                }),
                const SizedBox(height: 20),
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              height: 0.5,
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                          const Text(
                            "ya da",
                            style: TextStyle(color: Colors.white),
                          ),
                          Expanded(
                            child: Container(
                              height: 0.5,
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(horizontal: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Google sign-in
                          },
                          icon: Image.asset('assets/images/google.png',
                              height: 20, width: 20),
                          label: Text('Google',
                              style: TextStyle(color: Colors.red)),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(75,
                                40)), // Genişlik ve yükseklik değerleri ayarlanabilir
                          ),
                        ),
                        SizedBox(width: 10), // Add space between buttons
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Facebook sign-in
                          },
                          icon: Icon(
                            Icons.facebook,
                            color: Colors.blue,
                          ),
                          label: Text('Facebook',
                              style: TextStyle(color: Colors.blue, fontSize: 13)),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(75,
                                40)), // Genişlik ve yükseklik değerleri ayarlanabilir
                          ),
                        ),
                        SizedBox(width: 10), // Add space between buttons
                        ElevatedButton.icon(
                          onPressed: () {
                            // Handle Apple sign-in
                          },
                          icon: Icon(
                            Icons.apple,
                            color: Colors.black,
                          ),
                          label: Text('Apple',
                              style: TextStyle(color: Colors.black)),
                          style: ButtonStyle(
                            minimumSize: MaterialStateProperty.all(Size(75,
                                40)), // Genişlik ve yükseklik değerleri ayarlanabilir
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                        height:
                            20), // Add space between buttons and sign-up option
                    signInOption(), // Add the sign-up option widget
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row signInOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Zaten bir hesabın var mı?",
          style: TextStyle(color: Colors.white70),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignInScreen()));
          },
          child: const Text(
            " Giriş Yap",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
