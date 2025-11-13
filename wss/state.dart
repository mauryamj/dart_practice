import 'dart:convert';
import 'dart:io';

void main() async {
  WebSocket channel = await WebSocket.connect("wss://echo.websocket.org");
  print('ready state: ${channel.readyState}');
  int count = 0;
  channel.listen((message) {
    print('Received: $message');
    count++;
    print(count);
  });
  channel.add('text message');
  channel.add([1, 2, 3, 4]);
  channel.add(utf8.encode('Encoded'));
  Future.delayed(Duration(seconds: 2), () {
    channel.close();
  });
}
