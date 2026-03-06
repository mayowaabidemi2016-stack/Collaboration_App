import 'package:collaboration/Screens/pages/card.dart';
import 'package:collaboration/widgets/app_bar.dart';
import 'package:collaboration/widgets/small_text.dart';
import 'package:flutter/material.dart';

class LoginHome extends StatefulWidget {
  const LoginHome({super.key});

  @override
  State<LoginHome> createState() => _LoginHomeState();
}

class _LoginHomeState extends State<LoginHome> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: AppBarText(text: 'Teams Think '),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(text: 'Username'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter correct password';
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    label: Text('please enter a valid username'),
                  ),
                ),
                SizedBox(height: height / 21),
                BigText(text: 'Password'),
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter correct password';
                    } else {
                      return null;
                    }
                  },

                  decoration: InputDecoration(
                    label: Text('please enter a valid password'),
                  ),
                ),
                SizedBox(height: height / 21),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text('processing')));
                      }

                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return CardPage();
                          },
                        ),
                      );
                    },
                    child: Text('Login'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
