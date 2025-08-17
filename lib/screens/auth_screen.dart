import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthScreen extends StatefulWidget {
  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  final TextEditingController _adminPasswordController = TextEditingController();

  String _role = 'public';
  bool _smsSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login - Wynford Weather Mission')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: _phoneController, decoration: InputDecoration(labelText: 'Phone Number')),
            if (_smsSent)
              TextField(controller: _smsController, decoration: InputDecoration(labelText: 'SMS Code')),
            if (!_smsSent)
              ElevatedButton(
                  onPressed: () async {
                    await AuthService().sendSms(_phoneController.text);
                    setState(() => _smsSent = true);
                  },
                  child: Text('Send SMS Code')),
            if (_smsSent)
              ElevatedButton(
                  onPressed: () async {
                    bool success = await AuthService().verifySms(_smsController.text);
                    if (success) {
                      if (_adminPasswordController.text == '84367ACb\$') {
                        Navigator.pushReplacementNamed(context, '/admin');
                      } else {
                        Navigator.pushReplacementNamed(context, '/public');
                      }
                    }
                  },
                  child: Text('Verify & Login')),
            if (_smsSent)
              TextField(
                  controller: _adminPasswordController,
                  decoration: InputDecoration(labelText: 'Admin Password (if applicable)'),
                  obscureText: true),
          ],
        ),
      ),
    );
  }
}
