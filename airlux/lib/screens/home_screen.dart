import 'package:airlux/screens/automations_screen.dart';
import 'package:airlux/screens/ble_devices_screen.dart';
import 'package:airlux/screens/palces_screen.dart';
import 'package:airlux/screens/users_screen.dart';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:airlux/widgets/custom_card.dart';

import '../widgets/custom_textfield.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Websocket connection (test server)
  final testChannel = WebSocketChannel.connect(
    Uri.parse('wss://echo.websocket.events'),
  );

  // Websockets connections (local and cloud servers)
  // final localChannel =
  // WebSocketChannel.connect(Uri.parse('ws://localhost:8081'));
  // final cloudChannel = WebSocketChannel.connect(Uri.parse("wss://"));

  // Données pour le menu déroulant
  String? _selectedBuilding = 'Bâtiment 1';
  final List<String> _pages = ['Bâtiment 1', 'Bâtiment 2'];

  // Index de la pièce sélectionnée
  int _selectedRoomIndex = 0;

  // Liste des pièces
  final List<String> _building1 = [
    'Tout',
    'Entrée',
    'Salon',
    'Cuisine',
    'Chambre 1',
    'Chambre 2',
    'Chambre 3'
  ];
  final List<String> _building2 = [
    'Tout',
    'Salon',
    'Cuisine',
    'Chambre 1',
    'Chambre 2',
    'Bureau'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: const Text('Accueil'),
          title: DropdownButton<String>(
            value: _selectedBuilding,
            onChanged: (String? newValue) {
              setState(() {
                _selectedBuilding = newValue;
              });
            },
            underline: Container(),
            items: _pages.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            style: Theme.of(context).textTheme.titleLarge,
            icon: const Icon(Icons.keyboard_arrow_down),
          ),
          centerTitle: false,
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
          child: Column(
        children: [
          Container(
            // width: 100,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 20,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedBuilding == 'Bâtiment 1'
                  ? _building1.length
                  : _building2.length,
              itemBuilder: (BuildContext context, int index) {
                final String roomName = _selectedBuilding == 'Bâtiment 1'
                    ? _building1[index]
                    : _building2[index];
                final bool isSelected = index == _selectedRoomIndex;
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedRoomIndex = index;
                      });
                    },
                    child: Text(
                      roomName,
                      style: TextStyle(
                        color: isSelected ? Colors.lime : Colors.black,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 10)),
          CustomCard(
            icon: Icons.lightbulb,
            title: "Lumières",
            subtitle: "85 Lumières",
            pillText: "Tout",
            pillColor: Colors.lime,
            switchValue: true,
            onSwitchChanged: (bool) {},
          ),
          CustomCard(
            icon: Icons.sensor_window,
            title: "Volets",
            subtitle: "30 Volets",
            pillText: "Tout",
            pillColor: Colors.lime,
            switchValue: false,
            onSwitchChanged: (bool) {},
          )
        ],
      )),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _sendMessage,
      //   tooltip: 'Send message',
      //   child: const Icon(Icons.send),
      // ), //
    );
  }

  // void _sendMessage() {
  //   if (emailController.text.isNotEmpty) {
  //     testChannel.sink.add(emailController.text);
  //   }
  // }
}
