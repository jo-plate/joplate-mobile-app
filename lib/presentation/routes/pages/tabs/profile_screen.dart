import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile Page'));
  }
}
