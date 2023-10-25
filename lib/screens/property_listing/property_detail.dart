import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/constants.dart';
import 'package:propertycp/utils/dummy.dart';
import 'package:propertycp/utils/enum.dart';
import 'package:propertycp/utils/theme.dart';
import 'package:propertycp/widgets/gaps.dart';

import '../../main.dart';
import '../../models/property_model.dart';
import '../../utils/preference_key.dart';
import '../leads/create_lead.dart';

class PropertyDetailScreen extends StatefulWidget {
  const PropertyDetailScreen({super.key, required this.property});
  final PropertyModel? property;
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
            onPressed: () {
              if (prefs
                      .getStringList(SharedpreferenceKey.favourite)
                      ?.contains(widget.property?.id?.toString()) ??
                  false) {
                SharedpreferenceKey.removeFromFavourite(
                    widget.property?.id?.toString() ?? '');
              } else {
                SharedpreferenceKey.addToFavourite(
                    widget.property?.id?.toString() ?? '');
              }
              setState(() {});
            },
            icon: (prefs
                        .getStringList(SharedpreferenceKey.favourite)
                        ?.contains(widget.property?.id?.toString()) ??
                    false)
                ? const Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )
                : const Icon(
                    Icons.favorite_border_outlined,
                  ),
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
                        context,
                        'Type',
                        '${widget.property?.type}',
                        'Area',
                        '${widget.property?.area} ${widget.property?.areaUnit}'),
                    verticalGap(defaultPadding / 2),
                    rowWithTwoItem(
                        context,
                        'Price',
                        '$rupee ${widget.property?.price}Cr',
                        'City',
                        '${widget.property?.city}'),
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
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: Text('${widget.property?.description}'),
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
              // Navigator.pushNamed(context, PropertyDetailScreen.routePath,
              //     arguments: 1);
            },
            child: CachedNetworkImage(
              imageUrl: widget.property?.mainImage ?? '',
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 250,
              placeholder: (context, url) => const SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => Container(
                alignment: Alignment.center,
                width: double.infinity,
                height: 250,
                child: const Text(
                  'Unable to load image',
                ),
              ),
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
                        '${widget.property?.images?.where((element) => element.mediaType == MediaType.Image.name).length} Photos',
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
                        '${widget.property?.images?.where((element) => element.mediaType == MediaType.Video.name).length} Videos',
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
