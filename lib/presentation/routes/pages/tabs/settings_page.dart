import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';

@RoutePage()
class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Favorites Page'));
  }
}
