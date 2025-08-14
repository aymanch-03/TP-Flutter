import 'package:flutter/material.dart';
import 'package:demo_app_2/widgets/mydrawer.widget.dart';

class ContactsPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'name': 'John Doe',
      'email': 'john.doe@example.com',
      'phone': '+1 202 555 0123'
    },
    {
      'name': 'Jane Smith',
      'email': 'jane.smith@example.com',
      'phone': '+44 20 7946 0958'
    },
    {
      'name': 'Michael Johnson',
      'email': 'michael.johnson@example.com',
      'phone': '+1 202 555 0199'
    },
    {
      'name': 'Emily Davis',
      'email': 'emily.davis@example.com',
      'phone': '+33 1 23 45 67 89'
    },
    {
      'name': 'David Brown',
      'email': 'david.brown@example.com',
      'phone': '+49 30 12345678'
    },
    {
      'name': 'Sarah Wilson',
      'email': 'sarah.wilson@example.com',
      'phone': '+1 202 555 0147'
    },
    {
      'name': 'Robert Miller',
      'email': 'robert.miller@example.com',
      'phone': '+61 2 9876 5432'
    },
    {
      'name': 'Laura Taylor',
      'email': 'laura.taylor@example.com',
      'phone': '+34 912 34 56 78'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(title: const Text("Contacts")),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          final initials = contact['name']!.split(' ').map((e) => e[0]).join();

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepOrange,
                child: Text(
                  initials,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              title: Text(contact['name']!),
              subtitle: Text("${contact['email']}\n${contact['phone']}"),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
              },
            ),
          );
        },
      ),
    );
  }
}
