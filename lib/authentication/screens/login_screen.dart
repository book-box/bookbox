import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:bookbox/common/camera_dialog.dart';
import 'package:bookbox/common/data/shared_paths.dart';
import 'package:bookbox/common/data/user_types.dart';
import 'package:bookbox/common/gradient.dart';
import 'package:bookbox/perfil/services/profile_service.dart';
import 'package:bookbox/authentication/service/auth_service.dart';

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
    _loadImage();
  }

  void _loadImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? image = prefs.getString(SharedPaths.createAccountImage);

    if (image != null && image.isNotEmpty) {
      setState(() {
        _image = File(image);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: GradientBook(
        Center(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              child: Form(
                key: _formKey,
                child: _buildForm(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: const Text("BOOKBOX"),
      centerTitle: true,
      backgroundColor: Colors.black,
    );
  }

  Column _buildForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (!isLogin) ...[
          _buildImageField(), // Campo de imagem no topo quando estiver criando conta
          const SizedBox(height: 10),
        ],
        _buildLogo(),
        const SizedBox(height: 16.0),
        _buildEmailField(),
        const SizedBox(height: 16.0),
        _buildPasswordField(),
        if (!isLogin) ...[
          const SizedBox(height: 16.0),
          _buildConfirmPasswordField(),
          const SizedBox(height: 16.0),
          _buildNameFields(),
          const SizedBox(height: 16.0),
          _buildBioField(),
          const SizedBox(height: 16.0),
          _buildUserTypeSelector(),
          const SizedBox(height: 16.0),
        ],
        const SizedBox(height: 16.0),
        _buildActionButtons(),
        const SizedBox(height: 30.0),
      ],
    );
  }

  Widget _buildLogo() {
    return Visibility(
      visible: isLogin,
      child: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Image(
          image: AssetImage('assets/images/Logo.png'),
          height: 77,
          width: 84,
        ),
      ),
    );
  }

  Widget _buildImageField() {
    return Visibility(
      visible: !isLogin,
      child: InkWell(
        onTap: () async {
          final img = await showCameraDialog(context);
          setState(() {
            _image = img;
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
          child: _image == null
              ? const Icon(Icons.camera_alt, color: Colors.white, size: 35)
              : ClipOval(
                  child: Image.file(
                    _image!,
                    fit: BoxFit.cover,
                    width: 140,
                    height: 140,
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: _inputDecoration('Email'),
      validator: _emailValidator,
    );
  }

  Widget _buildPasswordField() {
    return TextFormField(
      controller: _passwordController,
      obscureText: true,
      decoration: _inputDecoration('Senha'),
      validator: _passwordValidator,
    );
  }

  Widget _buildConfirmPasswordField() {
    return TextFormField(
      controller: _confirmPasswordController,
      obscureText: true,
      decoration: _inputDecoration('Confirmar Senha'),
      validator: _confirmPasswordValidator,
    );
  }

  Widget _buildNameFields() {
    return Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _firstNameController,
            decoration: _inputDecoration('Nome'),
            validator: _nameValidator,
          ),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: TextFormField(
            controller: _lastNameController,
            decoration: _inputDecoration('Sobrenome'),
            validator: _nameValidator,
          ),
        ),
      ],
    );
  }

  Widget _buildBioField() {
    return TextFormField(
      controller: _bioController,
      keyboardType: TextInputType.multiline,
      minLines: 4,
      maxLines: null,
      maxLength: 540,
      decoration: _inputDecoration('Bio...'),
    );
  }

  Widget _buildUserTypeSelector() {
    return Row(
      children: [
        // Reader radio button
        _userTypeRadioButton(UserTypes.reader, 'Leitor'),
        // Writer radio button
        _userTypeRadioButton(UserTypes.writer, 'Escritor'),
      ],
    );
  }

  Widget _userTypeRadioButton(UserTypes type, String label) {
    Color selectedColor = const Color(0xffb4eb3d);
    return Expanded(
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
            color: _userType == type ? selectedColor : null,
            fontSize: Checkbox.width * 0.8,
          ),
        ),
        leading: Radio<UserTypes>(
          value: type,
          groupValue: _userType,
          onChanged: (UserTypes? value) {
            setState(() {
              _userType = value;
            });
          },
          activeColor: selectedColor, // Define a cor do botão quando ativo
        ),
      ),
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: TextButton(
            onPressed: () => setState(() => isLogin = !isLogin),
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(isLogin ? 'Criar Conta' : 'Login'),
          ),
        ),
        Expanded(
          child: ElevatedButton(
            onPressed: send,
            style: TextButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 7, 7, 7),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: Text(isLogin ? 'Login' : 'Criar Conta'),
          ),
        ),
      ],
    );
  }

  // Métodos de validação
  String? _emailValidator(String? value) {
    if (value == null || value.isEmpty) return 'Insira um email';
    if (!value.contains('@') || !value.contains('.')) {
      return 'Insira um email válido';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.length < 4) {
      return 'Insira uma senha maior ';
    }
    return null;
  }

  String? _confirmPasswordValidator(String? value) {
    if (value != _passwordController.text) return 'Senha incorreta';
    return null;
  }

  String? _nameValidator(String? value) {
    if (value == null || value.length < 3) {
      return 'Insira um nome com pelo menos 3 caracteres';
    }
    return null;
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Colors.white,
          width: 4.0,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Color(0xff65d0e0),
          width: 4.0,
        ),
      ),
      focusColor: const Color(0xff65d0e0),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Color(0xffeb924b),
          width: 4.0,
        ),
      ),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(
          color: Color(0xffeb924b),
          width: 4.0,
        ),
      ),
      errorStyle: const TextStyle(
        color: Color(0xffeb924b),
        fontSize: 14,
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
                    showSnackBar(content: 'Email enviado', color: Colors.green);
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
