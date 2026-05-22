import 'package:flutter/material.dart';


class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            TextField(
              decoration: InputDecoration(
                labelText: "Full Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(

                onPressed: () {},

                child: const Text("Save"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class SavedAddressPage extends StatelessWidget {
  const SavedAddressPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Saved Address"),
      ),

      body: ListView(

        padding: const EdgeInsets.all(15),

        children: [

          Card(
            child: ListTile(

              leading: Icon(Icons.home),

              title: Text("Home Address"),

              subtitle: Text(
                "Delhi, India",
              ),
            ),
          ),

          Card(
            child: ListTile(

              leading: Icon(Icons.work),

              title: Text("Office Address"),

              subtitle: Text(
                "Mumbai, India",
              ),
            ),
          ),
        ],
      ),
    );
  }
}



class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Notifications"),
      ),

      body: ListView(

        children: const [

          ListTile(
            leading: Icon(Icons.notifications),
            title: Text("Your order has been shipped"),
          ),

          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text("50% discount on cement today"),
          ),
        ],
      ),
    );
  }
}



class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Help & Support"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,

          children: const [

            Text(
              "Customer Support",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 20),

            Text("Email: support@cementexpress.com"),

            SizedBox(height: 10),

            Text("Phone: +91 9876543210"),
          ],
        ),
      ),
    );
  }
}


class AboutAppPage extends StatelessWidget {
  const AboutAppPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("About App"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          children: const [

            SizedBox(height: 20),

            Icon(
              Icons.shopping_bag,
              size: 80,
              color: Colors.deepOrange,
            ),

            SizedBox(height: 20),

            Text(
              "Cement Express",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),

            Text(
              "Cement Express is a construction material delivery app for cement, tools, paint, and services.",
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}