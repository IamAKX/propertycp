import 'package:flutter/material.dart';
import 'package:propertycp/models/property_model.dart';
import 'package:propertycp/screens/profile/post_property/pick_propert_images.dart';
import 'package:propertycp/screens/profile/post_property/pick_propert_video.dart';
import 'package:propertycp/screens/profile/post_property/post_property_screen.dart';
import 'package:propertycp/screens/profile/users/user_detail.dart';
import 'package:propertycp/screens/profile/users/user_list.dart';
import 'package:propertycp/screens/property_listing/property_detail.dart';
import 'package:propertycp/screens/property_listing/property_listing_screen.dart';
import 'package:propertycp/screens/home_container/home_container.dart';
import 'package:propertycp/screens/profile/kyc/kyc.dart';
import 'package:propertycp/screens/leads/create_lead.dart';
import 'package:propertycp/screens/onboarding/login_screen.dart';

import '../screens/appIntro/app_intro_screen.dart';

class NavRoute {
  static MaterialPageRoute<dynamic> generatedRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppIntroScreen.routePath:
        return MaterialPageRoute(builder: (_) => const AppIntroScreen());
      case LoginScreen.routePath:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case HomeContainer.routePath:
        return MaterialPageRoute(builder: (_) => const HomeContainer());
      case PropertyListingScreen.routePath:
        return MaterialPageRoute(
          builder: (_) => PropertyListingScreen(
            params: settings.arguments as List<String?>,
          ),
        );
      case PropertyDetailScreen.routePath:
        return MaterialPageRoute(
          builder: (_) => PropertyDetailScreen(
            property: settings.arguments as PropertyModel,
          ),
        );
      case CreateLead.routePath:
        return MaterialPageRoute(
          builder: (_) => CreateLead(
            type: settings.arguments as String,
          ),
        );
      case KycScreen.routePath:
        return MaterialPageRoute(builder: (_) => const KycScreen());
      case PostProperty.routePath:
        return MaterialPageRoute(builder: (_) => const PostProperty());
      case PickPropertyImages.routePath:
        return MaterialPageRoute(
            builder: (_) => PickPropertyImages(
                  model: settings.arguments as PropertyModel,
                ));
      case PickPropertyVideos.routePath:
        return MaterialPageRoute(
            builder: (_) => PickPropertyVideos(
                  model: settings.arguments as PropertyModel,
                ));
      case UserListScreen.routePath:
        return MaterialPageRoute(builder: (_) => const UserListScreen());
      case UserDetail.routePath:
        return MaterialPageRoute(
            builder: (_) => UserDetail(
                  userId: settings.arguments as int,
                ));
      default:
        return errorRoute();
    }
  }
}

errorRoute() {
  return MaterialPageRoute(builder: (_) {
    return const Scaffold(
      body: Center(
        child: Text('Undefined route'),
      ),
    );
  });
}
