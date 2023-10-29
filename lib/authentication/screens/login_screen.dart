import 'dart:io';

import 'package:bookbox/common/camera_dialog.dart';
import 'package:bookbox/common/data/shared_paths.dart';
import 'package:bookbox/common/data/user_types.dart';
import 'package:bookbox/common/gradient.dart';
import 'package:bookbox/perfil/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../service/auth_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  bool isLogin = true;
  AuthService authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  UserTypes? _userType = UserTypes.reader;
  File? _image;

  @override
  void initState() {
    super.initState();

    SharedPreferences.getInstance().then((prefs) {
      String? image = prefs.getString(SharedPaths.createAccountImage);

      if (image != null && image.isNotEmpty) {
        setState(() {
          _image = File(image);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BOOKBOX",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: GradientBook(
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Visibility(
                      visible: isLogin,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Image(
                          image: Image.asset('assets/images/Logo.png').image,
                          height: 77,
                          width: 84,
                        ),
                      ),
                    ),
                    Text(
                      (isLogin) ? 'Login' : 'Create an Account',
                      style: const TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: !isLogin,
                      child: InkWell(
                        onTap: () async {
                          showCameraDialog(context).then((img) {
                            setState(() {
                              _image = img;
                            });
                          });
                        },
                        child: Container(
                          height: 140,
                          width: 140,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white70,
                          ),
                          alignment: Alignment.center,
                          child: (_image == null)
                              ? const Center(
                                  child: Icon(
                                    Icons.create,
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(70),
                                  child: Image.file(
                                    _image!,
                                    fit: BoxFit.cover,
                                    width: 140,
                                    height: 140,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    Visibility(
                        visible: !isLogin, child: const SizedBox(height: 32)),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 6,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            color: Colors.white,
                            style: BorderStyle.solid,
                            width: 6,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(30)),
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 4) {
                          return 'Please enter your password';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: isLogin,
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              forgotMyPassword();
                            },
                            child: const Text(
                              'Forgot my password',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16.0),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !isLogin,
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Confirm Password',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 6,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.length < 4) {
                            return 'Please enter your password';
                          } else if (value != _passwordController.text) {
                            return 'Passwords do not match';
                          }

                          return null;
                        },
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: !isLogin,
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              controller: _firstNameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                labelText: 'First Name',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 6,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.length < 3) {
                                  return 'Please enter your first name';
                                }

                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 16.0),
                          Expanded(
                            child: TextFormField(
                              controller: _lastNameController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                labelText: 'Last Name',
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 16, horizontal: 20),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    color: Colors.white,
                                    style: BorderStyle.solid,
                                    width: 6,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  borderSide: BorderSide(
                                    style: BorderStyle.solid,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null || value.length < 3) {
                                  return 'Please enter your last name';
                                }

                                return null;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: !isLogin,
                      child: TextFormField(
                        controller: _bioController,
                        keyboardType: TextInputType.multiline,
                        minLines: 4,
                        maxLines: null,
                        maxLength: 160,
                        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.left,
                        decoration: const InputDecoration(
                          labelText: 'Bio...',
                          alignLabelWithHint: true,
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 20),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              color: Colors.white,
                              style: BorderStyle.solid,
                              width: 6,
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            borderSide: BorderSide(
                              style: BorderStyle.solid,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Visibility(
                      visible: !isLogin,
                      child: Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio<UserTypes>(
                                  value: UserTypes.reader,
                                  groupValue: _userType,
                                  onChanged: (UserTypes? value) {
                                    setState(() {
                                      _userType = value;
                                    });
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                const Text('Reader')
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Radio<UserTypes>(
                                  value: UserTypes.writer,
                                  groupValue: _userType,
                                  onChanged: (UserTypes? value) {
                                    setState(() {
                                      _userType = value;
                                    });
                                  },
                                ),
                                const SizedBox(width: 4.0),
                                const Text('Writer')
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              setState(() {
                                isLogin = !isLogin;
                              });
                            },
                            child: Text(
                              (isLogin) ? 'Create an Account' : 'Login',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              send();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 238, 238, 238),
                              shape: const StadiumBorder(),
                            ),
                            child: Text(
                              (isLogin) ? 'Login' : 'Create Account',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void send() {
    if (_formKey.currentState!.validate()) {
      if (isLogin) {
        authService
            .signIn(
          email: _emailController.text.trim(),
          password: _passwordController.text,
        )
            .then(
          (error) {
            if (error != null) {
              showSnackBar(content: error, color: Colors.black);
            }
          },
        );
      } else {
        authService
            .signUp(
          email: _emailController.text.trim(),
          password: _passwordController.text,
          name:
              '${_firstNameController.text.trim()} ${_lastNameController.text.trim()}',
        )
            .then(
          (error) {
            if (error != null) {
              showSnackBar(content: error, color: Colors.black);
            } else {
              ProfileService().updateUserBio(bio: _bioController.text.trim());
            }
          },
        );
      }
    }
  }

  void forgotMyPassword() {
    showDialog(
      context: context,
      builder: (context) {
        TextEditingController confirmEmailController = TextEditingController();

        return AlertDialog(
          title: const Text('Enter your email'),
          content: TextFormField(
            controller: confirmEmailController,
            decoration: const InputDecoration(
              labelText: 'Email',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              } else if (!value.contains('@') || !value.contains('.')) {
                return 'Please enter a valid email';
              }

              return null;
            },
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(32)),
          ),
          actions: [
            TextButton(
              onPressed: () {
                authService
                    .resetPassword(email: confirmEmailController.text.trim())
                    .then((error) {
                  if (error == null) {
                    showSnackBar(content: 'Email sent', color: Colors.green);
                  } else {
                    showSnackBar(content: error, color: Colors.black);
                  }

                  Navigator.pop(context);
                });
              },
              child: const Text('Reset password'),
            ),
          ],
        );
      },
    );
  }

  void showSnackBar({required String content, required Color color}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: const TextStyle(color: Colors.white70),
        ),
        backgroundColor: color,
      ),
    );
  }
}
