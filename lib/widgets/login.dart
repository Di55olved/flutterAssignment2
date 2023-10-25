import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/sign.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    onPressed: () {},
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
