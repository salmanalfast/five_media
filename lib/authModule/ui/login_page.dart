import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

/*final _form = GlobalKey<FormState>();

class LoginPageClass extends StatefulWidget {
  const LoginPageClass({super.key});

  @override
  State<LoginPageClass> createState() => _LoginPageClassState();
}

class _LoginPageClassState extends State<LoginPageClass> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Spacer(),
          Image.asset(
            "images/letter-f.png",
            height: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Form(
            child: Column(
              children: [
                const Text("Username"),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Insert Your Username";
                    }
                    return null;
                  },
                ),
                const Text("Password"),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please Insert Your Password";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_form.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Logged In"),
                        ),
                      );
                    }
                  },
                  child: const Text("Login"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/

final _formkey = GlobalKey<FormState>();

class LoginPageClass extends StatefulWidget {
  const LoginPageClass({super.key});

  @override
  State<LoginPageClass> createState() => _LoginPageClassState();
}

class _LoginPageClassState extends State<LoginPageClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
          ]),
      home: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                "images/letter-f.png",
                height: 200,
              ),
              const SizedBox(
                height: 50.0,
              ),
              Form(
                key: _formkey,
                child: Column(
                  children: [
                    const Text("Username"),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Insert Your Username";
                        }
                        return null;
                      },
                    ),
                    const Text("Password"),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please Insert Your Password";
                        }
                        return null;
                      },
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Logged In"),
                            ),
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
                    const Spacer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
