import 'package:airlux/screens/home_screen.dart';
import 'package:airlux/screens/login_and_signup/signup_screen.dart';
import 'package:airlux/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AirLux'),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Texte de bienvenue
              Text(
                'Connectez vous !!',
                style: Theme.of(context).textTheme.titleMedium,
              ),

              const SizedBox(height: 50),

              // Email field
              CustomTextfield(
                key: const ValueKey('email_field'),
                controller: emailController,
                emailText: true,
                hintText: 'E-mail',
                obscureText: false,
              ),

              const SizedBox(height: 20),

              // Password field
              CustomTextfield(
                key: const ValueKey('password_field'),
                controller: passwordController,
                emailText: false,
                hintText: 'Mot de passe',
                obscureText: true,
              ),

              const SizedBox(height: 20),

              // Forgot password
              TextButton(
                  key: const ValueKey('forgot_password_button'),
                  onPressed: () {},
                  child: const Text('Mot de passe oublié')),

              const SizedBox(height: 20),

              // Login button
              ElevatedButton(
                key: const ValueKey('login_button'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
                child: const Text('Connexion'),
              ),

              const SizedBox(height: 50),
              // Create account
              TextButton(
                key: const ValueKey('create_account_button'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupScreen()),
                  );
                },
                child: const Text('Créer un compte'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
