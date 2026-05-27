import 'package:cementexpress/AdminScreen/AdminHome/adminhome.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminPay extends StatefulWidget {
  const AdminPay({super.key});

  @override
  State<AdminPay> createState() =>
      _AdminPayState();
}

class _AdminPayState
    extends State<AdminPay> {

  final CollectionReference dbref =
  FirebaseFirestore.instance
      .collection('payments');

  List<Map<String, dynamic>> payments = [];

  // FETCH PAYMENT DATA
  void fetchData() {

    dbref.snapshots().listen((snapshot) {

      payments.clear();

      for (var doc in snapshot.docs) {

        payments.add({

          "docId": doc.id,

          ...doc.data()
          as Map<String, dynamic>,
        });
      }

      setState(() {});
    });
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
      const Color(0xffF5F5F5),

      appBar: AppBar(

        title: const Text(
          "All Payments",
        ),

        backgroundColor:
        Colors.orange,

        centerTitle: true,
      ),

      body: payments.isEmpty

          ? const Center(

        child: Text(

          "No Payments Found",

          style: TextStyle(
            fontSize: 18,
          ),
        ),
      )

          : ListView.builder(

        padding:
        const EdgeInsets.all(12),

        itemCount: payments.length,

        itemBuilder: (context, index) {

          var user = payments[index];

          return Card(

            elevation: 4,

            margin:
            const EdgeInsets.only(
              bottom: 15,
            ),

            shape:
            RoundedRectangleBorder(

              borderRadius:
              BorderRadius.circular(18),
            ),

            child: Padding(

              padding:
              const EdgeInsets.all(15),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  // TOP ROW
                  Row(

                    mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,

                    children: [

                      Row(

                        children: [

                          CircleAvatar(

                            radius: 25,

                            backgroundColor:

                            user['status']
                                ?.toString() ==

                                "Success"

                                ? Colors.green

                                : Colors.red,

                            child: const Icon(

                              Icons.currency_rupee,

                              color:
                              Colors.white,
                            ),
                          ),

                          const SizedBox(
                              width: 12),

                          Column(

                            crossAxisAlignment:
                            CrossAxisAlignment
                                .start,

                            children: [

                              Text(

                                user['email']
                                    ?.toString() ??

                                    "No Email",

                                style:
                                const TextStyle(

                                  fontSize: 16,

                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),

                              const SizedBox(
                                  height: 4),

                              Text(

                                user['status']
                                    ?.toString() ??

                                    "No Status",

                                style:
                                TextStyle(

                                  color:

                                  user['status']
                                      ?.toString() ==

                                      "Success"

                                      ? Colors.green

                                      : Colors.red,

                                  fontWeight:
                                  FontWeight
                                      .bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      Text(

                        "₹${user['amount']?.toString() ?? ""}",

                        style:
                        const TextStyle(

                          fontSize: 22,

                          fontWeight:
                          FontWeight.bold,

                          color:
                          Colors.orange,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // PAYMENT ID
                  Row(


                  ),

                  const SizedBox(height: 10),

                  // ORDER ID
                  Row(


                  ),

                  const SizedBox(height: 10),

                  // USER ID
                  Row(

                    children: [

                      const Icon(
                        Icons.person,
                        size: 18,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 8),

                      Expanded(

                        child: Text(

                          "User ID : "
                              "${user['uid']?.toString() ?? "N/A"}",

                          style:
                          const TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 15),







                ],
              ),
            ),
          );
        },
      ),
    );
  }
}