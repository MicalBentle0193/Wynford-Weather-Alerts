class Warning {
  final String type;
  final String severity;
  final String description;
  final String safetyInstructions;
  final String issuedBy;
  final DateTime timestamp;
  final bool active;

  Warning({
    required this.type,
    required this.severity,
    required this.description,
    required this.safetyInstructions,
    required this.issuedBy,
    required this.timestamp,
    required this.active,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'severity': severity,
      'description': description,
      'safetyInstructions': safetyInstructions,
      'issuedBy': issuedBy,
      'timestamp': timestamp,
      'active': active,
    };
  }

  factory Warning.fromMap(Map<String, dynamic> map) {
    return Warning(
      type: map['type'],
      severity: map['severity'],
      description: map['description'],
      safetyInstructions: map['safetyInstructions'],
      issuedBy: map['issuedBy'],
      timestamp: (map['timestamp'] as Timestamp).toDate(),
      active: map['active'],
    );
  }
}
