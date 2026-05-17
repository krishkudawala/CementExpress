import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool notification = true;
  bool darkMode = false;
  bool location = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "Settings",
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
          children: [

            const SizedBox(height: 20),

            // PROFILE CARD
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),

              child: Row(
                children: [

                  const CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.deepOrange,

                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),

                  const SizedBox(width: 15),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [

                        Text(
                          "Krish Kudawala",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "krish@gmail.com",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {},

                    icon: const Icon(Icons.edit),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // GENERAL
            buildTitle("General"),

            buildTile(
              icon: Icons.notifications_none,
              title: "Notifications",

              trailing: Switch(
                value: notification,

                activeColor: Colors.deepOrange,

                onChanged: (value) {

                  setState(() {
                    notification = value;
                  });

                },
              ),
            ),

            buildTile(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",

              trailing: Switch(
                value: darkMode,

                activeColor: Colors.deepOrange,

                onChanged: (value) {

                  setState(() {
                    darkMode = value;
                  });

                },
              ),
            ),

            buildTile(
              icon: Icons.location_on_outlined,
              title: "Location Access",

              trailing: Switch(
                value: location,

                activeColor: Colors.deepOrange,

                onChanged: (value) {

                  setState(() {
                    location = value;
                  });

                },
              ),
            ),

            const SizedBox(height: 20),

            // ACCOUNT
            buildTitle("Account"),

            buildTile(
              icon: Icons.lock_outline,
              title: "Change Password",

              trailing: const Icon(Icons.arrow_forward_ios, size: 18),

              onTap: () {},
            ),

            buildTile(
              icon: Icons.payment_outlined,
              title: "Payment Methods",

              trailing: const Icon(Icons.arrow_forward_ios, size: 18),

              onTap: () {},
            ),

            buildTile(
              icon: Icons.history,
              title: "Order History",

              trailing: const Icon(Icons.arrow_forward_ios, size: 18),

              onTap: () {},
            ),

            const SizedBox(height: 20),

            // SUPPORT
            buildTitle("Support"),

            buildTile(
              icon: Icons.help_outline,
              title: "Help Center",

              trailing: const Icon(Icons.arrow_forward_ios, size: 18),

              onTap: () {},
            ),

            buildTile(
              icon: Icons.info_outline,
              title: "About App",

              trailing: const Icon(Icons.arrow_forward_ios, size: 18),

              onTap: () {},
            ),

            const SizedBox(height: 30),

            // LOGOUT BUTTON
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  // SECTION TITLE
  Widget buildTitle(String title) {

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey.shade700,
          ),
        ),
      ),
    );
  }

  // SETTINGS TILE
  Widget buildTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
  }) {

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.deepOrange,
        ),

        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),

        trailing: trailing,

        onTap: onTap,
      ),
    );
  }
}