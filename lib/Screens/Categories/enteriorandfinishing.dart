import 'package:flutter/material.dart';

class InteriorFinishingPage extends StatelessWidget {
  const InteriorFinishingPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> interiors = [

      {
        "title": "Wall Painting",
        "subtitle": "Premium interior wall paints",
        "icon": Icons.format_paint_outlined,
        "color": Colors.deepOrange,
      },

      {
        "title": "False Ceiling",
        "subtitle": "Modern POP ceiling designs",
        "icon": Icons.roofing_outlined,
        "color": Colors.blue,
      },

      {
        "title": "Flooring",
        "subtitle": "Tiles, marble & wooden flooring",
        "icon": Icons.grid_view_outlined,
        "color": Colors.green,
      },

      {
        "title": "Modular Kitchen",
        "subtitle": "Stylish kitchen interiors",
        "icon": Icons.kitchen_outlined,
        "color": Colors.purple,
      },

      {
        "title": "Lighting",
        "subtitle": "Decorative home lighting setup",
        "icon": Icons.lightbulb_outline,
        "color": Colors.amber,
      },

      {
        "title": "Furniture",
        "subtitle": "Modern sofa & furniture designs",
        "icon": Icons.chair_alt_outlined,
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
          "Interior & Finishing",
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),

      body: SingleChildScrollView(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // TOP BANNER
            Container(
              margin: const EdgeInsets.all(16),
              height: 200,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(22),

                image: const DecorationImage(
                  image: NetworkImage(
                    "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
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
                    "Beautiful Interior Solutions",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),

              child: Text(
                "Interior Services",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // GRID
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: interiors.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                childAspectRatio: 0.92,
              ),

              itemBuilder: (context, index) {

                final item = interiors[index];

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
                    padding: const EdgeInsets.all(16),

                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,

                      children: [

                        CircleAvatar(
                          radius: 28,

                          backgroundColor:
                          item['color'].withOpacity(0.15),

                          child: Icon(
                            item['icon'],
                            color: item['color'],
                            size: 30,
                          ),
                        ),

                        Column(
                          crossAxisAlignment:
                          CrossAxisAlignment.start,
                          children: [

                            Text(
                              item['title'],

                              style: const TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            const SizedBox(height: 6),

                            Text(
                              item['subtitle'],

                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontSize: 13,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(
                          width: double.infinity,
                          height: 40,

                          child: ElevatedButton(
                            onPressed: () {},

                            style: ElevatedButton.styleFrom(
                              backgroundColor: item['color'],

                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                            ),

                            child: const Text(
                              "Explore",
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
                );
              },
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}