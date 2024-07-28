import 'package:flutter/material.dart';

class CustomDialog {
  final BuildContext context;

  CustomDialog._(this.context);

  static CustomDialog of(BuildContext context) {
    return CustomDialog._(context);
  }

  Future<bool?> confirmLogout() async {
    return showDialog<bool?>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Alert'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop(); // Dismiss the dialog
              },
            ),
            TextButton(
              style: TextButton.styleFrom(foregroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm the logout
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}
