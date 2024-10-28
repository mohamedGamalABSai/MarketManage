import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vegan_admin_panel/consts/colors.dart';
import 'package:vegan_admin_panel/main.dart';
import 'package:vegan_admin_panel/test/Screens/Login/provider/login_provider.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Form(
      key: authProvider.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: authProvider.emailController,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: AppColors.brownColor,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
            decoration: const InputDecoration(
              hintText: "Your email",
              prefixIcon: Padding(
                padding: EdgeInsets.all(AppColors.defaultPadding),
                child: Icon(Icons.person),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: AppColors.defaultPadding),
            child: TextFormField(
              controller: authProvider.passwordController,
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: AppColors.brownColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
              decoration: const InputDecoration(
                hintText: "Your password",
                prefixIcon: Padding(
                  padding: EdgeInsets.all(AppColors.defaultPadding),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          const SizedBox(height: AppColors.defaultPadding),

          // Using Consumer to rebuild only the button and error display
          Consumer<AuthProvider>(
            builder: (context, authProvider, child) {
              return Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (authProvider.formKey.currentState?.validate() ??
                          false) {
                        await authProvider.signInWithEmailPassword(
                          authProvider.emailController.text,
                          authProvider.passwordController.text,
                        );

                        // Assuming successful authentication, navigate to the home page:
                        if (authProvider.isLoggedIn) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return LoadedScreen();
                              },
                            ),
                          ); // Replace '/home' with your actual home page route
                        }
                      }
                    },
                    child: Text(
                      "Login".toUpperCase(),
                    ),
                  ),
                  if (authProvider.errorMessage != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      authProvider.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ],
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
