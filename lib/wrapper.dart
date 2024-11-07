import 'package:drowsy_driver/models/userModel.dart';
import 'package:drowsy_driver/screens/authenticate/authenticate.dart';
import 'package:drowsy_driver/screens/authenticate/sign_in.dart';
import 'package:drowsy_driver/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);

    print("User: $user"); // Debugging line

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
