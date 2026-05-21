import 'package:cementexpress/Screens/Drawer/about/aboutapp.dart';
import 'package:cementexpress/Screens/Drawer/helpcenter/helpcenter.dart';
import 'package:cementexpress/Screens/Login/login_page.dart';
import 'package:cementexpress/Screens/bottomnavigation/orders.dart';
import 'package:cementexpress/Screens/bottomnavigation/profile.dart';
import 'package:cementexpress/Screens/forget/forget_password.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../main.dart';


class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool notification = true;
  bool location = true;

  @override
  Widget build(BuildContext context) {

    // PROVIDER
    final themeProvider =
    Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.isDark;

    // COLORS
    Color bgColor =
    isDark ? Colors.black : Colors.grey.shade100;

    Color cardColor =
    isDark ? Colors.grey.shade900 : Colors.white;

    Color textColor =
    isDark ? Colors.white : Colors.black87;

    Color subtitleColor =
    isDark ? Colors.grey.shade400 : Colors.grey;

    return Scaffold(

      backgroundColor: bgColor,

      appBar: AppBar(
        backgroundColor: cardColor,
        elevation: 0,

        centerTitle: true,

        title: Text(
          "Settings",
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
          ),
        ),

        iconTheme: IconThemeData(
          color: textColor,
        ),
      ),

      body: SingleChildScrollView(

        child: Column(
          children: [

            const SizedBox(height: 20),

            // PROFILE CARD
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(
                color: cardColor,
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
                      crossAxisAlignment:
                      CrossAxisAlignment.start,

                      children: [

                        Text(
                          "Krish Kudawala",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: textColor,
                          ),
                        ),

                        const SizedBox(height: 4),

                        Text(
                          "krish@gmail.com",
                          style: TextStyle(
                            color: subtitleColor,
                          ),
                        ),
                      ],
                    ),
                  ),

                  IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                          const ProfilePage(),
                        ),
                      );
                    },

                    icon: Icon(
                      Icons.edit,
                      color: textColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // GENERAL
            buildTitle("General", textColor),


            // DARK MODE
            buildTile(
              icon: Icons.dark_mode_outlined,
              title: "Dark Mode",
              textColor: textColor,
              cardColor: cardColor,

              trailing: Switch(

                value: themeProvider.isDark,

                activeColor: Colors.deepOrange,

                onChanged: (value) {

                  themeProvider.toggleTheme(value);
                },
              ),
            ),



            const SizedBox(height: 20),

            // ACCOUNT
            buildTitle("Account", textColor),

            buildTile(
              icon: Icons.lock_outline,
              title: "Change Password",
              textColor: textColor,
              cardColor: cardColor,

              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: textColor,
              ),

              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ForgetPassword()
                ));
              },
            ),

            buildTile(
              icon: Icons.payment_outlined,
              title: "Payment Methods",
              textColor: textColor,
              cardColor: cardColor,

              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: textColor,
              ),

              onTap: () {},
            ),

            buildTile(
              icon: Icons.history,
              title: "Order History",
              textColor: textColor,
              cardColor: cardColor,

              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: textColor,
              ),

              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => OrdersPage()
                ));
              },
            ),

            const SizedBox(height: 20),

            // SUPPORT
            buildTitle("Support", textColor),

            buildTile(
              icon: Icons.help_outline,
              title: "Help Center",
              textColor: textColor,
              cardColor: cardColor,

              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: textColor,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const HelpCenterPage(),
                  ),
                );
              },
            ),

            buildTile(
              icon: Icons.info_outline,
              title: "About App",
              textColor: textColor,
              cardColor: cardColor,

              trailing: Icon(
                Icons.arrow_forward_ios,
                size: 18,
                color: textColor,
              ),

              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const AboutAppPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            // LOGOUT BUTTON
            Padding(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 16,
              ),

              child: SizedBox(
                width: double.infinity,
                height: 55,

                child: ElevatedButton.icon(
                  onPressed: () {

                    showDialog(
                      context: context,

                      builder: (context) {

                        return AlertDialog(

                          backgroundColor: cardColor,

                          title: Text(
                            'Logout',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),

                          content: Text(
                            'Are you sure you want to logout',
                            style: TextStyle(
                              color: textColor,
                            ),
                          ),

                          actions: [

                            ElevatedButton(
                              onPressed: () {

                                Navigator.pop(context);

                              },

                              child: const Text('No'),
                            ),

                            ElevatedButton(
                              onPressed: () {

                                Navigator.push(
                                  context,

                                  MaterialPageRoute(
                                    builder: (context) {

                                      return LoginPage();
                                    },
                                  ),
                                );
                              },

                              child: const Text('Yes'),
                            ),
                          ],
                        );
                      },
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,

                    shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(14),
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
  Widget buildTitle(
      String title,
      Color textColor,
      ) {

    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 18),

      child: Align(
        alignment: Alignment.centerLeft,

        child: Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  // SETTINGS TILE
  Widget buildTile({
    required IconData icon,
    required String title,
    required Color textColor,
    required Color cardColor,
    Widget? trailing,
    VoidCallback? onTap,
  }) {

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: ListTile(

        leading: Icon(
          icon,
          color: Colors.deepOrange,
        ),

        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
        ),

        trailing: trailing,

        onTap: onTap,
      ),
    );
  }
}