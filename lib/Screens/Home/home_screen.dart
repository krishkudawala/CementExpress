import 'package:cementexpress/Screens/Categories/buildingmaterials.dart';
import 'package:cementexpress/Screens/Categories/enteriorandfinishing.dart';
import 'package:cementexpress/Screens/Categories/services.dart';
import 'package:cementexpress/Screens/Categories/toolsAndequipements.dart';

import 'package:cementexpress/Screens/Drawer/Setting.dart';
import 'package:cementexpress/Screens/Drawer/contactus.dart';
import 'package:cementexpress/Screens/Drawer/feedback.dart';

import 'package:cementexpress/Screens/Login/login_page.dart';

import 'package:cementexpress/Screens/Topbrands/acc.dart';
import 'package:cementexpress/Screens/Topbrands/ambuja.dart';
import 'package:cementexpress/Screens/Topbrands/jandk.dart';
import 'package:cementexpress/Screens/Topbrands/shree.dart';
import 'package:cementexpress/Screens/Topbrands/ultratech.dart';

import 'package:cementexpress/Screens/bottomnavigation/card.dart';
import 'package:cementexpress/Screens/bottomnavigation/orders.dart';
import 'package:cementexpress/Screens/bottomnavigation/profile.dart';

import 'package:cementexpress/Screens/widgets/items_category.dart';

import 'package:flutter/material.dart';

// ================= HOME SCREEN =================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int currentIndex = 0;

  int _selectedIndex = 0;

  List<String> banners = [

    "assets/images/building.jpg",
    "assets/images/halment.jpg",
    "assets/images/persion.jpg",
    "assets/images/truckut.jpg",
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: Colors.white,

      // ================= DRAWER =================
      endDrawer: Drawer(

        child: ListView(
          children: [

            DrawerHeader(

              decoration: BoxDecoration(
                color: Colors.orange.shade100,
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [

                  CircleAvatar(
                    radius: 35,

                    backgroundImage:
                    AssetImage('assets/icons/logo.png'),
                  ),

                  SizedBox(height: 10),

                  Text(
                    "Cement Express",

                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // HOME
            ListTile(

              leading: Icon(Icons.home),

              title: Text('Home'),

              onTap: () {
                Navigator.pop(context);
              },
            ),

            // CONTACT
            ListTile(

              leading: Icon(Icons.call),

              title: Text('Contact Us'),

              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const ContactUsPage(),
                  ),
                );
              },
            ),

            // FEEDBACK
            ListTile(

              leading: Icon(Icons.feedback),

              title: Text('Feedback'),

              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const FeedbackPage(),
                  ),
                );
              },
            ),

            // SETTINGS
            ListTile(

              leading: Icon(Icons.settings),

              title: Text('Settings'),

              onTap: () {

                Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const SettingsPage(),
                  ),
                );
              },
            ),

            // LOGOUT
            ListTile(

              leading: Icon(
                Icons.logout,
                color: Colors.red,
              ),

              title: Text(
                'Logout',

                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              onTap: () {

                Navigator.pushAndRemoveUntil(
                  context,

                  MaterialPageRoute(
                    builder: (context) =>
                    const LoginPage(),
                  ),

                      (route) => false,
                );
              },
            ),
          ],
        ),
      ),

      // ================= APPBAR =================
      appBar: AppBar(

        backgroundColor: Colors.white,
        elevation: 0,

        iconTheme:
        const IconThemeData(color: Colors.black),

        title: Row(
          children: [

            Image.asset(
              'assets/icons/logo.png',
              height: 35,
            ),

            const SizedBox(width: 10),

            const Text(
              'Cement Express',

              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),

      // ================= BODY =================
      body: ListView(
        children: [

          // SEARCH BAR
          Card(

            color: Colors.white,
            elevation: 2,

            margin: const EdgeInsets.all(15),

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),

            child: TextField(

              decoration: InputDecoration(

                hintText:
                'Search Cement, Paint, Tools...',

                prefixIcon: const Icon(Icons.search),

                suffixIcon:
                const Icon(Icons.filter_list),

                border: InputBorder.none,

                contentPadding:
                const EdgeInsets.all(15),
              ),
            ),
          ),

          // ================= BANNER =================
          Stack(
            alignment: Alignment.bottomCenter,

            children: [

              SizedBox(
                height: 250,

                child: PageView.builder(

                  itemCount: banners.length,

                  onPageChanged: (index) {

                    setState(() {
                      currentIndex = index;
                    });
                  },

                  itemBuilder: (context, index) {

                    return Padding(
                      padding:
                      const EdgeInsets.symmetric(
                        horizontal: 0,
                      ),

                      child: ClipRRect(

                        borderRadius:
                        BorderRadius.circular(5),

                        child: Image.asset(
                          banners[index],

                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    );
                  },
                ),
              ),

              Positioned(
                bottom: 15,

                child: Row(

                  children: List.generate(
                    banners.length,

                        (index) {

                      return AnimatedContainer(

                        duration:
                        const Duration(milliseconds: 300),

                        margin:
                        const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),

                        width:
                        currentIndex == index
                            ? 20
                            : 8,

                        height: 8,

                        decoration: BoxDecoration(

                          color:
                          currentIndex == index
                              ? Colors.white
                              : Colors.white54,

                          borderRadius:
                          BorderRadius.circular(20),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 25),

          // ================= CATEGORY TITLE =================
          Padding(
            padding:
            const EdgeInsets.symmetric(
              horizontal: 15,
            ),

            child: Row(
              mainAxisAlignment:
              MainAxisAlignment.spaceBetween,

              children: const [

                Text(
                  "Categories",

                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                Text(
                  "Show All",

                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 15),

          // ================= CATEGORY LIST =================
          SizedBox(
            height: 110,

            child: ListView(
              scrollDirection: Axis.horizontal,

              children: [

                const SizedBox(width: 10),

                GestureDetector(

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                        const BuildingMaterialPage(),
                      ),
                    );
                  },

                  child: const ItemsCategory(
                    title: 'Building Materials',
                    image: 'construction.png',
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(width: 15),

                GestureDetector(

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                        const ToolsEquipmentPage(),
                      ),
                    );
                  },

                  child: const ItemsCategory(
                    title: 'Tools & Equipment',
                    image: 'support.png',
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(width: 15),

                GestureDetector(

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                        const InteriorFinishingPage(),
                      ),
                    );
                  },

                  child: const ItemsCategory(
                    title: 'Interior & Finishing',
                    image: 'plan.png',
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(width: 15),

                GestureDetector(

                  onTap: () {

                    Navigator.push(
                      context,

                      MaterialPageRoute(
                        builder: (context) =>
                        const ServicesPage(),
                      ),
                    );
                  },

                  child: const ItemsCategory(
                    title: 'Services',
                    image: 'hourssupport.png',
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 25),

          // ================= TOP BRANDS =================
          const Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 15),

            child: Text(
              "Top Brands",

              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 15),

          SizedBox(
            height: 220,

            child: ListView(
              scrollDirection: Axis.horizontal,

              padding:
              const EdgeInsets.symmetric(
                horizontal: 15,
              ),

              children: [

                _buildBrandCard(
                  "UltraTech Cement",
                  "₹380",
                  "4.8",
                  "assets/images/ultratech.jpg",
                ),

                const SizedBox(width: 15),

                _buildBrandCard(
                  "ACC Cement",
                  "₹365",
                  "4.6",
                  "assets/images/acc.jpg",
                ),

                const SizedBox(width: 15),

                _buildBrandCard(
                  "Ambuja Cement",
                  "₹370",
                  "4.7",
                  "assets/images/ambuja.jpg",
                ),

                const SizedBox(width: 15),

                _buildBrandCard(
                  "Shree Cement",
                  "₹375",
                  "4.7",
                  "assets/images/shree.jpg",
                ),

                const SizedBox(width: 15),

                _buildBrandCard(
                  "J&K Cement",
                  "₹390",
                  "4.6",
                  "assets/images/jk.jpg",
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
        ],
      ),

      // ================= BOTTOM NAVIGATION =================
      bottomNavigationBar: BottomNavigationBar(

        currentIndex: _selectedIndex,

        onTap: (index) {

          setState(() {
            _selectedIndex = index;
          });

          // ORDERS
          if (index == 1) {

            Navigator.push(
              context,

              MaterialPageRoute(
                builder: (context) =>
                const OrdersPage(),
              ),
            );
          }

          // CART
          else if (index == 2) {

            Navigator.push(
              context,

              MaterialPageRoute(
                builder: (context) =>
                const CardPage(),
              ),
            );
          }

          // PROFILE
          else if (index == 3) {

            Navigator.push(
              context,

              MaterialPageRoute(
                builder: (context) =>
                const ProfilePage(),
              ),
            );
          }

        },

        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.grey,

        showUnselectedLabels: true,

        type: BottomNavigationBarType.fixed,

        backgroundColor: Colors.white,

        items: const [

          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: "Orders",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // ================= BRAND CARD =================
  Widget _buildBrandCard(
      String name,
      String price,
      String rating,
      String image,
      ) {

    return GestureDetector(

      onTap: () {

        if (name == "UltraTech Cement") {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  UltraTechPage(),
            ),
          );
        }

        else if (name == "ACC Cement") {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  ACCPage(),
            ),
          );
        }

        else if (name == "Ambuja Cement") {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  AmbujaPage(),
            ),
          );
        }

        else if (name == "Shree Cement") {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  ShreeCementPage(),
            ),
          );
        }

        else if (name == "J&K Cement") {

          Navigator.push(
            context,

            MaterialPageRoute(
              builder: (context) =>
                  JKCementPage(),
            ),
          );
        }

      },

      child: Container(
        width: 180,

        decoration: BoxDecoration(
          color: Colors.white,

          borderRadius:
          BorderRadius.circular(16),

          boxShadow: [

            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: [

            Container(
              height: 110,
              width: double.infinity,

              decoration: BoxDecoration(
                color: Colors.grey.shade100,

                borderRadius:
                const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
              ),

              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(12),

              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: [

                  Text(
                    name,

                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 5),

                  Row(
                    children: [

                      const Icon(
                        Icons.star,
                        color: Colors.green,
                        size: 15,
                      ),

                      const SizedBox(width: 4),

                      Text(
                        rating,

                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,

                    children: [

                      Text(
                        "$price/bag",

                        style: const TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      Container(
                        padding:
                        const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),

                        decoration: BoxDecoration(
                          color:
                          Colors.deepOrange.shade50,

                          borderRadius:
                          BorderRadius.circular(8),

                          border: Border.all(
                            color: Colors.deepOrange,
                          ),
                        ),

                        child: const Text(
                          "ADD",

                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  }
}