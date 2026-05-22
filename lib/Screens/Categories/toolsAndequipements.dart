import 'package:cementexpress/Screens/payment/payment_screen.dart';
import 'package:flutter/material.dart';

class ToolsEquipmentPage extends StatelessWidget {
  const ToolsEquipmentPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> tools = [

      {
        "name": "Drilling Machine",
        "price": "₹2,500",
        "icon": Icons.build_circle_outlined,
        "color": Colors.orange,
      },

      {
        "name": "Hammer",
        "price": "₹450",
        "icon": Icons.hardware_outlined,
        "color": Colors.red,
      },

      {
        "name": "Cutter Machine",
        "price": "₹4,200",
        "icon": Icons.construction_outlined,
        "color": Colors.blue,
      },

      {
        "name": "Safety Helmet",
        "price": "₹350",
        "icon": Icons.health_and_safety_outlined,
        "color": Colors.green,
      },

      {
        "name": "Wheel Barrow",
        "price": "₹3,000",
        "icon": Icons.shopping_cart_outlined,
        "color": Colors.purple,
      },

      {
        "name": "Measuring Tape",
        "price": "₹250",
        "icon": Icons.straighten_outlined,
        "color": Colors.teal,
      },
    ];

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

                hintText: "Search Tools & Equipments",

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
                    borderRadius: BorderRadius.circular(20),

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
                          item['color'].withOpacity(0.15),

                          child: Icon(
                            item['icon'],
                            size: 30,
                            color: item['color'],
                          ),
                        ),

                        // NAME + PRICE
                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              item['name'],

                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              item['price'],

                              style: TextStyle(
                                color: Colors.grey.shade700,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),

                        // BUTTON
                        Flexible(
                          child: SizedBox(
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
                                backgroundColor: item['color'],

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
    );
  }
}