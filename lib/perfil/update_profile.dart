import 'package:bookbox/authentication/service/auth_service.dart';
import 'package:bookbox/perfil/services/profile_service.dart';
import 'package:flutter/material.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfile();
}

class _UpdateProfile extends State<UpdateProfile> {
  ProfileService profileService = ProfileService();
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    profileService.getUser().then((user) {
      if (user['error'].isNotEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(user['error']),
          ),
        );
        return;
      }

      setState(() {
        name = user['name'];
        email = user['email'];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: IconButton(
        onPressed: () async {
          showBottomModal();
        },
        icon: const Icon(
          Icons.create,
          color: Colors.white,
        ),
      ),
    );
  }

  Future<void> showBottomModal() async {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 400,
          child: ListView(
            children: [
              const SizedBox(height: 10),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sing Out',
                    style: TextStyle(color: Colors.brown)),
                onTap: () {
                  AuthService().signOut();
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: const Text('Nome'),
                subtitle: Text(name),
                trailing: IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        TextEditingController nameController =
                            TextEditingController();

                        return AlertDialog(
                          title: const Text('Change Name'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text('Write your new name.'),
                              TextField(
                                controller: nameController,
                                decoration: const InputDecoration(
                                  labelText: 'Name',
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    AuthService()
                                        .updateName(name: nameController.text)
                                        .then(
                                      (value) {
                                        if (value == null) {
                                          setState(() {
                                            name = nameController.text;
                                          });
                                          Navigator.pop(context);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              backgroundColor: Colors.green,
                                              content: Text("Name changed."),
                                            ),
                                          );
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                              content: Text(value),
                                            ),
                                          );
                                        }
                                      },
                                    );
                                  },
                                  child: const Text('Change'),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              ListTile(
                leading: const Icon(Icons.email),
                title: const Text('E-mail'),
                subtitle: Text(email),
                trailing: IconButton(icon: const Icon(Icons.edit), onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController emailController =
                          TextEditingController();
                      TextEditingController passwordController =
                          TextEditingController();

                      return AlertDialog(
                        title: const Text('Change E-mail'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: emailController,
                              decoration: const InputDecoration(
                                labelText: 'E-mail',
                              ),
                            ),
                            TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  AuthService()
                                      .updateEmail(
                                          email: emailController.text,
                                          password: passwordController.text)
                                      .then(
                                    (value) {
                                      if (value == null) {
                                        setState(() {
                                          email = emailController.text;
                                        });
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text("E-mail changed."),
                                          ),
                                        );
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(value),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                child: const Text('Change'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },),
              ),
              ListTile(
                leading: const Icon(Icons.lock),
                title: const Text('Senha'),
                subtitle: const Text('********'),
                onTap: () {
                  showDialog(context: context, builder: (context) {
                    TextEditingController passwordController =
                        TextEditingController();
                    TextEditingController newPasswordController =
                        TextEditingController();

                    return AlertDialog(
                      title: const Text('Change Password'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: passwordController,
                            decoration: const InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                          ),
                          TextField(
                            controller: newPasswordController,
                            decoration: const InputDecoration(
                              labelText: 'New Password',
                            ),
                            obscureText: true,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: ElevatedButton(
                              onPressed: () async {
                                AuthService()
                                    .updatePassword(
                                        password: passwordController.text,
                                        newPassword:
                                            newPasswordController.text)
                                    .then(
                                  (value) {
                                    if (value == null) {
                                      Navigator.pop(context);
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text("Password changed."),
                                        ),
                                      );
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(value),
                                        ),
                                      );
                                    }
                                  },
                                );
                              },
                              child: const Text('Change'),
                            ),
                          ),
                        ],
                      ),
                    );
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Account',
                    style: TextStyle(color: Colors.red)),
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      TextEditingController passwordController =
                          TextEditingController();

                      return AlertDialog(
                        title: const Text('Delete Account'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                                'Write your password to delete account.'),
                            TextField(
                              controller: passwordController,
                              decoration: const InputDecoration(
                                labelText: 'Password',
                              ),
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: ElevatedButton(
                                onPressed: () async {
                                  AuthService()
                                      .deleteAccount(
                                          password: passwordController.text)
                                      .then(
                                    (value) {
                                      if (value == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            backgroundColor: Colors.green,
                                            content: Text("Account deleted."),
                                          ),
                                        );
                                        Navigator.pushReplacementNamed(
                                            context, '/');
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            content: Text(value),
                                          ),
                                        );
                                      }
                                    },
                                  );
                                },
                                child: const Text('Delete'),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
