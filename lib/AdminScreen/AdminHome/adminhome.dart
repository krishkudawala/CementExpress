import 'package:cementexpress/AdminScreen/Drawer/AllUsers/allusers.dart';
import 'package:cementexpress/AdminScreen/Drawer/Orders/orders.dart';
import 'package:cementexpress/AdminScreen/Drawer/payment/payment.dart';
import 'package:cementexpress/Screens/Login/login_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() =>
      _AdminHomePageState();
}

class _AdminHomePageState
    extends State<AdminHomePage> {

  // DASHBOARD CARD
  Widget dashboardCard({

    required String title,

    required String value,

    required IconData icon,

    required Color color,
  }) {

    return Container(

      padding: const EdgeInsets.all(20),

      decoration: BoxDecoration(

        color: color,

        borderRadius:
        BorderRadius.circular(20),

        boxShadow: [

          BoxShadow(

            color:
            Colors.black.withOpacity(0.1),

            blurRadius: 8,

            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Row(

        children: [

          CircleAvatar(

            radius: 28,

            backgroundColor:
            Colors.white,

            child: Icon(
              icon,
              color: color,
              size: 30,
            ),
          ),

          const SizedBox(width: 15),

          Expanded(

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                Text(

                  title,

                  style: const TextStyle(

                    color: Colors.white70,

                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 5),

                Text(

                  value,

                  style: const TextStyle(

                    color: Colors.white,

                    fontSize: 22,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor:
      const Color(0xfff5f5f5),

      appBar: AppBar(

        title:
        const Text("Admin Dashboard"),

        backgroundColor:
        Colors.orange,

        centerTitle: true,
      ),

      // DRAWER
      drawer: Drawer(

        child: ListView(

          padding: EdgeInsets.zero,

          children: [

            DrawerHeader(

              decoration: const BoxDecoration(
                color: Colors.orange,
              ),

              child: Column(

                crossAxisAlignment:
                CrossAxisAlignment.start,

                children: const [

                  CircleAvatar(

                    radius: 30,

                    backgroundColor:
                    Colors.white,

                    child: Icon(

                      Icons.admin_panel_settings,

                      size: 40,

                      color: Colors.orange,
                    ),
                  ),

                  SizedBox(height: 12),

                  Text(

                    "Admin Panel",

                    style: TextStyle(

                      color: Colors.white,

                      fontSize: 24,

                      fontWeight:
                      FontWeight.bold,
                    ),
                  ),

                  Flexible(
                    child: Text(

                      "CementExpress",

                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // DASHBOARD
            ListTile(

              leading:
              const Icon(Icons.dashboard),

              title:
              const Text("Dashboard"),

              onTap: () {

                Navigator.pop(context);
              },
            ),

            // ORDERS
            ListTile(

              leading:
              const Icon(Icons.shopping_cart),

              title:
              const Text("Orders"),

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) =>
                    const OrdersPage(),
                  ),
                );
              },
            ),

            // USERS
            ListTile(

              leading:
              const Icon(Icons.people),

              title:
              const Text("Users"),

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) =>
                    const Allusers(),
                  ),
                );
              },
            ),

            // PAYMENTS
            ListTile(

              leading:
              const Icon(Icons.payment),

              title:
              const Text("Payments"),

              onTap: () {

                Navigator.push(

                  context,

                  MaterialPageRoute(

                    builder: (context) =>
                    const AdminPay(),
                  ),
                );
              },
            ),

            // LOGOUT
            ListTile(

              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),

              title: const Text(

                "Logout",

                style: TextStyle(
                  color: Colors.red,
                ),
              ),

              onTap: () {

                Navigator.pushAndRemoveUntil(

                  context,

                  MaterialPageRoute(

                    builder: (context) =>
                    const LoginPage(),
                  ),

                      (value) => false,
                );
              },
            ),
          ],
        ),
      ),

      // BODY
      body: FutureBuilder(

        future: Future.wait([

          // NEW ORDERS
          FirebaseFirestore.instance
              .collection("orders")
              .get(),

          // OLD TOOLS
          FirebaseFirestore.instance
              .collection("Tools")
              .get(),

          // OLD BUILDING
          FirebaseFirestore.instance
              .collection("Buildingmaterials")
              .get(),

          // PAYMENTS
          FirebaseFirestore.instance
              .collection("payments")
              .get(),
        ]),

        builder: (context, AsyncSnapshot data) {

          // LOADING
          if (!data.hasData) {

            return const Center(
              child:
              CircularProgressIndicator(),
            );
          }

          // COLLECTIONS
          final orders =
              data.data[0].docs;

          final tools =
              data.data[1].docs;

          final buildings =
              data.data[2].docs;

          final payments =
              data.data[3].docs;

          // VARIABLES
          double totalRevenue = 0;
          double monthlySales = 0;

          double buildingRevenue = 0;
          double toolsRevenue = 0;

          int totalOrders = 0;

          int buildingOrders = 0;
          int toolsOrders = 0;

          int successfulPayments = 0;
          int failedPayments = 0;

          DateTime now = DateTime.now();

          // NEW ORDERS
          for (var doc in orders) {

            var item =
            doc.data()
            as Map<String, dynamic>;

            double total =
                double.tryParse(
                    item['total']
                        .toString()) ??
                    0;

            totalRevenue += total;

            totalOrders++;

            String category =
                item['category']
                    ?.toString() ?? '';

            // BUILDING
            if (category ==
                'Building Material') {

              buildingRevenue += total;

              buildingOrders++;
            }

            // TOOLS
            if (category ==
                'Tools') {

              toolsRevenue += total;

              toolsOrders++;
            }

            // MONTHLY SALES
            if (item['createdAt'] != null) {

              Timestamp timestamp =
              item['createdAt'];

              DateTime orderDate =
              timestamp.toDate();

              if (orderDate.month ==
                  now.month &&
                  orderDate.year ==
                      now.year) {

                monthlySales += total;
              }
            }
          }

          // OLD TOOLS DATA
          for (var doc in tools) {

            var item =
            doc.data()
            as Map<String, dynamic>;

            double total =
                double.tryParse(
                    item['total']
                        .toString()) ??
                    0;

            toolsRevenue += total;

            totalRevenue += total;

            toolsOrders++;

            totalOrders++;
          }

          // OLD BUILDING DATA
          for (var doc in buildings) {

            var item =
            doc.data()
            as Map<String, dynamic>;

            double total =
                double.tryParse(
                    item['total']
                        .toString()) ??
                    0;

            buildingRevenue += total;

            totalRevenue += total;

            buildingOrders++;

            totalOrders++;
          }

          // PAYMENTS
          for (var doc in payments) {

            var item =
            doc.data()
            as Map<String, dynamic>;

            String status =
                item['status']
                    ?.toString() ?? '';

            // SUCCESS
            if (status == "Success") {

              successfulPayments++;
            }

            // FAILED
            if (status == "Failed") {

              failedPayments++;
            }
          }

          return SingleChildScrollView(

            padding:
            const EdgeInsets.all(16),

            child: Column(

              crossAxisAlignment:
              CrossAxisAlignment.start,

              children: [

                const Text(

                  "Dashboard Overview",

                  style: TextStyle(

                    fontSize: 28,

                    fontWeight:
                    FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 20),

                // TOTAL REVENUE
                dashboardCard(

                  title:
                  "Total Revenue",

                  value:
                  "₹${totalRevenue.toStringAsFixed(0)}",

                  icon:
                  Icons.currency_rupee,

                  color:
                  Colors.green,
                ),

                const SizedBox(height: 20),

                // MONTHLY SALES
                dashboardCard(

                  title:
                  "Monthly Sales",

                  value:
                  "₹${monthlySales.toStringAsFixed(0)}",

                  icon:
                  Icons.bar_chart,

                  color:
                  Colors.blue,
                ),

                const SizedBox(height: 20),

                // BUILDING REVENUE
                dashboardCard(

                  title:
                  "Building Revenue",

                  value:
                  "₹${buildingRevenue.toStringAsFixed(0)}",

                  icon:
                  Icons.home_work,

                  color:
                  Colors.purple,
                ),

                const SizedBox(height: 20),

                // BUILDING ORDERS
                dashboardCard(

                  title:
                  "Building Orders",

                  value:
                  buildingOrders.toString(),

                  icon:
                  Icons.inventory,

                  color:
                  Colors.indigo,
                ),

                const SizedBox(height: 20),

                // TOOLS REVENUE
                dashboardCard(

                  title:
                  "Tools Revenue",

                  value:
                  "₹${toolsRevenue.toStringAsFixed(0)}",

                  icon:
                  Icons.build,

                  color:
                  Colors.teal,
                ),

                const SizedBox(height: 20),

                // TOOLS ORDERS
                dashboardCard(

                  title:
                  "Tools Orders",

                  value:
                  toolsOrders.toString(),

                  icon:
                  Icons.handyman,

                  color:
                  Colors.brown,
                ),

                const SizedBox(height: 20),

                // TOTAL ORDERS
                dashboardCard(

                  title:
                  "Total Orders",

                  value:
                  totalOrders.toString(),

                  icon:
                  Icons.shopping_bag,

                  color:
                  Colors.orange,
                ),

                const SizedBox(height: 20),

                // SUCCESS PAYMENTS
                dashboardCard(

                  title:
                  "Successful Payments",

                  value:
                  successfulPayments.toString(),

                  icon:
                  Icons.check_circle,

                  color:
                  Colors.green,
                ),

                const SizedBox(height: 20),

                // FAILED PAYMENTS
                dashboardCard(

                  title:
                  "Failed Payments",

                  value:
                  failedPayments.toString(),

                  icon:
                  Icons.cancel,

                  color:
                  Colors.red,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}