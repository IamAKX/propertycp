import 'package:flutter/material.dart';
import 'package:propertycp/screens/property_listing/property_detail.dart';

import '../utils/colors.dart';
import '../utils/constants.dart';
import '../utils/theme.dart';
import 'gaps.dart';

class PropertyCard extends StatefulWidget {
  const PropertyCard({super.key});

  @override
  State<PropertyCard> createState() => _PropertyCardState();
}

class _PropertyCardState extends State<PropertyCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(defaultPadding / 2),
      child: SizedBox(
        width: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, PropertyDetailScreen.routePath,
                          arguments: 1);
                    },
                    child: Image.asset(
                      'assets/images/flats.jpg',
                      height: 150,
                      width: double.maxFinite,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.favorite_border_outlined,
                      ),
                    ),
                  )
                ],
              ),
            ),
            verticalGap(5),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Wilson Manor Gardens',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: textColorDark,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Text(
                '2 BHK for Sale in Begur Road Bangalore',
                style: Theme.of(context).textTheme.titleSmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('$rupee 2.3Lac'),
                  Text('2 BHK'),
                ],
              ),
            ),
            verticalGap(defaultPadding / 2),
          ],
        ),
      ),
    );
  }
}
