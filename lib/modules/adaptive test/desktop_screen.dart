import 'package:flutter/material.dart';
import 'package:product_app/shared/components.dart';

class DesktopScreen extends StatelessWidget {
  DesktopScreen({Key? key}) : super(key: key);
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              color: Colors.teal,
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login With Your Account',style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 10,
                ),
                defaultTextForm(
                    contentPadding: EdgeInsets.zero,
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                    outlineInputBorder: OutlineInputBorder()),
                const SizedBox(
                  height: 10,
                ),
                defaultTextForm(
                  contentPadding: EdgeInsets.zero,
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    label: 'password',
                    outlineInputBorder: OutlineInputBorder()),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        child: defaultMaterialTextButton(
                            onPressed: () {},
                            label: 'Login',
                            background: Colors.teal,
                            radius: 10)),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: defaultMaterialTextButton(
                            onPressed: () {},
                            label: 'Register',
                            background: Colors.teal,
                            radius: 10)),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
