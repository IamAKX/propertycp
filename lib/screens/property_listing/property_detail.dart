import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/constants.dart';
import 'package:propertycp/utils/dummy.dart';
import 'package:propertycp/utils/theme.dart';
import 'package:propertycp/widgets/gaps.dart';

import '../leads/create_lead.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key, required this.propertyId});
  final int propertyId;
  static const String routePath = '/propertyDeatilScreen';
  @override
  State<PropertyDetailScreen> createState() => _PropertyDetailScreenState();
}

class _PropertyDetailScreenState extends State<PropertyDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border_outlined),
          ),
        ],
      ),
      body: getBody(context),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.person_add_alt,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.pushNamed(context, CreateLead.routePath,
              arguments: 'Flats');
        },
      ),
    );
  }

  getBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        header(context),
        Expanded(
          child: ListView(
            children: [
              Card(
                elevation: 5,
                margin: const EdgeInsets.all(defaultPadding),
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Property Information',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    verticalGap(defaultPadding / 2),
                    rowWithTwoItem(
                        context, 'Type', 'Flat', 'Area', '1500 Sqft'),
                    verticalGap(defaultPadding / 2),
                    rowWithTwoItem(
                        context, 'Price', '$rupee 1.2Cr', 'City', 'Bangalore'),
                    verticalGap(defaultPadding / 2),
                  ],
                ),
              ),
              Card(
                elevation: 5,
                margin: const EdgeInsets.fromLTRB(
                  defaultPadding,
                  0,
                  defaultPadding,
                  defaultPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(defaultPadding / 2),
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: primary,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                        ),
                      ),
                      child: Text(
                        'Description',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Text(dummyText),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Padding rowWithTwoItem(BuildContext context, String key1, String value1,
      String key2, String value2) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
      child: Row(
        children: [
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '$key1\n',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: hintColor),
                children: <TextSpan>[
                  TextSpan(
                    text: value1,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: textColorDark,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                text: '$key2\n',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: hintColor),
                children: <TextSpan>[
                  TextSpan(
                    text: value2,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: textColorDark,
                        fontWeight: FontWeight.bold,
                        height: 1.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox header(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, PropertyDetailScreen.routePath,
                  arguments: 1);
            },
            child: Image.asset(
              'assets/images/flats.jpg',
              height: 250,
              width: double.maxFinite,
              fit: BoxFit.fitWidth,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Icon(LineAwesomeIcons.image,
                          size: 15, color: Colors.white),
                      horizontalGap(8),
                      Text(
                        '8 Photos',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      const Icon(LineAwesomeIcons.video_file,
                          size: 15, color: Colors.white),
                      horizontalGap(8),
                      Text(
                        '2 Videos',
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
