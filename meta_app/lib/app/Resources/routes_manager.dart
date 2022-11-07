// import 'package:flutter/material.dart';

// class Routes {
//   static const String splashRoute = '/';
//   static const String onBoardRoute = '/onboard';
//   static const String onLoginRoute = '/login';
//   static const String onRegisterRoute = '/register';
//   static const String onMainRoute = '/main';
//   static const String onForgetPasswordRoute = '/forget_password';
//   static const String onStoreDetailsRoute = '/store_details';
// }

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(builder: (_) => SplashView());
//       case Routes.onBoardRoute:
//         return MaterialPageRoute(builder: (_) => OnBoardingView());
//       case Routes.onLoginRoute:
//         return MaterialPageRoute(builder: (_) => LoginView());
//       case Routes.onRegisterRoute:
//         return MaterialPageRoute(builder: (_) => RegisterView());
//       case Routes.onMainRoute:
//         return MaterialPageRoute(builder: (_) => MainView());
//       case Routes.onForgetPasswordRoute:
//         return MaterialPageRoute(builder: (_) => ForgetPasswordView());
//       case Routes.onStoreDetailsRoute:
//         return MaterialPageRoute(builder: (_) => StoreDetailsView());
//       default:
//         return unDefinedRoute();
//     }
//   }

//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) => Scaffold(
//         appBar: AppBar(
//           title: const Text(AppStringManager.routeNotFound),
//         ),
//         body: const Center(
//           child: Text(AppStringManager.routeNotFound),
//         ),
//       ),
//     );
//   }
// }
