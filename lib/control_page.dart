import 'package:flutter/material.dart';

class ControlPage extends StatefulWidget {
  const ControlPage({super.key});

  @override
  State<ControlPage> createState() => _ControlPageState();
}

class _ControlPageState extends State<ControlPage> {
  double speed = 0.0;
  bool showLightControls = false;

  void _sendCommand(String command) {
    // TODO: Implement ROS2 command sending
    print('Sending command: $command');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vehicle Control'),
        actions: [
          IconButton(
            icon: const Icon(Icons.lightbulb),
            onPressed: () {
              setState(() {
                showLightControls = !showLightControls;
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Speed: ${speed.toStringAsFixed(1)} km/h',
              style: const TextStyle(fontSize: 24),
            ),
          ),
          if (showLightControls) ...[
            const Divider(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Lighting Controls', style: TextStyle(fontSize: 18)),
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _buildLightButton('High Beam', Icons.highlight, 'high_beam'),
                _buildLightButton('Low Beam', Icons.lightbulb, 'low_beam'),
                _buildLightButton('Single Wipe', Icons.clean_hands, 'single_wipe'),
                _buildLightButton('Continuous Wipe', Icons.water_drop, 'continuous_wipe'),
                _buildLightButton('Left Indicator', Icons.turn_left, 'left_indicator'),
                _buildLightButton('Right Indicator', Icons.turn_right, 'right_indicator'),
                _buildLightButton('Brake Light', Icons.car_crash, 'brake_light'),
                _buildLightButton('Open Bonnet', Icons.car_repair, 'open_bonnet'),
                _buildLightButton('Open Diggi', Icons.construction, 'open_diggi'),
              ],
            ),
          ],
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                _sendCommand('emergency_stop');
              },
              child: const Text(
                'EMERGENCY STOP',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLightButton(String label, IconData icon, String command) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      onPressed: () {
        _sendCommand(command);
      },
    );
  }
}