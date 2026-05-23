import 'package:cementexpress/Screens/payment/payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BuildingMaterialPage extends StatefulWidget {
  const BuildingMaterialPage({super.key});

  @override
  State<BuildingMaterialPage> createState() =>
      _BuildingMaterialPageState();
}

class _BuildingMaterialPageState
    extends State<BuildingMaterialPage> {

  int totalPrice = 0;
  final dbreference =FirebaseFirestore.instance.collection('Buildingmaterials');

  final List<Map<String, dynamic>> materials = [

    {
      "name": "UltraTech Cement",
      "price": 420,
      "image":
      "https://images.unsplash.com/photo-1599707254554-027aeb4deacd?w=500",
      "quantity": 0,
    },

    {
      "name": "ACC Cement",
      "price": 400,
      "image":
      "https://images.unsplash.com/photo-1504307651254-35680f356dfd?w=500",
      "quantity": 0,
    },

    {
      "name": "Bricks",
      "price": 8,
      "image":
      "https://images.unsplash.com/photo-1519999482648-25049ddd37b1?w=500",
      "quantity": 0,
    },

    {
      "name": "Steel Rod",
      "price": 65,
      "image":
      "https://images.unsplash.com/photo-1517048676732-d65bc937f952?w=500",
      "quantity": 0,
    },

    {
      "name": "Sand",
      "price": 3000,
      "image":
      "https://images.unsplash.com/photo-1509395176047-4a66953fd231?w=500",
      "quantity": 0,
    },
  ];

  void calculateTotal() {

    totalPrice = 0;

    for (var item in materials) {

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

    for (var item in materials) {

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
          "Building Materials",

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

          // SEARCH BAR
          Padding(

            padding: const EdgeInsets.all(15),

            child: TextField(

              decoration: InputDecoration(

                hintText: "Search Materials",

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

          // GRID VIEW
          Expanded(

            child: GridView.builder(

              padding:
              const EdgeInsets.symmetric(horizontal: 15),

              itemCount: materials.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                childAspectRatio: 0.72,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),

              itemBuilder: (context, index) {

                final item = materials[index];

                return Container(

                  decoration: BoxDecoration(

                    color: Colors.white,

                    borderRadius:
                    BorderRadius.circular(18),

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
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
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

                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // PRICE
                            Text(

                              "₹${item['price']}",

                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
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

      // CART BUTTON
      floatingActionButton: SizedBox(

        width: 180,
        height: 60,

        child: FloatingActionButton.extended(

          backgroundColor:
          cartCount == 0
              ? Colors.grey
              : Colors.green,

          onPressed: () async{

            if (cartCount == 0) {

              ScaffoldMessenger.of(context)
                  .showSnackBar(

                const SnackBar(
                  content: Text("Cart is Empty"),
                ),
              );

              return;
            }

            // STORE DATA IN FIRESTORE
            for (var item in materials) {

              if ((item['quantity'] ?? 0) > 0) {

                await dbreference.add({

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
                  fontWeight: FontWeight.bold,
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