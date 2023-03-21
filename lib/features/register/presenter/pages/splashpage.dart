import 'package:flutter/material.dart';
import 'package:jf_desafio/features/register/presenter/pages/register_form.dart';
import 'package:rive/rive.dart';

class Splashpage extends StatefulWidget {
  const Splashpage({super.key});

  @override
  State<Splashpage> createState() => _SplashpageState();
}

class _SplashpageState extends State<Splashpage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4),
        () => Navigator.popAndPushNamed(context, RegisterForm.routeName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: const [
              SizedBox(
                child: RiveAnimation.asset(
                  'assets/flares/back.riv',
                  fit: BoxFit.fill,
                ),
              ),
              Text(
                'JF',
                style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}