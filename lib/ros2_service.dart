import 'package:web_socket_channel/web_socket_channel.dart';

class ROS2Service {
  late WebSocketChannel _channel;
  bool _isConnected = false;

  Future<void> connect(String url) async {
    try {
      _channel = WebSocketChannel.connect(Uri.parse(url));
      _isConnected = true;
    } catch (e) {
      _isConnected = false;
      throw Exception('Failed to connect to ROS2 bridge: $e');
    }
  }

  void sendCommand(String command) {
    if (!_isConnected) {
      throw Exception('Not connected to ROS2 bridge');
    }
    _channel.sink.add(command);
  }

  Stream<double> getSpeedStream() {
    if (!_isConnected) {
      throw Exception('Not connected to ROS2 bridge');
    }
    return _channel.stream.map((data) {
      // Parse speed data from ROS2 message
      try {
        return double.parse(data);
      } catch (e) {
        return 0.0;
      }
    });
  }

  void disconnect() {
    _channel.sink.close();
    _isConnected = false;
  }

  bool get isConnected => _isConnected;
}