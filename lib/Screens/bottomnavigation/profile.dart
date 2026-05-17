import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        centerTitle: true,

        title: const Text(
          "My Profile",

          style: TextStyle(
            color: Colors.black,
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

            const SizedBox(height: 25),

            // ================= PROFILE IMAGE =================
            CircleAvatar(
              radius: 55,

              backgroundColor:
              Colors.deepOrange.shade100,

              child: const Icon(
                Icons.person,
                size: 60,
                color: Colors.deepOrange,
              ),
            ),

            const SizedBox(height: 15),

            // ================= NAME =================
            const Text(
              "Krish",

              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            // ================= EMAIL =================
            Text(
              "krish@gmail.com",

              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 30),

            // ================= PROFILE OPTIONS =================
            _buildProfileTile(
              Icons.person_outline,
              "Edit Profile",
            ),

            _buildProfileTile(
              Icons.location_on_outlined,
              "Saved Address",
            ),

            _buildProfileTile(
              Icons.shopping_bag_outlined,
              "My Orders",
            ),

            _buildProfileTile(
              Icons.payment_outlined,
              "Payment Methods",
            ),

            _buildProfileTile(
              Icons.notifications_outlined,
              "Notifications",
            ),

            _buildProfileTile(
              Icons.help_outline,
              "Help & Support",
            ),

            _buildProfileTile(
              Icons.info_outline,
              "About App",
            ),

            const SizedBox(height: 30),

            // ================= LOGOUT BUTTON =================
            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 20,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(

                  onPressed: () {},

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(15),
                    ),
                  ),

                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),

                  label: const Text(
                    "Logout",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
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

  // ================= PROFILE TILE =================
  Widget _buildProfileTile(
      IconData icon,
      String title,
      ) {

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(16),

        boxShadow: [

          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 6,
          ),
        ],
      ),

      child: ListTile(

        leading: CircleAvatar(
          backgroundColor:
          Colors.deepOrange.shade50,

          child: Icon(
            icon,
            color: Colors.deepOrange,
          ),
        ),

        title: Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),

        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
        ),

        onTap: () {},
      ),
    );
  }
}