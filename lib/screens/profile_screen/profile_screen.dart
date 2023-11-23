import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/user_profile/user_profile_model.dart';
import 'package:income_expense_trakerapp/screens/profile_screen/profile_details_widget.dart';
import 'package:income_expense_trakerapp/screens/widgets/top_container.dart';
import 'package:income_expense_trakerapp/screens/widgets/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  TopContainer(
                      title: "Profile", icon: Icons.notifications_none_outlined),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(33, 65, 33, 0),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: FutureBuilder<UserProfile?>(
                            future: getUserProfile(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return CircularProgressIndicator();
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final userProfile = snapshot.data!;
                                return Container(
                                  child: Center(
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          radius: 66,
                                          child: ClipOval(
                                            child: Image.asset(
                                              'assets/images/person1.png',
                                              fit: BoxFit.cover,
                                              width: 130,
                                              height: 130,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 10,),
                                        Text(userProfile.name,
                                            style: TextStyle(
                                              fontSize: 20,
                                                color: darkColor,
                                                fontWeight: FontWeight.w600)),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '${userProfile.email}',
                                          style: TextStyle(color: defaultColor,fontSize: 16),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return Text('No user profile available.');
                              }
                            }),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 26,
                    ),
                    Image.asset(
                      'assets/images/diamond.png',
                      width: 33,
                      height: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text('Invite Friends',
                        style:
                            TextStyle(fontSize: 16, fontWeight: FontWeight.w600))
                  ],
                ),
              ),
              Divider(
                thickness: 1,
              ),
              ProfileListtile(icon: Icons.person, title: "Account info"),
              InkWell(
                  onTap: () {
                    Get.to(ProfileDetailsWidget());
                  },
                  child: ProfileListtile(
                      icon: Icons.group, title: "Personal profile")),
              ProfileListtile(
                  icon: Icons.email_outlined, title: "Message center"),
              ProfileListtile(icon: Icons.security, title: "Login and security"),
              ProfileListtile(icon: Icons.lock, title: "Data and privacy"),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        child: BottomNavigationWidget(),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromARGB(255, 239, 235, 235),
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileListtile extends StatelessWidget {
  final String title;
  final IconData icon;

  const ProfileListtile({
    required this.icon,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: Icon(
          icon,
          color: greyText,
        ),
        title: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

Future<UserProfile?> getUserProfile() async {
  final userDataBox = await Hive.openBox<UserProfile>('user_profiles');
  if (userDataBox.isNotEmpty) {
    // Assuming you have only one user profile, so using getAt(0)
    return userDataBox.getAt(0);
  } else {
    return null;
  }
}
