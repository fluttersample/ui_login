import 'package:flutter/material.dart';

import 'login.dart';

class SplashSc extends StatefulWidget {
  const SplashSc({Key? key}) : super(key: key);

  @override
  State<SplashSc> createState() => _SplashScState();
}

class _SplashScState extends State<SplashSc> with
    TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animFade;
  late Animation<double> animTransform;
  @override
  void initState() {
    controller = AnimationController(vsync: this,
    duration: const Duration(seconds: 1));
    animFade = Tween(begin: 0.0,
    end: 1.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );


    animTransform = Tween<double>(
      begin: 100,
      end: 0
    ).animate(CurvedAnimation(parent: controller,
        curve: Curves.bounceOut));

    controller.forward();
    Future.delayed(const Duration(seconds: 2))
        .then((value) {
          Navigator.of(context).pushReplacement(MaterialPageRoute
            (builder: (context) => const LoginSc(),));
    });
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedBuilder(
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0,animTransform.value),
                  child: AnimatedOpacity(
                    opacity: animFade.value,
                    duration: const Duration(seconds: 1),
                    child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                            image:  DecorationImage(
                                image: AssetImage(('assets/sample.png')
                                )
                            ), shape: BoxShape.circle
                        )),
                  ),
                );
              },
              animation: controller,

            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Flutter_Sample',
              style: Theme.of(context).textTheme.headline1,
            ),
          ],
        ),
      ),
    );
  }
}
