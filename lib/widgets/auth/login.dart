import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/auth/sign.dart';
import 'package:flutter_application_1/widgets/screens/home_screen.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController textFieldControllerEmail = TextEditingController();
  TextEditingController textFieldControllerPassword = TextEditingController();
  String textFieldValueEmail = '';
  String textFieldValuePassword = '';

  _googleHandleClicked() {
    _signInWithGoogle().then((user) {
      print("User: ${user.user}");
      print("User Additional Info: ${user.additionalUserInfo}");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => const HomeScreen()));
    });
  }

  Future<UserCredential> _signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/asset1.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Log In",
                  style: TextStyle(
                    color: Color.fromARGB(255, 146, 93, 156),
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: textFieldControllerEmail,
                  validator: (value) {
                    if (value != null && value.length > 50) {
                      return 'Max length of 50 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 93, 156))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 93, 156))),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextFormField(
                  obscureText: true,
                  controller: textFieldControllerPassword,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (value) {
                    if (value != null && value.length > 20) {
                      return 'Max length of 20 characters';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    labelText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 93, 156))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 146, 93, 156))),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                  width: 400.0,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () async {
                      textFieldValueEmail = textFieldControllerEmail.text;
                      textFieldValuePassword = textFieldControllerPassword.text;
                      try {
                        await FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: textFieldValueEmail,
                            password: textFieldValuePassword);
                        // Sign-in was successful, navigate to a different page.
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'user-not-found') {
                          print('No user found for that email.');
                        } else if (e.code == 'wrong-password') {
                          print('Wrong password provided for that user.');
                        }
                      } catch (e) {
                        print("Handle this please ${e}");
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 164, 52, 255)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40.0)))),
                    child: const Text("Sign In"),
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                    width: 400.0,
                    height: 50.0,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromARGB(255, 164, 52, 255),
                            elevation: 1),
                        onPressed: () {
                          _googleHandleClicked();
                        },
                        label: RichText(
                            text: const TextSpan(children: [
                          TextSpan(text: "Login with "),
                          TextSpan(
                              text: "Google",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])),
                        icon: Image.asset(
                          'assets/images/google.png',
                          height: MediaQuery.of(context).size.height * .035,
                        ))),
                const SizedBox(
                  height: 15.0,
                ),
                SizedBox(
                    width: 400.0,
                    height: 50.0,
                    child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            shape: const StadiumBorder(),
                            backgroundColor:
                                const Color.fromARGB(255, 164, 52, 255),
                            elevation: 1),
                        onPressed: () {
                          _googleHandleClicked();
                        },
                        label: RichText(
                            text: const TextSpan(children: [
                          TextSpan(text: "Login with "),
                          TextSpan(
                              text: "Meta",
                              style: TextStyle(fontWeight: FontWeight.bold))
                        ])),
                        icon: Image.asset(
                          'assets/images/meta.png',
                          height: MediaQuery.of(context).size.height * .035,
                        ))),
                const SizedBox(
                  height: 15.0,
                ),
                Row(
                  children: [
                    const Text("Don't have an account?"),
                    const SizedBox(
                      width: 3.0,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignUp()),
                        );
                      },
                      child: const Text(
                        "Sign Up",
                        style:
                            TextStyle(color: Color.fromARGB(255, 146, 93, 156)),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                InkWell(
                  onTap: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: Color.fromARGB(255, 146, 93, 156)),
                  ),
                )
                // Add text input fields and login button here
              ],
            ),
          ),
        ],
      ),
    );
  }
}
