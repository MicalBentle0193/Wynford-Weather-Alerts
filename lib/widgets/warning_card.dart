import 'package:flutter/material.dart';
import '../models/warning_model.dart';

class WarningCard extends StatelessWidget {
  final Warning warning;
  const WarningCard({required this.warning});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('${warning.type} - ${warning.severity}', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Issued: ${warning.timestamp}'),
            SizedBox(height: 8),
            Text('Description: ${warning.description}'),
            SizedBox(height: 8),
            Text('Safety Instructions: ${warning.safetyInstructions}'),
          ],
        ),
      ),
    );
  }
}
