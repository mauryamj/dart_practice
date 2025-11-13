import 'dart:io';
import 'dart:async';

void main() async {
  const websocketUrl = 'wss://echo.websocket.org';
  print('Connecting to $websocketUrl...');

  Timer? messageTimer;

  try {
    final channel = await WebSocket.connect(websocketUrl);
    print('🎉 Connected! Starting to send messages every 2 seconds.');

    // Listen for echos from the server
    channel.listen(
      (message) {
        print('Received: $message');
      },
      onDone: () {
        print('Connection closed.');
        messageTimer?.cancel(); // Stop the timer when the connection is done
        exit(0);
      },
      onError: (error) {
        print('Error: $error');
        messageTimer?.cancel(); // Stop the timer on error
        exit(1);
      },
      cancelOnError: true,
    );
    int count = 0;
    const message = 'I am a bot 🤖';
    messageTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      count++;
      print('Sending: $message $count');
      channel.add("$message $count");
    });
  } catch (e) {
    print('Failed to connect: $e');
    exit(1);
  }
}
