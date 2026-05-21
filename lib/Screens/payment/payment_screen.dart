import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() =>
      _PaymentPageState();
}

class _PaymentPageState
    extends State<PaymentPage> {

  String selectedPayment =
      "Cash on Delivery";

  bool loading = false;

  // PLACE ORDER
  Future<void> placeOrder() async {

    setState(() {
      loading = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    setState(() {
      loading = false;
    });

    ScaffoldMessenger.of(context)
        .showSnackBar(

      SnackBar(

        content: Text(
          "Order Placed via $selectedPayment",
        ),

        backgroundColor: Colors.green,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Payment"),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            // TOTAL
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
                    Icons.shopping_cart,
                    size: 40,
                    color: Colors.deepOrange,
                  ),

                  const SizedBox(width: 15),

                  Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: const [

                      Text(

                        "Total Amount",

                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(

                        "₹0",

                        style: TextStyle(

                          fontSize: 28,

                          fontWeight:
                          FontWeight.bold,

                          color:
                          Colors.deepOrange,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // TITLE
            const Text(

              "Select Payment Method",

              style: TextStyle(

                fontSize: 20,

                fontWeight:
                FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            // COD
            _buildPaymentTile(
              title: "Cash on Delivery",
              icon: Icons.money,
            ),

            // UPI
            _buildPaymentTile(
              title: "UPI Payment",
              icon: Icons.qr_code,
            ),

            // CARD
            _buildPaymentTile(
              title: "Debit / Credit Card",
              icon: Icons.credit_card,
            ),

            // NET BANKING
            _buildPaymentTile(
              title: "Net Banking",
              icon: Icons.account_balance,
            ),

            const Spacer(),

            // PAY BUTTON
            SizedBox(

              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed:
                loading ? null : placeOrder,

                style:
                ElevatedButton.styleFrom(

                  backgroundColor:
                  Colors.deepOrange,

                  foregroundColor:
                  Colors.white,

                  shape:
                  RoundedRectangleBorder(

                    borderRadius:
                    BorderRadius.circular(15),
                  ),
                ),

                child: loading

                    ? const CircularProgressIndicator(
                  color: Colors.white,
                )

                    : const Text(

                  "Place Order",

                  style: TextStyle(

                    fontSize: 18,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // PAYMENT TILE
  Widget _buildPaymentTile({

    required String title,
    required IconData icon,

  }) {

    return Card(

      elevation: 2,

      margin:
      const EdgeInsets.only(bottom: 15),

      shape: RoundedRectangleBorder(
        borderRadius:
        BorderRadius.circular(15),
      ),

      child: RadioListTile(

        value: title,

        groupValue: selectedPayment,

        onChanged: (value) {

          setState(() {

            selectedPayment =
                value.toString();
          });
        },

        title: Text(title),

        secondary: Icon(
          icon,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}