import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:propertycp/main.dart';
import 'package:propertycp/models/user_model.dart';
import 'package:propertycp/screens/property_listing/property_listing_screen.dart';
import 'package:propertycp/utils/colors.dart';
import 'package:propertycp/utils/constants.dart';
import 'package:propertycp/utils/preference_key.dart';
import 'package:propertycp/widgets/gaps.dart';
import 'package:propertycp/widgets/user_profile_image.dart';
import 'package:provider/provider.dart';

import '../../services/api_service.dart';
import '../../services/snakbar_service.dart';
import '../../utils/dummy.dart';
import '../../utils/theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.switchTabs});
  final Function(int index) switchTabs;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedOption = 'Bangalore';
  int selectedPropertyId = 1;
  UserModel? userModel;
  late ApiProvider _api;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => loadScreen(),
    );
  }

  loadScreen() async {
    _api.getUserById(SharedpreferenceKey.getUserId()).then((value) {
      setState(() {
        userModel = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SnackBarService.instance.buildContext = context;
    _api = Provider.of<ApiProvider>(context);
    return Scaffold(
      body: getBody(context),
    );
  }

  getBody(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.blueGrey,
          width: double.infinity,
          height: 250,
          child: Column(
            children: [
              verticalGap(defaultPadding * 3),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding, vertical: defaultPadding / 2),
                child: Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        text: 'Hey, ',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 0.8,
                                color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: '${userModel?.fullName?.split(' ').first}\n',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                          ),
                          const TextSpan(text: 'Let\'s start exploring'),
                        ],
                      ),
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {},
                      child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(homePageProfilePic),
                          child: UserProfileImage(
                            userModel: userModel,
                            width: homePageProfilePic,
                            height: homePageProfilePic,
                          )),
                    ),
                  ],
                ),
              ),
              verticalGap(defaultPadding),
              Card(
                elevation: defaultPadding / 2,
                margin: const EdgeInsets.symmetric(
                  horizontal: defaultPadding,
                  vertical: defaultPadding / 2,
                ),
                child: Container(
                  // padding: const EdgeInsets.all(defaultPadding),
                  decoration: BoxDecoration(
                    border: Border.all(color: dividerColor),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Row(
                    children: [
                      horizontalGap(defaultPadding),
                      const Icon(
                        LineAwesomeIcons.map_pin,
                        color: hintColor,
                        size: 25,
                      ),
                      horizontalGap(defaultPadding),
                      Expanded(
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: selectedOption,
                            onChanged: (value) {
                              setState(() {
                                selectedOption = value!;
                              });
                            },
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                            items: karnatakaDistricts
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      horizontalGap(defaultPadding),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        GridView.count(
          padding: const EdgeInsets.all(defaultPadding / 2),
          shrinkWrap: true,
          mainAxisSpacing: defaultPadding / 2,
          crossAxisSpacing: defaultPadding / 2,
          crossAxisCount: 3,
          children: propertyType
              .map((e) => InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                          context, PropertyListingScreen.routePath,
                          arguments: e.id);
                    },
                    child: Card(
                      elevation: 2,
                      color: Colors.white,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            e.iconPath!,
                            width: 40,
                            color: Colors.blueGrey,
                          ),
                          verticalGap(defaultPadding / 2),
                          Flexible(
                            child: Text(
                              e.name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(
                                    color: Colors.blueGrey,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ))
              .toList(),
        )
      ],
    );
  }
}
