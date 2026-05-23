import 'package:cementexpress/Screens/payment/payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class JKCementPage extends StatefulWidget {
  const JKCementPage({super.key});

  @override
  State<JKCementPage> createState() => _JKCementPageState();
}

class _JKCementPageState extends State<JKCementPage> {

  int totalPrice = 0;
  final dbreference =FirebaseFirestore.instance.collection('orders');


  final List<Map<String, dynamic>> products = [

    {
      "name": "JK Super Cement",
      "price": 410,
      "image":
      "https://images.unsplash.com/photo-1599707254554-027aeb4deacd?w=500",
      "quantity": 0,
    },

    {
      "name": "JK WallMaxX",
      "price": 395,
      "image":
      "https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=500",
      "quantity": 0,
    },

    {
      "name": "JK PPC Cement",
      "price": 405,
      "image":
      "https://images.unsplash.com/photo-1519999482648-25049ddd37b1?w=500",
      "quantity": 0,
    },

    {
      "name": "JK White Cement",
      "price": 520,
      "image":
      "https://images.unsplash.com/photo-1509395176047-4a66953fd231?w=500",
      "quantity": 0,
    },
  ];

  void calculateTotal() {

    totalPrice = 0;

    for (var item in products) {

      int price =
          int.tryParse(item['price'].toString()) ?? 0;

      int quantity =
          int.tryParse(item['quantity'].toString()) ?? 0;

      totalPrice += price * quantity;
    }
  }

  @override
  Widget build(BuildContext context) {

    int cartCount = 0;

    for (var item in products) {

      cartCount +=
          int.tryParse(
            item['quantity'].toString(),
          ) ?? 0;
    }

    return Scaffold(

      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "JK Cement",

          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: Column(
        children: [

          // TOP BANNER
          Container(

            margin: const EdgeInsets.all(16),
            height: 180,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(22),

              image: const DecorationImage(

                image: NetworkImage(
                  "https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=500",
                ),

                fit: BoxFit.cover,
              ),
            ),

            child: Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(22),

                gradient: const LinearGradient(

                  colors: [
                    Colors.black54,
                    Colors.transparent,
                  ],

                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),

              child: const Align(

                alignment: Alignment.bottomLeft,

                child: Text(
                  "Premium JK Cement Products",

                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          // SEARCH BAR
          Padding(

            padding:
            const EdgeInsets.symmetric(horizontal: 16),

            child: TextField(

              decoration: InputDecoration(

                hintText: "Search JK Cement Products",

                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: Colors.white,

                border: OutlineInputBorder(

                  borderRadius:
                  BorderRadius.circular(14),

                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 15),

          // TOTAL PRICE
          Padding(

            padding:
            const EdgeInsets.symmetric(horizontal: 16),

            child: Container(

              padding: const EdgeInsets.all(14),

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius:
                BorderRadius.circular(14),

                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                  ),
                ],
              ),

              child: Row(

                mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

                children: [

                  const Text(

                    "Total Amount",

                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(

                    "₹$totalPrice",

                    style: const TextStyle(
                      color: Colors.green,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // PRODUCT GRID
          Expanded(

            child: GridView.builder(

              padding:
              const EdgeInsets.symmetric(horizontal: 16),

              itemCount: products.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                childAspectRatio: 0.72,
              ),

              itemBuilder: (context, index) {

                final item = products[index];

                return Container(

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(20),

                    boxShadow: [

                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: Column(

                    crossAxisAlignment:
                    CrossAxisAlignment.start,

                    children: [

                      // IMAGE
                      Expanded(

                        child: ClipRRect(

                          borderRadius:
                          const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),

                          child: Image.network(

                            item['image'].toString(),

                            width: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(

                        padding: const EdgeInsets.all(12),

                        child: Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            // NAME
                            Text(

                              item['name'].toString(),

                              maxLines: 2,

                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // PRICE
                            Text(

                              "₹${item['price']} / bag",

                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 14,
                              ),
                            ),

                            const SizedBox(height: 12),

                            // QUANTITY BUTTONS
                            Row(

                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,

                              children: [

                                // REMOVE
                                CircleAvatar(

                                  radius: 16,

                                  backgroundColor:
                                  Colors.red.shade100,

                                  child: IconButton(

                                    padding: EdgeInsets.zero,

                                    icon: const Icon(
                                      Icons.remove,
                                      size: 18,
                                      color: Colors.red,
                                    ),

                                    onPressed: () {

                                      if ((item['quantity'] ?? 0) > 0) {

                                        setState(() {

                                          item['quantity'] =
                                              (item['quantity'] ?? 0) - 1;

                                          calculateTotal();
                                        });
                                      }
                                    },
                                  ),
                                ),

                                // QUANTITY
                                Text(

                                  (item['quantity'] ?? 0)
                                      .toString(),

                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),

                                // ADD
                                CircleAvatar(

                                  radius: 16,

                                  backgroundColor:
                                  Colors.green.shade100,

                                  child: IconButton(

                                    padding: EdgeInsets.zero,

                                    icon: const Icon(
                                      Icons.add,
                                      size: 18,
                                      color: Colors.green,
                                    ),

                                    onPressed: () {

                                      setState(() {

                                        item['quantity'] =
                                            (item['quantity'] ?? 0) + 1;

                                        calculateTotal();
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: SizedBox(

          width: 180,
          height: 60,

          child: FloatingActionButton.extended(

            backgroundColor:
            Colors.green,

            onPressed: () async {

              if (cartCount == 0) {

                ScaffoldMessenger.of(context)
                    .showSnackBar(

                  const SnackBar(
                    content:
                    Text("Cart is Empty"),
                  ),
                );

                return;
              }

              // STORE DATA IN FIRESTORE
              for (var item in products) {

                if ((item['quantity'] ?? 0) > 0) {

                  await dbreference.add({

                    'brand':
                    'J AND K',

                    'product':
                    item['name'],

                    'price':
                    item['price'],

                    'quantity':
                    item['quantity'],

                    'total':
                    item['price'] *
                        item['quantity'],

                    'status':
                    'Processing',

                    'date':
                    DateTime.now()
                        .toString(),
                  });
                }
              }

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content:
                  Text(
                    "Order Placed Successfully",
                  ),
                ),
              );

              Navigator.push(

                context,

                MaterialPageRoute(
                  builder: (context) =>
                  const PaymentPage(),
                ),
              );
            },

            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),

            label: Column(

              mainAxisAlignment:
              MainAxisAlignment.center,

              children: [

                Text(

                  "Cart ($cartCount)",

                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                Text(

                  "₹$totalPrice",

                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}