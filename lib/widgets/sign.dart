import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Image(
              image: AssetImage('assets/images/asset2.jpg'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(32.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                "Sign Up",
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
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 146, 93, 156))),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      borderSide:
                          BorderSide(color: Color.fromARGB(255, 146, 93, 156))),
                ),
              ),
              const SizedBox(height: 20.0),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value != null && value.length > 20) {
                          return "Max Character limit 20";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("Password"),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 146, 93, 156))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 146, 93, 156)))),
                    ),
                  ),
                  const SizedBox(width: 25.0),
                  Expanded(
                    child: TextFormField(
                      autovalidateMode: AutovalidateMode.always,
                      validator: (value) {
                        if (value != null && value.length > 20) {
                          return "Max Character limit 20";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          label: Text("Confirm Password"),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 146, 93, 156))),
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 146, 93, 156)))),
                    ),
                  )
                ],
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
                  child: const Text("Sign Up"),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Row(
                children: [
                  const Text("Have an account?"),
                  const SizedBox(
                    width: 3.0,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                      );
                    },
                    child: const Text(
                      "Log In",
                      style:
                          TextStyle(color: Color.fromARGB(255, 146, 93, 156)),
                    ),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
