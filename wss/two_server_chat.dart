import 'dart:convert';
import 'dart:io';

void main() async {
  WebSocket server1 = await WebSocket.connect("wss://echo.websocket.org");
  WebSocket server2 = await WebSocket.connect("wss://ws.postman-echo.com/raw");
  server1.listen((message) => print("recieved by 1:$message"));
  server2.listen((message) => print("recieved by 2:$message"));

  stdin.transform(utf8.decoder).listen((input) {
    input = input.trim();
    if (input.toLowerCase() == 'quit') {
      server2.close();
      server1.close();
      exit(0);
    } else if (input.startsWith('1')) {
      print("sending from server1");
      server1.add("server 1");
    } else if (input.startsWith('2')) {
      print("sending from server1");
      server2.add("server 2");
    } else {
      print('❌ Invalid command!');
    }
  });
}
