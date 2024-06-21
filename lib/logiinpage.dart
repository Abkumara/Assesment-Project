import 'package:assesmnet_project/homepage.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();
  bool signBool = true;

  void clearTextFields() {
    emailController.clear();
    passwordController.clear();
    retypePasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          'Project',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  decoration: InputDecoration(
                      fillColor: Colors.grey[500],
                      filled: true,
                      label: const Text(
                        'Email',
                        style: TextStyle(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      border: const OutlineInputBorder(
                          borderSide: BorderSide(width: 2))),
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Email';
                    } else if (!value.contains('@')) {
                      return 'Please enter correct email address';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  obscureText: true,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                  decoration: InputDecoration(
                    fillColor: Colors.grey[500],
                    filled: true,
                    label: const Text(
                      'Password',
                      style: TextStyle(color: Colors.white),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(width: 2),
                    ),
                  ),
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Password';
                    } else if (value.length < 8) {
                      return 'Please enter Strong Passord';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                if (!signBool)
                  TextFormField(
                    obscureText: true,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                    decoration: InputDecoration(
                      fillColor: Colors.grey[500],
                      filled: true,
                      label: const Text(
                        'Re-type Password',
                        style: TextStyle(color: Colors.white),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 10),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                      ),
                    ),
                    controller: retypePasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Your Password';
                      } else if (value != passwordController.text) {
                        return 'Not macthing Passwords';
                      }
                      return null;
                    },
                  ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: const ButtonStyle(
                          padding: MaterialStatePropertyAll(
                              EdgeInsets.symmetric(vertical: 10)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.transparent),
                          shape: MaterialStatePropertyAll(
                            BeveledRectangleBorder(
                                borderRadius: BorderRadius.zero),
                          )),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      },
                      child: Text(
                        (signBool) ? 'Sign in' : 'Sign Up',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      (signBool)
                          ? 'New to GlakFlix?'
                          : 'Already have an account?',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            signBool = !signBool;
                          });
                        },
                        child: Text(
                          (signBool) ? 'Sign Up Now' : 'Sign In Now',
                          style: const TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
