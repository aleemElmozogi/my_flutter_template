// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ForgetPasswordScreen]
class ForgetPasswordRoute extends PageRouteInfo<ForgetPasswordRouteArgs> {
  ForgetPasswordRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
         ForgetPasswordRoute.name,
         args: ForgetPasswordRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'ForgetPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ForgetPasswordRouteArgs>();
      return ForgetPasswordScreen(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class ForgetPasswordRouteArgs {
  const ForgetPasswordRouteArgs({this.key, required this.phoneNumber});

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'ForgetPasswordRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LoginScreen]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginScreen();
    },
  );
}

/// generated route for
/// [MainScreen]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
    : super(MainRoute.name, initialChildren: children);

  static const String name = 'MainRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MainScreen();
    },
  );
}

/// generated route for
/// [OnBoardingPage]
class OnBoardingRoute extends PageRouteInfo<OnBoardingRouteArgs> {
  OnBoardingRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        OnBoardingRoute.name,
        args: OnBoardingRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'OnBoardingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OnBoardingRouteArgs>(
        orElse: () => const OnBoardingRouteArgs(),
      );
      return OnBoardingPage(key: args.key);
    },
  );
}

class OnBoardingRouteArgs {
  const OnBoardingRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'OnBoardingRouteArgs{key: $key}';
  }
}

/// generated route for
/// [OtpInputScreen]
class OtpInputRoute extends PageRouteInfo<OtpInputRouteArgs> {
  OtpInputRoute({
    Key? key,
    required String phoneNumber,
    required dynamic Function(String) onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
         OtpInputRoute.name,
         args: OtpInputRouteArgs(
           key: key,
           phoneNumber: phoneNumber,
           onSuccess: onSuccess,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpInputRouteArgs>();
      return OtpInputScreen(
        key: args.key,
        phoneNumber: args.phoneNumber,
        onSuccess: args.onSuccess,
      );
    },
  );
}

class OtpInputRouteArgs {
  const OtpInputRouteArgs({
    this.key,
    required this.phoneNumber,
    required this.onSuccess,
  });

  final Key? key;

  final String phoneNumber;

  final dynamic Function(String) onSuccess;

  @override
  String toString() {
    return 'OtpInputRouteArgs{key: $key, phoneNumber: $phoneNumber, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [PhoneInputScreen]
class PhoneInputRoute extends PageRouteInfo<PhoneInputRouteArgs> {
  PhoneInputRoute({
    Key? key,
    required dynamic Function(String) onSuccess,
    List<PageRouteInfo>? children,
  }) : super(
         PhoneInputRoute.name,
         args: PhoneInputRouteArgs(key: key, onSuccess: onSuccess),
         initialChildren: children,
       );

  static const String name = 'PhoneInputRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PhoneInputRouteArgs>();
      return PhoneInputScreen(key: args.key, onSuccess: args.onSuccess);
    },
  );
}

class PhoneInputRouteArgs {
  const PhoneInputRouteArgs({this.key, required this.onSuccess});

  final Key? key;

  final dynamic Function(String) onSuccess;

  @override
  String toString() {
    return 'PhoneInputRouteArgs{key: $key, onSuccess: $onSuccess}';
  }
}

/// generated route for
/// [PostsScreen]
class PostsRoute extends PageRouteInfo<PostsRouteArgs> {
  PostsRoute({Key? key, List<PageRouteInfo>? children})
    : super(
        PostsRoute.name,
        args: PostsRouteArgs(key: key),
        initialChildren: children,
      );

  static const String name = 'PostsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PostsRouteArgs>(
        orElse: () => const PostsRouteArgs(),
      );
      return PostsScreen(key: args.key);
    },
  );
}

class PostsRouteArgs {
  const PostsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'PostsRouteArgs{key: $key}';
  }
}

/// generated route for
/// [ProfilePostsScreen]
class ProfilePostsRoute extends PageRouteInfo<ProfilePostsRouteArgs> {
  ProfilePostsRoute({
    Key? key,
    required String projectId,
    required int projectCityId,
    bool myPosts = true,
    dynamic Function()? onDonation,
    required String userName,
    dynamic Function()? fetchPosts,
    List<PageRouteInfo>? children,
  }) : super(
         ProfilePostsRoute.name,
         args: ProfilePostsRouteArgs(
           key: key,
           projectId: projectId,
           projectCityId: projectCityId,
           myPosts: myPosts,
           onDonation: onDonation,
           userName: userName,
           fetchPosts: fetchPosts,
         ),
         initialChildren: children,
       );

  static const String name = 'ProfilePostsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProfilePostsRouteArgs>();
      return ProfilePostsScreen(
        key: args.key,
        projectId: args.projectId,
        projectCityId: args.projectCityId,
        myPosts: args.myPosts,
        onDonation: args.onDonation,
        userName: args.userName,
        fetchPosts: args.fetchPosts,
      );
    },
  );
}

class ProfilePostsRouteArgs {
  const ProfilePostsRouteArgs({
    this.key,
    required this.projectId,
    required this.projectCityId,
    this.myPosts = true,
    this.onDonation,
    required this.userName,
    this.fetchPosts,
  });

  final Key? key;

  final String projectId;

  final int projectCityId;

  final bool myPosts;

  final dynamic Function()? onDonation;

  final String userName;

  final dynamic Function()? fetchPosts;

  @override
  String toString() {
    return 'ProfilePostsRouteArgs{key: $key, projectId: $projectId, projectCityId: $projectCityId, myPosts: $myPosts, onDonation: $onDonation, userName: $userName, fetchPosts: $fetchPosts}';
  }
}

/// generated route for
/// [ProfileScreen]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProfileScreen();
    },
  );
}

/// generated route for
/// [ProjectsScreen]
class ProjectsRoute extends PageRouteInfo<void> {
  const ProjectsRoute({List<PageRouteInfo>? children})
    : super(ProjectsRoute.name, initialChildren: children);

  static const String name = 'ProjectsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProjectsScreen();
    },
  );
}

/// generated route for
/// [RegisterScreen]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    Key? key,
    required String phoneNumber,
    List<PageRouteInfo>? children,
  }) : super(
         RegisterRoute.name,
         args: RegisterRouteArgs(key: key, phoneNumber: phoneNumber),
         initialChildren: children,
       );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return RegisterScreen(key: args.key, phoneNumber: args.phoneNumber);
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({this.key, required this.phoneNumber});

  final Key? key;

  final String phoneNumber;

  @override
  String toString() {
    return 'RegisterRouteArgs{key: $key, phoneNumber: $phoneNumber}';
  }
}

/// generated route for
/// [SplashScreen]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
    : super(SplashRoute.name, initialChildren: children);

  static const String name = 'SplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreen();
    },
  );
}

/// generated route for
/// [WebScreen]
class WebRoute extends PageRouteInfo<WebRouteArgs> {
  WebRoute({
    Key? key,
    required String title,
    required Function onRouted,
    required String url,
    List<PageRouteInfo>? children,
  }) : super(
         WebRoute.name,
         args: WebRouteArgs(
           key: key,
           title: title,
           onRouted: onRouted,
           url: url,
         ),
         initialChildren: children,
       );

  static const String name = 'WebRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebRouteArgs>();
      return WebScreen(
        key: args.key,
        title: args.title,
        onRouted: args.onRouted,
        url: args.url,
      );
    },
  );
}

class WebRouteArgs {
  const WebRouteArgs({
    this.key,
    required this.title,
    required this.onRouted,
    required this.url,
  });

  final Key? key;

  final String title;

  final Function onRouted;

  final String url;

  @override
  String toString() {
    return 'WebRouteArgs{key: $key, title: $title, onRouted: $onRouted, url: $url}';
  }
}
