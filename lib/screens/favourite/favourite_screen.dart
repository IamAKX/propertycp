import 'package:flutter/material.dart';
import 'package:propertycp/models/property_model.dart';

import '../../widgets/property_card.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key, required this.switchTabs});
  final Function(int index) switchTabs;
  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite'),
      ),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => PropertyCard(property: PropertyModel()),
    );
  }
}
