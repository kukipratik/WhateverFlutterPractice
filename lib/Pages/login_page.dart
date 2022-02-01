import 'package:flutter/material.dart';
import 'package:flutterpractice/routes.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  // making attributes...
  String userName = '';
  bool changeButton = false;
  bool doubleTap = false;

  @override
  Widget build(BuildContext context) {
    return (Material(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // providing some space..
            const SizedBox(
              height: 40,
            ),
            // providing image...
            Image.asset("images/login.png"),

            const SizedBox(
              height: 20,
            ),

            Text(
              'Welcome $userName',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(children: [
                  // for Entering username...
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("User Name"),
                      hintText: "Enter your UserName",
                      border: OutlineInputBorder(),
                    ),
                    onFieldSubmitted: (value) {
                      userName = value;
                      setState(() {});
                    },
                  ),
                  // providing some space..
                  const SizedBox(
                    height: 20,
                  ),
                  // for entering password...
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      label: Text("Pin Password"),
                      hintText: "Enter your Password",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  // providing some space..
                  const SizedBox(
                    height: 20,
                  ),

                  //Using Animated container with InkWell.................
                  InkWell(
                    onDoubleTap: () {
                      setState(() {
                        changeButton = !changeButton;
                        doubleTap = !doubleTap;
                      });
                    },
                    onTap: () async {
                      setState(() {
                        changeButton = true;
                      });
                      await Future.delayed(const Duration(seconds: 1));
                      Navigator.pushNamed(context, MyRoutes.home);
                    },
                    child: AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      width: changeButton ? 50 : 140,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius: BorderRadius.all(
                              Radius.circular(changeButton ? 50 : 8)),
                          shape: BoxShape.rectangle),
                      child: changeButton
                          ? (doubleTap ? (itsDoubleTap()) : (itsSingleTap()))
                          : (logInText()),
                    ),
                  ),
                ]))
          ],
        ),
      ),
    ));
  }

// when tapped single time...
  Icon itsSingleTap() {
    return const Icon(
      Icons.done_all,
      color: Colors.white,
    );
  }

// when tapped double time...
  Icon itsDoubleTap() => const Icon(
        Icons.help_outline,
        color: Colors.white,
      );
      
// text in the button....
  Text logInText() => const Text(
        "Login",
        style: TextStyle(
            fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      );
}
