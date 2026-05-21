import 'package:cementexpress/Screens/bottomnavigation/profile.dart';
import 'package:cementexpress/Screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';

class BuildingMaterialPage extends StatelessWidget {
  const BuildingMaterialPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> materials = [

      {
        "name": "UltraTech Cement",
        "price": "₹420 / bag",
        "image":
        "https://images.unsplash.com/photo-1599707254554-027aeb4deacd",
      },

      {
        "name": "ACC Cement",
        "price": "₹400 / bag",
        "image":
        "https://images.unsplash.com/photo-1504307651254-35680f356dfd",
      },

      {
        "name": "Bricks",
        "price": "₹8 / piece",
        "image":
        "https://images.unsplash.com/photo-1519999482648-25049ddd37b1",
      },

      {
        "name": "Steel Rod",
        "price": "₹65 / kg",
        "image":
        "https://images.unsplash.com/photo-1517048676732-d65bc937f952",
      },

      {
        "name": "Sand",
        "price": "₹3000 / ton",
        "image":
        "https://images.unsplash.com/photo-1509395176047-4a66953fd231",
      },


    ];

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
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // GRID VIEW
          Expanded(
            child: GridView.builder(

              padding: const EdgeInsets.symmetric(horizontal: 15),

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
                    borderRadius: BorderRadius.circular(18),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 6,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // IMAGE
                      Flexible(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(18),
                            topRight: Radius.circular(18),
                          ),

                          child: Image.network(
                            item['image'],

                            height: 130,
                            width: double.infinity,

                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(12),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            // NAME
                            Text(
                              item['name'],

                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // PRICE
                            Text(
                              item['price'],

                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.grey.shade700,
                              ),
                            ),

                            const SizedBox(height: 15),

                            // BUTTON
                            SizedBox(
                              width: double.infinity,
                              height: 42,

                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                      context, MaterialPageRoute(
                                      builder: (context) => PaymentPage()
                                  ));
                                },

                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.deepOrange,

                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                    BorderRadius.circular(12),
                                  ),
                                ),

                                child: const Text(
                                  "Add to Cart",
                                  style: TextStyle(
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
              },
            ),
          ),
        ],
      ),
    );
  }
}