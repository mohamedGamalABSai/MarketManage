import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:toastification/toastification.dart';
import 'package:vegan_admin_panel/consts/colors.dart';

import 'package:vegan_admin_panel/controllers/MenuController.dart';
import 'package:vegan_admin_panel/loading_screen.dart';
import 'package:vegan_admin_panel/provider/dark_theme_provider.dart';
import 'package:vegan_admin_panel/provider/loading_provider.dart';
import 'package:vegan_admin_panel/provider/order_provider.dart';
import 'package:vegan_admin_panel/provider/products_provider.dart';
import 'package:vegan_admin_panel/screens/home_screen.dart';
import 'package:vegan_admin_panel/test/Screens/Login/login_screen.dart';
import 'package:vegan_admin_panel/test/Screens/Login/provider/login_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBQg2x515_ZE4es_M7qHBlZAJHoiIklSRA',
      messagingSenderId: '',
      projectId: 'vegan-market-1d92d',
      appId: '1:758887531690:web:c70a8b5a1b396b9a02fcd3',
      storageBucket: 'vegan-market-1d92d.appspot.com',
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
        ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
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
            : const LoginScreen();
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
        builder: (context, orientation, screenType) => const MaterialApp(
          color: AppColors.whiteColor,
          title: 'Vegan Market',
          debugShowCheckedModeBanner: false,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
