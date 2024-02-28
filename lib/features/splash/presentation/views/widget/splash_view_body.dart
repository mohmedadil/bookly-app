import 'package:bookly/constants.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/splash/presentation/views/widget/animated_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();
    initslidingAnimation();
    navigatetohome();
  }

  @override
  void dispose() {
    animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
            width: MediaQuery.sizeOf(context).width - 120,
            height: MediaQuery.sizeOf(context).width - 120,
            child: Image.asset(AssetsData.logo)),
        AnimatedText(slidingAnimation: slidingAnimation)
      ],
    );
  }

  void navigatetohome() {
    Future.delayed(Duration(seconds: 2), () {
       GoRouter.of(context).push('/home');
      // Get.to(() => const HomeView(),
      //     transition: Transition.fade, duration: kTransitionDuration);
    });
   
  }

  void initslidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 5), end: const Offset(0, 0))
            .animate(animationController);
    animationController.forward();
  }
}
