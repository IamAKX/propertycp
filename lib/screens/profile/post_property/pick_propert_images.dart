import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertycp/screens/profile/post_property/pick_propert_video.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/theme.dart';

class PickPropertyImages extends StatefulWidget {
  const PickPropertyImages({super.key});
  static const String routePath = '/pickPropertyImages';

  @override
  State<PickPropertyImages> createState() => _PickPropertyImagesState();
}

class _PickPropertyImagesState extends State<PickPropertyImages> {
  List<File> imageList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Property Image'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(
                  context, PickPropertyVideos.routePath);
            },
            child: Text(
              'Next',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge
                  ?.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final ImagePicker picker = ImagePicker();
          final List<XFile> images = await picker.pickMultiImage();
          if (images != null && images.isNotEmpty) {
            setState(() {
              for (var element in images) {
                imageList.add(File(element.path));
              }
            });
          }
        },
        child: const Icon(Icons.add),
      ),
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return imageList.isEmpty
        ? Center(
            child: Text(
              'Please tap on \'+\' button to select image',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: textColorDark),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(defaultPadding / 2),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1.0,
              crossAxisSpacing: defaultPadding / 2,
              mainAxisSpacing: defaultPadding / 2,
            ),
            itemCount: imageList.length, // Number of items in the list
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  Image.file(
                    imageList.elementAt(index),
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        imageList.removeAt(index);
                      });
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  )
                ],
              );
            },
          );
  }
}
