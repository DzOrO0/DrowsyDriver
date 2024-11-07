import 'package:drowsy_driver/screens/authenticate/sign_in.dart';
import 'package:drowsy_driver/services/auth_service.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Color primary = const Color(0xFF007BFF); // Blue color
  final Color secondary = Colors.white;

  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AuthService _authService = AuthService();

    return Scaffold(
      backgroundColor: secondary,
      appBar: AppBar(
        title: const Text('Driver Drowsiness'),
        backgroundColor: primary,
        elevation: 0.0,
        actions: <Widget>[
          TextButton.icon(
            icon: const Icon(Icons.person),
            style: TextButton.styleFrom(
              foregroundColor: secondary,
            ),
            label: const Text('Sign out'),
            onPressed: () async {
              await _authService.signOut();
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => SignIn()),
              );
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Welcome to the Home Page!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'You are now logged in.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: primary),
              onPressed: () async {
                await _authService.signOut();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignIn()),
                );
              },
              child: const Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
