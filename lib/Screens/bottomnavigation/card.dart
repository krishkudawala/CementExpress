import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> cartItems = [

      {
        "name": "UltraTech Cement",
        "price": "₹420",
        "quantity": "2 Bags",
      },

      {
        "name": "ACC Cement",
        "price": "₹390",
        "quantity": "1 Bag",
      },

      {
        "name": "Ambuja Cement",
        "price": "₹410",
        "quantity": "3 Bags",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "My Cart",

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Column(
        children: [

          // ================= CART ITEMS =================
          Expanded(
            child: ListView.builder(

              padding: const EdgeInsets.all(15),

              itemCount: cartItems.length,

              itemBuilder: (context, index) {

                final item = cartItems[index];

                return Container(
                  margin:
                  const EdgeInsets.only(bottom: 15),

                  padding: const EdgeInsets.all(15),

                  decoration: BoxDecoration(
                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(18),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 8,
                      ),
                    ],
                  ),

                  child: Row(
                    children: [

                      // IMAGE
                      Container(
                        height: 80,
                        width: 80,

                        decoration: BoxDecoration(
                          color:
                          Colors.orange.shade50,

                          borderRadius:
                          BorderRadius.circular(15),
                        ),

                        child: const Icon(
                          Icons.inventory_2,
                          size: 40,
                          color: Colors.deepOrange,
                        ),
                      ),

                      const SizedBox(width: 15),

                      // DETAILS
                      Expanded(
                        child: Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(
                              item['name'],

                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              item['quantity'],

                              style: TextStyle(
                                color:
                                Colors.grey.shade700,
                              ),
                            ),

                            const SizedBox(height: 8),

                            Text(
                              item['price'],

                              style: const TextStyle(
                                color:
                                Colors.deepOrange,
                                fontWeight:
                                FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // DELETE BUTTON
                      IconButton(
                        onPressed: () {},

                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // ================= TOTAL SECTION =================
          Container(
            padding: const EdgeInsets.all(20),

            decoration: const BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),

            child: Column(
              children: [

                Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,

                  children: const [

                    Text(
                      "Total Amount",

                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "₹1,220",

                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(

                    onPressed: () {},

                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                      Colors.deepOrange,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(15),
                      ),
                    ),

                    child: const Text(
                      "Proceed to Checkout",

                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}