/*import 'package:flutter/material.dart';
import '../../config/theme.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _usernameController,
              label: 'Username',
              hintText: 'Enter your username',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              isPassword: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: () {
                // TODO: Implement login logic
                Navigator.pushReplacementNamed(context, '/home');
              },
              text: 'Login',
            ),
            const SizedBox(height: 24),
            const Center(child: Text('or')),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                // TODO: Implement Google login
              },
              text: 'Login with Google',
              icon: Image.asset('assets/images/google_icon.png', height: 24),
              backgroundColor: AppTheme.surfaceColor,
            ),
            const SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                // TODO: Implement Apple login
              },
              text: 'Login with Apple',
              icon: const Icon(Icons.apple),
              backgroundColor: AppTheme.surfaceColor,
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text("Don't have an account? Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../config/theme.dart';
import '../../widgets/common/custom_button.dart';
import '../../widgets/common/custom_text_field.dart';
import '../../controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    final username = _usernameController.text.trim();
    final password = _passwordController.text.trim();
    if (username.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter your credentials')),
      );
      return;
    }
    try {
      await context.read<AuthController>().login(username, password);
      Navigator.pushReplacementNamed(context, '/home');
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 32),
            CustomTextField(
              controller: _usernameController,
              label: 'Username',
              hintText: 'Enter your username',
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: _passwordController,
              label: 'Password',
              hintText: 'Enter your password',
              isPassword: true,
            ),
            const SizedBox(height: 32),
            CustomButton(
              onPressed: _handleLogin,
              text: 'Login',
            ),
            const SizedBox(height: 24),
            const Center(child: Text('or')),
            const SizedBox(height: 24),
            CustomButton(
              onPressed: () {
                // TODO: Implement Google login
              },
              text: 'Login with Google',
              icon: Image.asset('assets/images/google_icon.png', height: 24),
              backgroundColor: AppTheme.surfaceColor,
            ),
            const SizedBox(height: 16),
            CustomButton(
              onPressed: () {
                // TODO: Implement Apple login
              },
              text: 'Login with Apple',
              icon: const Icon(Icons.apple),
              backgroundColor: AppTheme.surfaceColor,
            ),
            const SizedBox(height: 24),
            Center(
              child: TextButton(
                onPressed: () => Navigator.pushNamed(context, '/register'),
                child: const Text("Don't have an account? Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
