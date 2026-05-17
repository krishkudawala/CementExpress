import 'package:flutter/material.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> orders = [

      {
        "product": "UltraTech Cement",
        "date": "12 July 2025",
        "price": "₹4,200",
        "status": "Delivered",
      },

      {
        "product": "ACC Cement",
        "date": "10 July 2025",
        "price": "₹3,650",
        "status": "Processing",
      },

      {
        "product": "Ambuja Cement",
        "date": "08 July 2025",
        "price": "₹3,900",
        "status": "Shipped",
      },

      {
        "product": "JK Cement",
        "date": "05 July 2025",
        "price": "₹4,100",
        "status": "Delivered",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "My Orders",

          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: ListView.builder(

        padding: const EdgeInsets.all(15),

        itemCount: orders.length,

        itemBuilder: (context, index) {

          final order = orders[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 15),

            padding: const EdgeInsets.all(15),

            decoration: BoxDecoration(
              color: Colors.white,

              borderRadius: BorderRadius.circular(18),

              boxShadow: [

                BoxShadow(
                  color: Colors.grey.shade200,
                  blurRadius: 8,
                ),
              ],
            ),

            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                // PRODUCT IMAGE
                Container(
                  height: 80,
                  width: 80,

                  decoration: BoxDecoration(
                    color: Colors.orange.shade50,

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
                        order['product'],

                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        "Order Date: ${order['date']}",

                        style: TextStyle(
                          color: Colors.grey.shade700,
                        ),
                      ),

                      const SizedBox(height: 5),

                      Text(
                        order['price'],

                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),

                        decoration: BoxDecoration(
                          color:
                          order['status'] ==
                              "Delivered"
                              ? Colors.green.shade100
                              : Colors.orange.shade100,

                          borderRadius:
                          BorderRadius.circular(20),
                        ),

                        child: Text(
                          order['status'],

                          style: TextStyle(
                            color:
                            order['status'] ==
                                "Delivered"
                                ? Colors.green
                                : Colors.orange,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}