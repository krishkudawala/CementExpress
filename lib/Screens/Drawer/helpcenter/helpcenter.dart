import 'package:flutter/material.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Help Center"),
        centerTitle: true,
      ),

      body: SingleChildScrollView(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // HEADER
            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.deepOrange.shade50,

                borderRadius:
                BorderRadius.circular(20),
              ),

              child: Row(

                children: [

                  const Icon(
                    Icons.support_agent,
                    size: 60,
                    color: Colors.deepOrange,
                  ),

                  const SizedBox(width: 15),

                  Expanded(

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        const Text(

                          "How can we help you?",

                          style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(

                          "Get quick support for orders, payments and delivery.",

                          style: TextStyle(
                            color:
                            Colors.grey.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // CONTACT OPTIONS
            const Text(

              "Contact Support",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            _buildHelpTile(
              icon: Icons.call,
              title: "Call Us",
              subtitle: "+91 9876543210",
            ),

            _buildHelpTile(
              icon: Icons.email,
              title: "Email Support",
              subtitle: "support@cementexpress.com",
            ),

            _buildHelpTile(
              icon: Icons.chat,
              title: "Live Chat",
              subtitle: "Chat with our executive",
            ),

            const SizedBox(height: 25),

            // FAQ TITLE
            const Text(

              "Frequently Asked Questions",

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            // FAQS
            ExpansionTile(

              leading:
              const Icon(Icons.question_answer),

              title: const Text(
                "How can I place an order?",
              ),

              children: const [

                Padding(

                  padding: EdgeInsets.all(15),

                  child: Text(
                    "You can place an order by selecting products and proceeding to checkout.",
                  ),
                ),
              ],
            ),

            ExpansionTile(

              leading:
              const Icon(Icons.payment),

              title: const Text(
                "Which payment methods are accepted?",
              ),

              children: const [

                Padding(

                  padding: EdgeInsets.all(15),

                  child: Text(
                    "We accept UPI, Debit Card, Credit Card and Cash on Delivery.",
                  ),
                ),
              ],
            ),

            ExpansionTile(

              leading:
              const Icon(Icons.local_shipping),

              title: const Text(
                "How long does delivery take?",
              ),

              children: const [

                Padding(

                  padding: EdgeInsets.all(15),

                  child: Text(
                    "Delivery usually takes 1-2 business days depending on location.",
                  ),
                ),
              ],
            ),

            ExpansionTile(

              leading:
              const Icon(Icons.cancel),

              title: const Text(
                "Can I cancel my order?",
              ),

              children: const [

                Padding(

                  padding: EdgeInsets.all(15),

                  child: Text(
                    "Yes, orders can be cancelled before dispatch.",
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // HELP TILE
  Widget _buildHelpTile({

    required IconData icon,
    required String title,
    required String subtitle,

  }) {

    return Card(

      elevation: 2,

      margin: const EdgeInsets.only(bottom: 12),

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(

        leading: CircleAvatar(

          backgroundColor:
          Colors.deepOrange.shade100,

          child: Icon(
            icon,
            color: Colors.deepOrange,
          ),
        ),

        title: Text(title),

        subtitle: Text(subtitle),

        trailing:
        const Icon(Icons.arrow_forward_ios_rounded),
      ),
    );
  }
}