import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:raaqib_admin_frontend/common/global.dart';

class RecentPostSocket {
  RecentPostSocket() {
    init();
  }
  late io.Socket socket;

  init() {
    socket = io.io(uri, {
      "transports": ["websocket"],
      "autoConnect": false,
    });
    socket.connect();
    socket.onConnect((_) => print("Connected to the Recent posts"));
    socket.onDisconnect((_) => print("Dissconnected from the Recent posts"));
  }
}
