import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/theme.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

class PickPropertyVideos extends StatefulWidget {
  const PickPropertyVideos({super.key});
  static const String routePath = '/pickPropertyVideos';

  @override
  State<PickPropertyVideos> createState() => _PickPropertyVideosState();
}

class _PickPropertyVideosState extends State<PickPropertyVideos> {
  List<File> videoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Property Videos'),
        actions: [
          TextButton(
            onPressed: () async {
              Navigator.pop(context);
            },
            child: Text(
              'Done',
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
          final List<XFile> videos = await picker.pickMultipleMedia();
          if (videos != null && videos.isNotEmpty) {
            setState(() {
              for (var element in videos) {
                videoList.add(File(element.path));
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
    return videoList.isEmpty
        ? Center(
            child: Text(
              'Please tap on \'+\' button to select video',
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
            itemCount: videoList.length,
            itemBuilder: (context, index) {
              return FutureBuilder<Uint8List?>(
                future: generateThumbnail(videoList.elementAt(index).path),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    return Stack(
                      children: [
                        Image.memory(
                          snapshot.data!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              videoList.removeAt(index);
                            });
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        )
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              );
            },
          );
  }

  Future<Uint8List?> generateThumbnail(String videoPath) async {
    final thumbnail = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      quality: 100,
    );

    return thumbnail;
  }
}
