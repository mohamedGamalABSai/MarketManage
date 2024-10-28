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
import 'package:vegan_admin_panel/screens/auth/Login/provider/login_provider.dart';

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
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:vegan_admin_panel/test_json/provider.dart';

// void main() {
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => ProductProvider()),
//       ],
//       child: MyApp(),
//     ),
//   );
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Product App',
//       home: ProductListScreen(),
//     );
//   }
// }

// class ProductListScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final productProvider = Provider.of<ProductProvider>(context);

//     return Scaffold(
//       appBar: AppBar(title: Text('Products')),
//       body: FutureBuilder(
//         future: productProvider.fetchProducts(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else {
//             return ListView.builder(
//               itemCount: productProvider.products.length,
//               itemBuilder: (context, index) {
//                 final product = productProvider.products[index];
//                 return ListTile(
//                   title: Text(product.name),
//                   subtitle: Text('Price: \$${product.price}'),
//                   leading: Image.network(product.pictureName),
//                 );
//               },
//             );
//           }
//         },
//       ),
//     );
//   }
// }
