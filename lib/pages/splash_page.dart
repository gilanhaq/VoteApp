import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jangangolputyukkapp/services/auth_service.dart';
import 'package:jangangolputyukkapp/themes/theme.dart';
import 'package:jangangolputyukkapp/widgets/custom_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService(context);

    return Scaffold(
      backgroundColor: background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/logo.svg',
            ),
            SizedBox(
              height: 72,
            ),
            CustomButton(
              title: 'Mulai',
              onTap: () => authService.signInWithGoogle(),
              width: 220,
            ),
          ],
        ),
      ),
    );
  }
}
