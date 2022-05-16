import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../Login/sociallogin.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: [
        PageViewModel(
            title: '할 일 등록하기',
            body: '자신의 할 일을 등록할 수 있어요.',
            image: Image.asset('assets/images/dis_1.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: '우선순위',
            body: '할 일을 우선순위에 맞게 체계화해요.',
            image: Image.asset('assets/images/dis_2.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: '통계',
            body: '사용한 시간을 되돌아 볼 수 있어요',
            image: Image.asset('assets/images/dis_3.png'),
            decoration: getPageDecoration()),
        PageViewModel(
            title: '위젯',
            body: '바탕화면에 위젯을 설정할 수 있어요',
            image: Image.asset('assets/images/dis_1.png'),
            decoration: getPageDecoration()),
      ],
      done: const Text('done'),
      onDone: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SocialLogin()),
        );
      },
      next: const Icon(Icons.arrow_forward),
      showSkipButton: true,
      skip: const Text('skip'),
      dotsDecorator: DotsDecorator(
          color: Colors.cyan,
          size: const Size(10, 10),
          activeSize: const Size(22, 10),
          activeShape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
          activeColor: Colors.grey),
      curve: Curves.bounceOut,
    );
  }

  PageDecoration getPageDecoration() {
    return const PageDecoration(
        titleTextStyle: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        bodyTextStyle: TextStyle(fontSize: 18, color: Colors.blue),
        imagePadding: EdgeInsets.only(top: 40),
        pageColor: Colors.white);
  }
}
