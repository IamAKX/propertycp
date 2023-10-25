import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/constants.dart';
import 'package:propertycp/utils/theme.dart';
import 'package:propertycp/widgets/gaps.dart';
import 'package:propertycp/widgets/no_property_found.dart';
import 'package:propertycp/widgets/property_card.dart';

class PropertyListingScreen extends StatefulWidget {
  const PropertyListingScreen({super.key, required this.propertyTypeId});
  final int propertyTypeId;
  static const String routePath = '/propertyListingScreen';

  @override
  State<PropertyListingScreen> createState() => _PropertyListingScreenState();
}

class _PropertyListingScreenState extends State<PropertyListingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(propertyTypeName[widget.propertyTypeId]!),
      ),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    if (widget.propertyTypeId % 2 == 0) return const NoPropertyFound();
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const PropertyCard(),
    );
  }
}
