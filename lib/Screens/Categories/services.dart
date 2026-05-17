import 'package:flutter/material.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {

    List<Map<String, dynamic>> services = [

      {
        "title": "Home Construction",
        "subtitle": "House construction",
        "icon": Icons.home_work_outlined,
        "color": Colors.deepOrange,
      },

      {
        "title": "Interior Design",
        "subtitle": "Modern home interior services",
        "icon": Icons.chair_alt_outlined,
        "color": Colors.purple,
      },

      {
        "title": "Painting Service",
        "subtitle": "Professional wall painting",
        "icon": Icons.format_paint_outlined,
        "color": Colors.blue,
      },

      {
        "title": "Electrical Work",
        "subtitle": "Safe electrical installations",
        "icon": Icons.electrical_services_outlined,
        "color": Colors.amber,
      },

      {
        "title": "Plumbing",
        "subtitle": "Professional plumbing solutions",
        "icon": Icons.plumbing_outlined,
        "color": Colors.teal,
      },

      {
        "title": "Architecture",
        "subtitle": "2D & 3D house planning",
        "icon": Icons.architecture_outlined,
        "color": Colors.green,
      },

      {
        "title": "Flooring",
        "subtitle": "Tiles, marble & wood flooring",
        "icon": Icons.grid_view_outlined,
        "color": Colors.indigo,
      },

      {
        "title": "Furniture",
        "subtitle": "Modern furniture solutions",
        "icon": Icons.weekend_outlined,
        "color": Colors.brown,
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Our Services",
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
              height: 190,

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
                    "Professional Construction Services",
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
                "Available Services",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 15),

            // GRID VIEW
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),

              padding: const EdgeInsets.symmetric(horizontal: 16),

              itemCount: services.length,

              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,

                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                childAspectRatio: 0.90,
              ),

              itemBuilder: (context, index) {

                final item = services[index];

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
                              "Book Now",
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