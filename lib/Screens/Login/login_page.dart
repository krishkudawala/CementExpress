import 'package:cementexpress/Screens/Home/home_screen.dart';
import 'package:cementexpress/Screens/Signup/signup.dart';
import 'package:cementexpress/Screens/forget/forget_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // CONTROLLERS
  final TextEditingController email =
  TextEditingController();

  final TextEditingController password =
  TextEditingController();

  // FORM KEY
  final GlobalKey<FormState> formkey =
  GlobalKey<FormState>();

  // FIREBASE AUTH
  final FirebaseAuth auth =
      FirebaseAuth.instance;

  bool loading = false;

  // LOGIN FUNCTION
  Future<void> login() async {

    try {

      await auth.signInWithEmailAndPassword(

        email: email.text.trim(),

        password: password.text.trim(),
      );

      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(
              builder: (context) =>HomeScreen()
          ), (value) =>false);

    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(
          content: Text(
            e.message.toString(),
          ),
        ),
      );
    }
  }

  // IMAGE LIST
  List<String> banners = [

    "assets/images/cementpic.jpg",
    "assets/images/cementpic2.jpg",
    "assets/images/cementpic3.jpg",
    "assets/images/cementpic4.jpg",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      body: SingleChildScrollView(

        child: Form(

          key: formkey,

          child: Column(

            children: [

              // ================= IMAGE SLIDER =================

              SizedBox(

                height: 300,

                child: PageView.builder(

                  itemCount: banners.length,

                  itemBuilder: (context, index) {

                    return Container(

                      decoration: BoxDecoration(

                        borderRadius:
                        const BorderRadius.only(

                          bottomLeft:
                          Radius.circular(30),

                          bottomRight:
                          Radius.circular(30),
                        ),

                        image: DecorationImage(

                          image:
                          AssetImage(
                            banners[index],
                          ),

                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 35),

              // ================= LOGIN CONTENT =================

              Padding(

                padding:
                const EdgeInsets.symmetric(
                  horizontal: 24,
                ),

                child: Column(

                  crossAxisAlignment:
                  CrossAxisAlignment.center,

                  children: [

                    // TITLE

                    const Text(

                      "India's #1 Cement App",

                      style: TextStyle(
                        fontSize: 26,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10),

                    const Text(

                      'Log in or sign up',

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight:
                        FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 30),

                    // ================= EMAIL =================

                    TextFormField(

                      controller: email,

                      keyboardType:
                      TextInputType.emailAddress,

                      decoration: InputDecoration(

                        prefixIcon:
                        const Icon(Icons.email),

                        hintText:
                        'Enter Your Email',

                        labelText: 'Email',

                        border:
                        OutlineInputBorder(

                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),

                      validator: (value) {

                        if (value == null ||
                            value.isEmpty) {

                          return
                            "Please Enter Email";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 20),

                    // ================= PASSWORD =================

                    TextFormField(

                      controller: password,

                      obscureText: true,

                      decoration: InputDecoration(

                        prefixIcon:
                        const Icon(Icons.lock),

                        hintText:
                        'Enter Password',

                        labelText: 'Password',

                        border:
                        OutlineInputBorder(

                          borderRadius:
                          BorderRadius.circular(15),
                        ),
                      ),

                      validator: (value) {

                        if (value == null ||
                            value.isEmpty) {

                          return
                            "Please Enter Password";
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // ================= LOGIN BUTTON =================

                    loading

                        ? const Center(
                      child:
                      CircularProgressIndicator(),
                    )

                        : SizedBox(

                      width: double.infinity,
                      height: 55,

                      child: ElevatedButton.icon(

                        onPressed: () {

                          if (formkey
                              .currentState!
                              .validate()) {

                            login();
                          }
                        },

                        style:
                        ElevatedButton.styleFrom(

                          backgroundColor:
                          Colors.blueGrey,

                          foregroundColor:
                          Colors.white,

                          shape:
                          RoundedRectangleBorder(

                            borderRadius:
                            BorderRadius.circular(15),
                          ),
                        ),

                        icon:
                        const Icon(Icons.login),

                        label: const Text(

                          'Continue',

                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.centerRight,

                      child: TextButton(

                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>ForgetPassword()
                          ));
                        },

                        child: const Text(
                          'Forget Password ?',
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),
                    // ================= SIGNUP =================

                    Row(

                      mainAxisAlignment:
                      MainAxisAlignment.center,

                      children: [

                        const Text(

                          "New here? ",

                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),

                        GestureDetector(

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (context) =>
                                const Signup(),
                              ),
                            );
                          },

                          child: const Text(

                            "Create an account",

                            style: TextStyle(
                              color:
                              Colors.deepOrange,

                              fontWeight:
                              FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    // ================= TERMS =================

                    const Text(
                      'By Continuing, you agree to our',
                    ),

                    const SizedBox(height: 5),

                    const Text(

                      'Terms of Service • Privacy Policy • Content Policy',

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}