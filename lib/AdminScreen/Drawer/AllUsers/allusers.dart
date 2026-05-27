import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Allusers extends StatefulWidget {
  const Allusers({super.key});

  @override
  State<Allusers> createState() =>
      _AllusersState();
}

class _AllusersState
    extends State<Allusers> {

  final dbref =
  FirebaseFirestore.instance
      .collection('users');

  List<Map<String, dynamic>> users = [];

  // FETCH USERS
  void fetchData() {

    dbref.snapshots().listen((snapshot) {

      users.clear();

      for (var doc in snapshot.docs) {

        users.add({

          "docId": doc.id,

          ...doc.data(),
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

        backgroundColor:
        Colors.orange,

        centerTitle: true,

        title: const Text(

          'All Users',

          style: TextStyle(
            color: Colors.white,
            fontWeight:
            FontWeight.bold,
          ),
        ),
      ),

      body: users.isEmpty

          ? const Center(

        child: Text(

          "No Users Found",

          style: TextStyle(
            fontSize: 18,
          ),
        ),
      )

          : ListView.builder(

        padding:
        const EdgeInsets.all(12),

        itemCount: users.length,

        itemBuilder: (context, index) {

          var user = users[index];

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

            child: ListTile(

              contentPadding:
              const EdgeInsets.all(15),

              leading: CircleAvatar(

                radius: 28,

                backgroundColor:
                Colors.orange,

                child: Text(

                  user['name']
                      ?.toString()
                      .substring(0, 1)
                      .toUpperCase() ??

                      "U",

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize: 22,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ),

              title: Text(

                user['name']
                    ?.toString() ??

                    "No Name",

                style: const TextStyle(

                  fontWeight:
                  FontWeight.bold,

                  fontSize: 18,
                ),
              ),

              subtitle: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  const SizedBox(height: 8),

                  Row(

                    children: [

                      const Icon(
                        Icons.email,
                        size: 18,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 8),

                      Expanded(

                        child: Text(

                          user['email']
                              ?.toString() ??

                              "No Email",
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(

                    children: [

                      const Icon(
                        Icons.phone,
                        size: 18,
                        color: Colors.grey,
                      ),

                      const SizedBox(width: 8),

                      Text(

                        user['phone']
                            ?.toString() ??

                            "No Phone",
                      ),
                    ],
                  ),
                ],
              ),

              trailing: PopupMenuButton(

                itemBuilder: (context) => [

                  const PopupMenuItem(

                    value: "delete",

                    child: Row(

                      children: [

                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),

                        SizedBox(width: 10),

                        Text("Delete"),
                      ],
                    ),
                  ),
                ],

                onSelected: (value) async {

                  if(value == "delete"){

                    await dbref
                        .doc(user['docId'])
                        .delete();

                    ScaffoldMessenger.of(context)
                        .showSnackBar(

                      const SnackBar(

                        content: Text(
                          "User Deleted",
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}