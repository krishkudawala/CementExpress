import 'package:cementexpress/Screens/Home/home_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  // CONTROLLERS
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController emailController =
  TextEditingController();

  final TextEditingController phoneController =
  TextEditingController();

  final TextEditingController passwordController =
  TextEditingController();

  // FORM KEY
  final GlobalKey<FormState> formkey =
  GlobalKey<FormState>();

  // FIREBASE AUTH
  final FirebaseAuth auth =
      FirebaseAuth.instance;

  bool loading = false;

  // REGISTER FUNCTION
  Future<void> registerNow() async {

    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty ||
        nameController.text.trim().isEmpty ||
        phoneController.text.trim().isEmpty) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content:
          Text("Please fill all fields"),
        ),
      );

      return;
    }

    setState(() {
      loading = true;
    });

    try {

      // CREATE USER
      UserCredential userCredential =
      await auth
          .createUserWithEmailAndPassword(

        email:
        emailController.text.trim(),

        password:
        passwordController.text.trim(),
      );

      // USER ID
      String uid =
          userCredential.user!.uid;

      // SAVE USER DATA
      await FirebaseFirestore.instance
          .collection("users")
          .doc(uid)
          .set({

        "uid": uid,

        "name":
        nameController.text.trim(),

        "email":
        emailController.text.trim(),

        "phone":
        phoneController.text.trim(),

        "createdAt":
        DateTime.now(),
      });

      ScaffoldMessenger.of(context)
          .showSnackBar(

        const SnackBar(
          content: Text(
            "Account Created Successfully",
          ),
        ),
      );

      Navigator.pushReplacement(

        context,

        MaterialPageRoute(
          builder:
              (context) =>
          const HomeScreen(),
        ),
      );

    } on FirebaseAuthException catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content:
          Text(e.message ?? "Error"),
        ),
      );

    } catch (e) {

      ScaffoldMessenger.of(context)
          .showSnackBar(

        SnackBar(
          content:
          Text(e.toString()),
        ),
      );

    } finally {

      setState(() {
        loading = false;
      });
    }
  }

  @override
  void dispose() {

    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,

        leading: IconButton(

          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black87,
          ),

          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding:
            const EdgeInsets.symmetric(
              horizontal: 24,
            ),

            child: Form(

              key: formkey,

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 10),

                  const Text(

                    "Create Account",

                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w900,
                      color: Colors.black87,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(

                    "Just a few details to get your cement delivered to your site.",

                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      height: 1.4,
                    ),
                  ),

                  const SizedBox(height: 40),

                  // NAME
                  _buildInputField(

                    controller:
                    nameController,

                    label: "Full Name",

                    hint:
                    "e.g. Ramesh Kumar",

                    icon:
                    Icons.person_outline,

                    keyboardType:
                    TextInputType.name,
                  ),

                  const SizedBox(height: 20),

                  // EMAIL
                  _buildInputField(

                    controller:
                    emailController,

                    label:
                    "Email Address",

                    hint:
                    "e.g. abc@gmail.com",

                    icon:
                    Icons.email_outlined,

                    keyboardType:
                    TextInputType.emailAddress,
                  ),

                  const SizedBox(height: 20),

                  // PHONE
                  _buildInputField(

                    controller:
                    phoneController,

                    label:
                    "Phone Number",

                    hint:
                    "e.g. 98765XXXXX",

                    icon:
                    Icons.phone_android,

                    keyboardType:
                    TextInputType.phone,
                  ),

                  const SizedBox(height: 20),

                  // PASSWORD
                  _buildInputField(

                    controller:
                    passwordController,

                    label: "Password",

                    hint:
                    "Enter Password",

                    icon:
                    Icons.lock_outline,

                    keyboardType:
                    TextInputType.visiblePassword,

                    obscureText: true,
                  ),

                  const SizedBox(height: 40),

                  SizedBox(

                    width: double.infinity,
                    height: 54,

                    child: ElevatedButton(

                      onPressed: loading
                          ? null
                          : () {

                        if (formkey
                            .currentState!
                            .validate()) {

                          registerNow();
                        }
                      },

                      style:
                      ElevatedButton.styleFrom(

                        backgroundColor:
                        Colors.deepOrange,

                        foregroundColor:
                        Colors.white,

                        shape:
                        RoundedRectangleBorder(

                          borderRadius:
                          BorderRadius.circular(12),
                        ),
                      ),

                      child: loading

                          ? const CircularProgressIndicator(
                        color: Colors.white,
                      )

                          : const Text(

                        "Create Account",

                        style: TextStyle(
                          fontSize: 18,
                          fontWeight:
                          FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment.center,

                    children: [

                      const Text(
                        "Already have an account? ",
                      ),

                      GestureDetector(

                        onTap: () {
                          Navigator.pop(context);
                        },

                        child: const Text(

                          "Login",

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // INPUT FIELD
  Widget _buildInputField({

    required String label,
    required String hint,
    required IconData icon,
    required TextInputType keyboardType,

    required TextEditingController
    controller,

    bool readOnly = false,
    bool obscureText = false,

    VoidCallback? onTap,

  }) {

    return Column(

      crossAxisAlignment:
      CrossAxisAlignment.start,

      children: [

        Text(

          label,

          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        const SizedBox(height: 8),

        Container(

          decoration: BoxDecoration(

            color: Colors.grey.shade50,

            border: Border.all(
              color: Colors.grey.shade300,
            ),

            borderRadius:
            BorderRadius.circular(12),
          ),

          child: TextFormField(

            controller: controller,

            keyboardType:
            keyboardType,

            readOnly: readOnly,

            obscureText:
            obscureText,

            onTap: onTap,

            validator: (value) {

              if (value == null ||
                  value.trim().isEmpty) {

                return 'Please enter $label';
              }

              return null;
            },

            decoration: InputDecoration(

              prefixIcon: Icon(
                icon,
                color:
                Colors.grey.shade500,
              ),

              border:
              InputBorder.none,

              hintText: hint,

              hintStyle: TextStyle(
                color:
                Colors.grey.shade400,
                fontSize: 15,
              ),

              contentPadding:
              const EdgeInsets.symmetric(
                vertical: 16,
              ),
            ),
          ),
        ),
      ],
    );
  }
}