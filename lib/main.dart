import 'package:flutter/material.dart';
import 'login_page.dart';
import 'registration_page.dart';
import 'home_page.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  // Ensure Flutter bindings are initialized before calling native code
  WidgetsFlutterBinding.ensureInitialized();
  
  // Initialize Firebase
  await Firebase.initializeApp(
    // options: DefaultFirebaseOptions.currentPlatform, 
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     debugShowCheckedModeBanner: false,
     theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 28, 58, 113)),
      ),
      home: const StartupPage(title: 'Personal Finance Manager'),
    );
  }
}
class StartupPage extends StatelessWidget {
  const StartupPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.symmetric(horizontal : 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            //App icon or logo Placeholder
            const Icon(
              Icons.account_balance_wallet,
              size: 100,
              color: Color.fromARGB(255, 28, 58, 113),
             ),
             const SizedBox(height: 32),

            const Text( 
              'Take Control Of Your Wealth',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),
             //Subtitle or tagline Placeholder
            const Text(
              'Manage your finances, track expenses, and achieve your financial goals with ease.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const Spacer(),
            //Login and Register buttons
            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to the login page
                print('Navigating to the login page...');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 28, 58, 113),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text('Login',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
                onPressed: () {
                  // Replaces the current screen with the HomePage
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1E88E5),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('Sign In', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),

            ElevatedButton(
              onPressed: () {
                // TODO: Navigate to the registration page
                print('Navigating to the registration page...');
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RegistrationPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color.fromARGB(255, 28, 58, 113),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: const BorderSide(color: Color.fromARGB(255, 28, 58, 113), width: 2),
                ),
                elevation: 0,
              ),

              child: const Text('Register',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,),
              ),
            ),
            const SizedBox(height: 48),
          ],
        ),
      )
      )
      
      
    );
  }
}

