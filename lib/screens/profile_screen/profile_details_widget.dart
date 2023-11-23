import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:income_expense_trakerapp/core/color/colors.dart';
import 'package:income_expense_trakerapp/db/models/user_profile/user_profile_model.dart';
import 'package:income_expense_trakerapp/screens/widgets/top_container_sqr.dart';

class ProfileDetailsWidget extends StatefulWidget {
  @override
  ProfileDetailsWidgetState createState() => ProfileDetailsWidgetState();
}

class ProfileDetailsWidgetState extends State<ProfileDetailsWidget> {
  late UserProfile _userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    final userBox = await Hive.openBox<UserProfile>('user_profiles');
    if (userBox.isNotEmpty) {
      _userProfile = userBox.getAt(0)!;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: defaultColor,
      body: SafeArea(
        child: Column(
          children: [
            TopContainerSqr(title: 'PROFILE DETAILS', icon: Icons.more_horiz),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  color: whiteText,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 8,
                  child: Padding(
                    padding:  EdgeInsets.symmetric(vertical:15 ,horizontal:10 ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 60,
                          backgroundImage:
                              AssetImage('assets/images/person1.png'),
                        ),
                        SizedBox(height: 16),
                        Text(
                          _userProfile.name,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: defaultColor),
                        ),
                        SizedBox(height: 16),
                        _buildDetailItem('Email', _userProfile.email),
                        _buildDetailItem('Username', _userProfile.username),
                        _buildDetailItem(
                            'Password','* * * *'
                            // _userProfile
                            //     .password
                            ), // You might not want to display the actual password
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            '$label:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: defaultColor,
            ),
          ),
          SizedBox(width: 10),
          Text(
            value,
            style: TextStyle(
                fontSize: 16, color: greyText, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
