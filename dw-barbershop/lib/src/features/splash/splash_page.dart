import 'package:dw_barbershop/src/features/auth/login/login_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var _scale = 10.0;
  var _animationOpacityLogo = 0.0;

  double get _logoAnimationWidth => 100 * _scale;
  double get _logoAnimationHeight => 100 * _scale;
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _animationOpacityLogo = 1;
        _scale = 1;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/background_image_chair.jpg'),
                fit: BoxFit.cover,
                opacity: 0.2),
          ),
          child: Center(
            child: AnimatedOpacity(
              onEnd: () {
                Navigator.of(context).pushAndRemoveUntil(
                    PageRouteBuilder(
                        settings: const RouteSettings(name: '/auth/login'),
                        transitionsBuilder: (_, animation, __, child) {
                          return FadeTransition(
                              opacity: animation, child: const LoginPage());
                        },
                        pageBuilder: (context, animation, secondaryAniamtion) {
                          return const LoginPage();
                        }),
                    (route) => false);
              },
              duration: const Duration(seconds: 3),
              curve: Curves.easeIn,
              opacity: _animationOpacityLogo,
              child: AnimatedContainer(
                  width: _logoAnimationWidth,
                  height: _logoAnimationHeight,
                  curve: Curves.linearToEaseOut,
                  duration: const Duration(seconds: 3),
                  child: Image.asset(
                    'assets/images/imgLogo.png',
                    fit: BoxFit.cover,
                  )),
            ),
          ),
        ));
  }
}
