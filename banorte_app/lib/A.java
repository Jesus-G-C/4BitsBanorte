import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer'; // Import for using log

// ... inside your MyHomePageState or relevant Widget state ...

  @override
  void initState() {
    super.initState();
    _getFCMToken();
    _setupForegroundMessageHandling(); // Set up foreground message listener
  }

  Future<void> _getFCMToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    log('User granted permission: ${settings.authorizationStatus}');

    if (settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional) {
      try {
        String? token = await messaging.getToken();
        if (token != null) {
          log('FCM Device Token: $token');
          // TODO: Send this token to your backend server and associate it with the user.
          _sendTokenToBackend(token); // Call function to send token to backend
        } else {
          log('Failed to get FCM token.');
        }
      } catch (e) {
        log('Error getting FCM token: $e');
      }
    } else {
      log('Push notification permission denied.');
    }
  }

  Future<void> _sendTokenToBackend(String token) async {
    // Replace with your actual backend API endpoint and logic to send the token.
    // You'll likely need to authenticate the user and associate the token with their account.
    // Example (using http package, you'll need to add http: ^latest to pubspec.yaml):
    // import 'package:http/http.dart' as http;
    // final response = await http.post(
    //   Uri.parse('YOUR_BACKEND_API_ENDPOINT/register-fcm-token'),
    //   body: {'token': token, 'userId': /* ... get user ID ... */},
    // );
    // if (response.statusCode == 200) {
    //   log('FCM token sent to backend successfully.');
    // } else {
    //   log('Failed to send FCM token to backend. Status code: ${response.statusCode}');
    // }
    log('TODO: Send FCM token to backend: $token'); // Placeholder - REMOVE THIS and implement backend communication
  }


  void _setupForegroundMessageHandling() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        _showNotification(message.notification!); // Display notification in foreground
      }
    });
  }

  void _showNotification(RemoteNotification notification) {
    // In a real app, you might use a local notifications plugin for more customization.
    // For a simple example, you can use a Dialog or Snackbar to show the notification in the foreground.
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(notification.title ?? 'New Transaction'),
        content: Text(notification.body ?? 'You have a new transaction.'),
        actions: <Widget>[
          TextButton(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  // ... rest of your MyHomePageState and build method ...