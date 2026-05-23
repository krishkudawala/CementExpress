import 'package:cementexpress/Screens/payment/payment_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ToolsEquipmentPage extends StatefulWidget {
  const ToolsEquipmentPage({super.key});

  @override
  State<ToolsEquipmentPage> createState() =>
      _ToolsEquipmentPageState();
}

class _ToolsEquipmentPageState
    extends State<ToolsEquipmentPage> {
  final dbreference =FirebaseFirestore.instance.collection('Tools');

  int totalPrice = 0;

  final List<Map<String, dynamic>> tools = [

    {
      "name": "Drilling Machine",
      "price": 2500,
      "icon": Icons.build_circle_outlined,
      "color": Colors.orange,
      "quantity": 0,
    },

    {
      "name": "Hammer",
      "price": 450,
      "icon": Icons.hardware_outlined,
      "color": Colors.red,
      "quantity": 0,
    },

    {
      "name": "Cutter Machine",
      "price": 4200,
      "icon": Icons.construction_outlined,
      "color": Colors.blue,
      "quantity": 0,
    },

    {
      "name": "Safety Helmet",
      "price": 350,
      "icon": Icons.health_and_safety_outlined,
      "color": Colors.green,
      "quantity": 0,
    },

    {
      "name": "Wheel Barrow",
      "price": 3000,
      "icon": Icons.shopping_cart_outlined,
      "color": Colors.purple,
      "quantity": 0,
    },

    {
      "name": "Measuring Tape",
      "price": 250,
      "icon": Icons.straighten_outlined,
      "color": Colors.teal,
      "quantity": 0,
    },
  ];

  void calculateTotal() {

    totalPrice = 0;

    for (var item in tools) {

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

    for (var item in tools) {

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
          "Tools & Equipments",

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

                hintText:
                "Search Tools & Equipments",

                prefixIcon:
                const Icon(Icons.search),

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

              itemCount: tools.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(

                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                childAspectRatio: 0.80,
              ),

              itemBuilder: (context, index) {

                final item = tools[index];

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

                  child: Padding(

                    padding: const EdgeInsets.all(15),

                    child: Column(

                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        // ICON
                        CircleAvatar(

                          radius: 28,

                          backgroundColor:
                          (item['color'] as Color)
                              .withOpacity(0.15),

                          child: Icon(

                            item['icon'] as IconData,

                            size: 30,

                            color:
                            item['color'] as Color,
                          ),
                        ),

                        // NAME + PRICE
                        Column(

                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            Text(

                              item['name'].toString(),

                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight:
                                FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(

                              "₹${item['price']}",

                              style: TextStyle(
                                color:
                                Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

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
                                fontWeight:
                                FontWeight.bold,
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

          onPressed: () async {

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
            for (var item in tools) {

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