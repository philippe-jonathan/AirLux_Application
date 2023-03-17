import 'package:airlux/screens/automations_screen.dart';
import 'package:airlux/screens/ble_devices_screen.dart';
import 'package:airlux/screens/palces_screen.dart';
import 'package:airlux/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../widgets/custom_textfield.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Websocket server connection
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Accueil'),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            PopupMenuButton(
                icon: const Icon(Icons.add_box_outlined),
                itemBuilder: (context) {
                  return [
                    const PopupMenuItem<int>(
                      value: 0,
                      child: Text("Appareils"),
                    ),
                    const PopupMenuItem<int>(
                      value: 1,
                      child: Text("Lieux"),
                    ),
                    const PopupMenuItem<int>(
                      value: 2,
                      child: Text("Utillisateurs"),
                    ),
                    const PopupMenuItem(
                        value: 3, child: Text("Automatisations"))
                  ];
                },
                onSelected: (value) {
                  if (value == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BleDevices()),
                    );
                  } else if (value == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PlacesScreen()),
                    );
                  } else if (value == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UsersScreen()),
                    );
                  } else if (value == 3) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AutomationsScreen()),
                    );
                  }
                })
          ]),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bonjour
              Text(
                'Bonjour !',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              CustomTextfield(
                controller: emailController,
                emailText: false,
                hintText: 'Text',
                obscureText: false,
              ),
              StreamBuilder(
                stream: channel.stream,
                builder: (context, snapshot) {
                  return Text(snapshot.hasData ? '${snapshot.data}' : '');
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _sendMessage,
        tooltip: 'Send message',
        child: const Icon(Icons.send),
      ), //
    );
  }

  void _sendMessage() {
    if (emailController.text.isNotEmpty) {
      channel.sink.add(emailController.text);
    }
  }
}
