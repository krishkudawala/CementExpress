import 'package:flutter/material.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {

  TextEditingController nameController = TextEditingController();
  TextEditingController feedbackController = TextEditingController();

  double rating = 3;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Feedback",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Form(
          key: formKey,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              const SizedBox(height: 10),

              const Text(
                "Share Your Experience",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                "Your feedback helps us improve our services.",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey.shade600,
                ),
              ),

              const SizedBox(height: 35),

              // NAME
              buildField(
                controller: nameController,
                label: "Full Name",
                hint: "Enter your name",
                icon: Icons.person_outline,
              ),

              const SizedBox(height: 20),

              // FEEDBACK
              buildField(
                controller: feedbackController,
                label: "Feedback",
                hint: "Write your feedback here...",
                icon: Icons.feedback_outlined,
                maxLines: 5,
              ),

              const SizedBox(height: 30),

              // RATING
              const Text(
                "Rate Us",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {

                  return IconButton(

                    onPressed: () {

                      setState(() {
                        rating = index + 1;
                      });

                    },

                    icon: Icon(
                      Icons.star,

                      color: index < rating
                          ? Colors.amber
                          : Colors.grey.shade300,

                      size: 38,
                    ),
                  );
                }),
              ),

              const SizedBox(height: 35),

              // SUBMIT BUTTON
              SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton(
                  onPressed: () {

                    if (formKey.currentState!.validate()) {

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Thank you for your feedback!",
                          ),
                        ),
                      );
                    }

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  child: const Text(
                    "Submit Feedback",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // THANK YOU SECTION
              Center(
                child: Column(
                  children: [

                    Icon(
                      Icons.favorite,
                      size: 60,
                      color: Colors.deepOrange.shade300,
                    ),

                    const SizedBox(height: 10),

                    const Text(
                      "We Value Your Feedback",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      "Your suggestions help us improve our app experience.",
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // TEXT FIELD
  Widget buildField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required IconData icon,
    int maxLines = 1,
  }) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(
          label,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 8),

        TextFormField(
          controller: controller,
          maxLines: maxLines,

          decoration: InputDecoration(

            hintText: hint,

            prefixIcon: Icon(icon),

            filled: true,
            fillColor: Colors.grey.shade100,

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
              borderSide: BorderSide.none,
            ),
          ),

          validator: (value) {

            if (value == null || value.isEmpty) {
              return "Please enter $label";
            }

            return null;
          },
        ),
      ],
    );
  }
}