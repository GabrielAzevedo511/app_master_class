import 'package:app_master_class/utils/activities/mock/money_app/logo.widget.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    Widget buildButton({
      required Widget child,
      Color color = Colors.white,
      required Function onTap,
    }) {
      return InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: EdgeInsets.all(screenSize.height * .02),
          alignment: Alignment.center,
          height: screenSize.height * .07,
          width: screenSize.width,
          decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(screenSize.height * .01)),
          child: child,
        ),
      );
    }

    Widget buildButtons() {
      return Column(
        children: [
          buildButton(
              child: const Text(
                'Sign Up with Email ID',
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
              onTap: () {
                print('Button1');
              },
              color: Theme.of(context).primaryColor),
          SizedBox(
            height: screenSize.height * .02,
          ),
          buildButton(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/icons/googleIcon.png',
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Text(
                    'Sign Up with Google',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ],
              ),
              onTap: () {
                print('Button2');
              },
              color: Colors.white),
        ],
      );
    }

    return Material(
      child: Container(
        color: Colors.black,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 6, child: Container()),
            LogoWidget(
              size: screenSize.height * .15,
            ),
            Expanded(flex: 1, child: Container()),
            const Text(
              'Get your Money\nUnder Control',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            Expanded(flex: 1, child: Container()),
            const Text(
              'Manage your expenses.\nSeamlessly.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 24),
            ),
            Expanded(flex: 4, child: Container()),
            buildButtons(),
            Expanded(child: Container()),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      print('Sign In');
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 18),
                    ))
              ],
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
    );
  }
}
