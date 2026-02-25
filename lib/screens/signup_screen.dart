import 'package:flutter/material.dart';
import 'login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final name = TextEditingController();
  final email = TextEditingController();
  final pass  = TextEditingController();
  bool obscure = true;
  final _formkey = GlobalKey<FormState>();

  @override
  void dispose() {
    name.dispose(); email.dispose(); pass.dispose();
    super.dispose();
  }

  void _signup() {
    // TODO: هنا ممكن ترجّع Login أو تروح Home حسب سيناريوك
 ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Logged in (demo)')));
    if (_formkey.currentState!.validate()) {
      Navigator.pop(
        context,
      );
    }  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft, end: Alignment.bottomRight,
            colors: [Color(0xFFFDFEFF), Color(0xFFF6F7FB)],
          ),
        ),
        child: SafeArea(
          child: Form(
            key: _formkey,
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              children: [
                // AppBar بسيط (menu + settings)
                Row(
                  children: [
                    IconButton(onPressed: () => Navigator.pop(context), icon: const Icon(Icons.menu_rounded)),
                    const Spacer(),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.settings_outlined)),
                  ],
                ),
                const SizedBox(height: 6),
            
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Signup', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
                ),
            
TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'invalid name';
                    return null;
                  },                  controller: name,
                  textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    labelText: 'Your Name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 12),
            
TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'invalid email';
                     if(!value.contains('@gmail.com')) return '@gmail.com';
                    return null;
                  },                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.mail_outline),
                  ),
                ),
                const SizedBox(height: 12),
            
TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'invalid pass';
                    if(value.length<7)return 'very short';
                    return null;
                  },                  controller: pass,
                  obscureText: obscure,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        obscure
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ),
                      onPressed: () => setState(() => obscure = !obscure),
                    ),
                  ),
                ),
                const SizedBox(height: 18),
            
                SizedBox(
                  height: 48,
                  child: FilledButton(
                    style: FilledButton.styleFrom(
                      shape: const StadiumBorder(),
                      backgroundColor: const Color(0xFF8A8DFF),
                    ),
                    onPressed: _signup,
                    child: const Text('Signup'),
                  ),
                ),
                const SizedBox(height: 10),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account?  '),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => const LoginScreen()),
                        );
                      },
                      child: const Text('Login',
                          style: TextStyle(color: Color(0xFF8A8DFF), fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
