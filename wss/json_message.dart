import 'dart:convert';
import 'dart:io';

void main() async {
  const websocketUrl = "wss://echo.websocket.org";

  try {
    final channel = await WebSocket.connect(websocketUrl);
    print('🎉 Connected!');
    channel.listen(
      (message) {
        print("Received raw message: $message");
        if (message is String) {
          try {
            final data = jsonDecode(message) as Map<String, dynamic>;
            print("--- Parsed Data ---");
            print("Name: ${data['name']}");
            print("Age: ${data['age']}");
            print("Gender: ${data['gender']}");
            print("---------------------");
            print('Work complete. Closing connection.');
            channel.close();
          } catch (e) {
            print('Received a non-JSON message, ignoring.');
          }
        }
      },
      onDone: () {
        print('Connection closed.');
        exit(0);
      },
      onError: (error) {
        print('Error: $error');
        exit(1);
      },
    );
    final sendData = {'name': 'maurya', 'age': 20, 'gender': "male"};
    final jsonString = jsonEncode(sendData);
    print('Sending JSON: $jsonString');
    channel.add(jsonString);
  } catch (e) {
    print('Failed to connect or send message: $e');
    exit(1);
  }
}
