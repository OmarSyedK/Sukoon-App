import 'package:flutter/material.dart';

class IntroductionScreen extends StatelessWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Introduction'),
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF6A0DAD) // Deep Purple
            : const Color(0xFFDDA0DD),
      ),
      body: const IntroductionView(),
    );
  }
}

class IntroductionView extends StatelessWidget {
  const IntroductionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF1C1F2B) // Charcoal Blue background
            : const Color.fromRGBO(254, 254, 254, 1), // Light Pink Background
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return Image.asset(
                  'images/introduction.jpg',
                  width: 300,
                  height: 300,
                  fit: BoxFit.contain,
                );
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Welcome to Sukoon',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto', // Or any other preferred font
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Becoming a new mom is a transformative experience, filled with both joy and challenges. Caring for your newborn brings a mix of emotions, along with practical concerns like breastfeeding, sleep routines, diaper changes, and soothing techniques. With Sukoon, we’re here to guide and support you on this journey. Our app offers helpful video tutorials, step-by-step demonstrations, and many other features designed to assist you in navigating the early stages of motherhood. Trust your instincts, give yourself grace, and savor these precious moments with your child. Remember, you are not alone—Sukoon is here to provide the support you need every step of the way!!!\n PS: Sukoon is a Hindi word which translates to "Peace".',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Roboto', // Or any other preferred font
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
