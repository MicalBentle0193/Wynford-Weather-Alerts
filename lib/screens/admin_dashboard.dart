import 'package:flutter/material.dart';
import '../utils/preset_fields.dart';
import '../services/firestore_service.dart';
import '../services/notification_service.dart';
import '../models/warning_model.dart';

class AdminDashboard extends StatefulWidget {
  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  String? selectedType;
  String description = '';
  final FirestoreService firestoreService = FirestoreService();
  final NotificationService notificationService = NotificationService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: selectedType,
              items: warningPresets.keys
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (val) => setState(() => selectedType = val),
              decoration: InputDecoration(labelText: 'Warning Type'),
            ),
            TextField(
              onChanged: (val) => description = val,
              decoration: InputDecoration(labelText: 'Additional Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (selectedType == null) return;
                final preset = warningPresets[selectedType!]!;
                final warning = Warning(
                  type: selectedType!,
                  severity: preset['severity'],
                  description: description,
                  safetyInstructions: preset['safetyInstructions'],
                  issuedBy: 'Admin',
                  timestamp: DateTime.now(),
                  active: true,
                );
                await firestoreService.addWarning(warning);
                await notificationService.showNotification(
                    'Weather Alert: ${warning.type}', warning.safetyInstructions);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Warning Issued')));
              },
              child: Text('Issue Warning'),
            ),
          ],
        ),
      ),
    );
  }
}
