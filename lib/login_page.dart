// TODO Implement this library.
import 'package:flutter/material.dart';



//Login Page
class  LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        elevation: 0, 
        iconTheme: const IconThemeData(color: Colors.black87),
      ),      
      body: SafeArea(
        child: Padding (padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Welcome Back',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your credentials to access your account.',
                style: TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 28, 58, 113),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
                child: const Text('Sign In', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}