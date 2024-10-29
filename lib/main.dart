import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toastification/toastification.dart';
import 'package:vegan_admin_panel/consts/colors.dart';

import 'package:vegan_admin_panel/controllers/MenuController.dart';
import 'package:vegan_admin_panel/loading_screen.dart';
import 'package:vegan_admin_panel/provider/loading_provider.dart';
import 'package:vegan_admin_panel/provider/order_provider.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/screens/home_screen.dart';
import 'package:vegan_admin_panel/screens/auth/Login/provider/login_provider.dart';
import 'package:vegan_admin_panel/services/scroll_behav.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      projectId: 'market-abs',
      appId: '1:864053868336:android:ae8be7018e132a1fbbfaf5',
      apiKey: 'AIzaSyA0-Z44110Cv8NBYc-LcvmasZe-I1v4FPU',
      storageBucket: "market-abs.appspot.com",
      messagingSenderId: "864053868336",
    ),
  );

  runApp(const ManageMyMarket());
}

class ManageMyMarket extends StatelessWidget {
  const ManageMyMarket({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyMenuController()),
        ChangeNotifierProvider(create: (_) => ProductsProvider()),
        ChangeNotifierProvider(create: (_) => AlertDialogNotifier()),
        ChangeNotifierProvider(create: (_) => OrdersProvider()..getMyOrders()),
        ChangeNotifierProvider(create: (_) => LoadingProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ],
      child: const ToFixNullValueFromFireBase(),
    );
  }
}

class ToFixNullValueFromFireBase extends StatelessWidget {
  const ToFixNullValueFromFireBase({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoadingProvider>(
      builder: (context, loadingProvider, child) {
        return loadingProvider.isLoading
            ? const LoadingPage()
            : const LoadedScreen();
        // const LoginScreen();
      },
    );
  }
}

class LoadedScreen extends StatelessWidget {
  const LoadedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: ResponsiveSizer(
        builder: (context, orientation, screenType) => MaterialApp(
          scrollBehavior: MyCustomScrollBehavior(),
          color: AppColors.whiteColor,
          title: 'Vegan Market',
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
