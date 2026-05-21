import 'package:cementexpress/Screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';

class AmbujaPage extends StatelessWidget {
  const AmbujaPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> products = [

      {
        "name": "Ambuja OPC 53 Grade",
        "price": "₹415 / bag",
        "image":
        "https://images.unsplash.com/photo-1599707254554-027aeb4deacd",
      },

      {
        "name": "Ambuja PPC Cement",
        "price": "₹390 / bag",
        "image":
        "https://images.unsplash.com/photo-1504307651254-35680f356dfd",
      },

      {
        "name": "Ambuja Cool Walls",
        "price": "₹440 / bag",
        "image":
        "https://images.unsplash.com/photo-1519999482648-25049ddd37b1",
      },

      {
        "name": "Ambuja Plus Roof Special",
        "price": "₹450 / bag",
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
          "Ambuja Cement",
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
                  "https://images.unsplash.com/photo-1504307651254-35680f356dfd",
                ),

                fit: BoxFit.cover,
              ),
            ),

            child: Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),

                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.7),
                    Colors.transparent,
                  ],

                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),

              child: const Align(
                alignment: Alignment.bottomLeft,

                child: Text(
                  "Strong & Trusted Ambuja Cement",

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
            padding: const EdgeInsets.symmetric(horizontal: 16),

            child: TextField(

              decoration: InputDecoration(

                hintText: "Search Ambuja Products",

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

          const SizedBox(height: 15),

          // PRODUCT GRID
          Expanded(
            child: GridView.builder(

              padding: const EdgeInsets.symmetric(horizontal: 16),

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
                    borderRadius: BorderRadius.circular(20),

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
                      Flexible(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
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
                          crossAxisAlignment:
                          CrossAxisAlignment.start,

                          children: [

                            // NAME
                            Text(
                              item['name'],

                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 8),

                            // PRICE
                            Text(
                              item['price'],

                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
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
                                  backgroundColor:
                                  Colors.deepOrange,

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