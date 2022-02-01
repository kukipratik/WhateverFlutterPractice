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
  bool iconChange = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return (Material(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
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
                (userName == '') ? "Welcome" : "Logging in as:\n '$userName' ",
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    onChanged: (value) {
                      userName = value;
                      setState(() {});
                    },
                    //The validator method returns a string containing the error message when the user input is invalid or null if the user input is valid
                    validator: (value) {
                      if (value != null) {
                        "User Name can't be empty.";
                      } else {
                        return null;
                      }
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
                  Material(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                    child: InkWell(
                      onTap: goToHomePage(),
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 1),
                        width: changeButton ? 50 : 140,
                        height: 40,
                        alignment: Alignment.center,
                        child: changeButton ? changeIcon() : logInText(),
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ),
      ),
    ));
  }

// going to HomePage....
  goToHomePage() {
    return (() async {
      if(_formKey.currentState!.validate()){
        // this if is to avoid the opening of to homepages...
      if (!iconChange) {
        setState(() {
          changeButton = true;
          iconChange = true;
        });
        // this await is to wait for 1s for animation...
        await Future.delayed(const Duration(seconds: 1));
        // and this await is to wait here when user goes back to login page again
        await Navigator.pushNamed(context, MyRoutes.home);
        setState(() {
          changeButton = false;
          iconChange = false;
        });
      }
      }
    });
  }

// when tapped single time...
  Icon changeIcon() => const Icon(
        Icons.done_all,
        color: Colors.white,
      );

// text in the button....
  Text logInText() {
    return const Text(
      "Login",
      style: TextStyle(
          fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
    );
  }
}
