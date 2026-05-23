import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() =>
      _OrdersPageState();
}

class _OrdersPageState
    extends State<OrdersPage> {

  // COLLECTIONS
  final db =
  FirebaseFirestore.instance
      .collection("orders");

  final dbbm =
  FirebaseFirestore.instance
      .collection("Buildingmaterials");

  final dbiq =
  FirebaseFirestore.instance
      .collection("Tools");

  // LIST
  List<Map<String, dynamic>> users = [];

  // FETCH DATA
  void fetchData() async {

    users.clear();

    // ORDERS
    final data =
    await db.get();

    for (var doc in data.docs) {

      users.add({

        "id": doc.id,

        "collection": "orders",

        ...doc.data(),
      });
    }

    // BUILDING MATERIALS
    final databm =
    await dbbm.get();

    for (var doc in databm.docs) {

      users.add({

        "id": doc.id,

        "collection":
        "Buildingmaterials",

        ...doc.data(),
      });
    }

    // TOOLS
    final datatools =
    await dbiq.get();

    for (var doc in datatools.docs) {

      users.add({

        "id": doc.id,

        "collection":
        "Tools",

        ...doc.data(),
      });
    }

    setState(() {});
  }

  @override
  void initState() {

    super.initState();

    fetchData();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xfff5f7fa),

      appBar: AppBar(

        elevation: 0,

        centerTitle: true,

        flexibleSpace: Container(

          decoration: const BoxDecoration(

            gradient: LinearGradient(

              colors: [
                Color(0xff11998e),
                Color(0xff38ef7d),
              ],
            ),
          ),
        ),

        title: const Text(

          "My Orders",

          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: users.isEmpty

          ? Center(

        child: Column(

          mainAxisAlignment:
          MainAxisAlignment.center,

          children: [

            Icon(

              Icons.shopping_bag_outlined,

              size: 100,

              color: Colors.grey.shade400,
            ),

            const SizedBox(height: 20),

            Text(

              "No Orders Found",

              style: TextStyle(

                fontSize: 22,

                fontWeight:
                FontWeight.bold,

                color:
                Colors.grey.shade700,
              ),
            ),
          ],
        ),
      )

          : ListView.builder(

        padding:
        const EdgeInsets.all(15),

        itemCount: users.length,

        itemBuilder:
            (context, index) {

          final user =
          users[index];

          return Container(

            margin:
            const EdgeInsets.only(
              bottom: 18,
            ),

            decoration: BoxDecoration(

              borderRadius:
              BorderRadius.circular(
                25,
              ),

              color: Colors.white,

              boxShadow: [

                BoxShadow(

                  color:
                  Colors.grey.shade300,

                  blurRadius: 10,

                  offset:
                  const Offset(0, 5),
                ),
              ],
            ),

            child: Padding(

              padding:
              const EdgeInsets.all(18),

              child: Row(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  // PRODUCT IMAGE ICON
                  Container(

                    height: 80,
                    width: 80,

                    decoration: BoxDecoration(

                      gradient:
                      const LinearGradient(

                        colors: [
                          Color(
                            0xff11998e,
                          ),
                          Color(
                            0xff38ef7d,
                          ),
                        ],
                      ),

                      borderRadius:
                      BorderRadius.circular(
                        20,
                      ),
                    ),

                    child: const Icon(

                      Icons.inventory_2,

                      color: Colors.white,

                      size: 40,
                    ),
                  ),

                  const SizedBox(width: 18),

                  // DETAILS
                  Expanded(

                    child: Column(

                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,

                      children: [

                        // PRODUCT
                        Text(

                          user['product']
                              ?.toString() ??
                              "",

                          style:
                          const TextStyle(

                            fontSize: 20,

                            fontWeight:
                            FontWeight.bold,
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // BRAND
                        Row(

                          children: [

                            const Icon(
                              Icons.business,
                              size: 18,
                              color:
                              Colors.blue,
                            ),

                            const SizedBox(
                              width: 5,
                            ),

                            Text(

                              user['brand']
                                  ?.toString() ??
                                  "",

                              style:
                              TextStyle(

                                color: Colors
                                    .grey
                                    .shade700,

                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 6,
                        ),

                        // PRICE
                        Row(

                          children: [

                            const Icon(
                              Icons.currency_rupee,
                              size: 18,
                              color:
                              Colors.green,
                            ),

                            Text(

                              "${user['price'] ?? 0}",

                              style:
                              TextStyle(

                                color: Colors
                                    .grey
                                    .shade700,

                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 6,
                        ),

                        // QUANTITY
                        Row(

                          children: [

                            const Icon(
                              Icons.shopping_cart,
                              size: 18,
                              color:
                              Colors.orange,
                            ),

                            const SizedBox(
                              width: 5,
                            ),

                            Text(

                              "Qty: ${user['quantity'] ?? 0}",

                              style:
                              TextStyle(

                                color: Colors
                                    .grey
                                    .shade700,

                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        // TOTAL
                        Text(

                          "Total ₹${user['total'] ?? 0}",

                          style:
                          const TextStyle(

                            color:
                            Colors.green,

                            fontWeight:
                            FontWeight.bold,

                            fontSize: 18,
                          ),
                        ),

                        const SizedBox(
                          height: 10,
                        ),

                        // STATUS
                        Container(

                          padding:
                          const EdgeInsets.symmetric(

                            horizontal: 14,

                            vertical: 8,
                          ),

                          decoration:
                          BoxDecoration(

                            color:
                            Colors.orange
                                .shade100,

                            borderRadius:
                            BorderRadius.circular(
                              30,
                            ),
                          ),

                          child: Text(

                            user['status']
                                ?.toString() ??
                                "",

                            style:
                            TextStyle(

                              color:
                              Colors.orange
                                  .shade900,

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
            ),
          );
        },
      ),
    );
  }
}