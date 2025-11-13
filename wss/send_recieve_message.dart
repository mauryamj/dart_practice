import 'dart:io';

void main() async {
  const websocketUrl = 'wss://echo.websocket.org';
  print("Connecting to the server at $websocketUrl...");

  try {
    final channel = await WebSocket.connect(websocketUrl);
    print('🎉 Connected! Type a message and press Enter. Type "exit" to quit.');

    channel.listen(
      (message) {
        print('Received: $message');
        promptAndSend(channel);
      },
      onDone: () {
        print('Connection closed by server.');
        exit(0);
      },
      onError: (error) {
        print('Error: $error');
        channel.close();
        exit(1);
      },
      cancelOnError: true,
    );
  } catch (e) {
    print('Error connecting to WebSocket: $e');
    exit(1);
  }
}

void promptAndSend(WebSocket channel) {
  stdout.write('Send: ');
  final input = stdin.readLineSync();

  if (input == null || input.toLowerCase() == 'exit') {
    print('Closing connection.');
    channel.close();
  } else {
    channel.add(input);
  }
}

