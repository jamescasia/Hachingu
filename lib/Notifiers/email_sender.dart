import 'package:flutter/material.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:hachingu/Utils/preferences.dart';

class EmailProvider with ChangeNotifier {
  HachinguPreferences hachinguPreferences = HachinguPreferences();
  bool _email = false;

  bool get email => _email;

  set email(bool value) {
    _email = value;
    hachinguPreferences.setEmails(value);
    notifyListeners();
  }

  EmailNotificationsEnabled(String user_email, TimeOfDay scheduled) async {
    String username = 'hachinguemailtest@gmail.com';
    String password = 'hachingu123';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username)
      ..recipients.add(user_email)
      ..subject = 'Hachingu Email Notifications Status'
      ..text = 'This is plain text'
      ..html =
          "<h1>Welcome to Hachingu!</h1><h2>You enabled email notifications!</h2><h2>From time to time, you'll get emails like this</h2>";

    double sched = toDouble(scheduled);
    print(sched);
    double now = toDouble(TimeOfDay.now());
    print(now);

    if (sched >= now && sched <= (now + (1.0 / 60.0))) {
      try {
        final sendReport = await send(message, smtpServer);
        print('Message sent ' + sendReport.toString());
        //Toast.show('You have turned on email notifications', context, duration: 3, gravity: Toast.CENTER);
      } on MailerException catch (e) {
        print('Message not sent');
      }
    }
  }

  double toDouble(TimeOfDay myTime) => myTime.hour + myTime.minute / 60.0;

  EmailNotificationsDisabled() async {
    String username = 'hachinguemailtest@gmail.com';
    String password = 'hachingu123';

    final smtpServer = gmail(username, password);

    final message = Message()
      ..from = Address(username)
      ..recipients.add('ardsbontilao2013@gmail.com')
      ..subject = 'Hachingu Email Notifications Status'
      ..text = 'This is plain text'
      ..html =
          "<h1>Hey there!</h1><h2>Looks like you disabled email notifications.</h2>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent ' + sendReport.toString());
      //Toast.show('You have turned on email notifications', context, duration: 3, gravity: Toast.CENTER);
    } on MailerException catch (e) {
      print('Message not sent');
    }
  }
}
