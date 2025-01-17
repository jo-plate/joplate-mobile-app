import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Home Page'));
  }
}
