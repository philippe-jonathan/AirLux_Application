import 'package:airlux/widgets/custom_card.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  UsersScreenState createState() => UsersScreenState();
}

class UsersScreenState extends State<UsersScreen> {
  // Tableau des cards
  List<CustomCard> cards = [
    CustomCard(
        icon: Icons.person,
        outlinedIcon: Icons.person_outline,
        title: "Jonathan Philippe",
        subtitle: "Autres informations",
        pillTextOn: "Autorisé",
        pillTextOff: "Non autorisé",
        switchValue: true,
        onSwitchChanged: (bool) {}),
    CustomCard(
        icon: Icons.person,
        outlinedIcon: Icons.person_outline,
        title: "Jonathan Philippe",
        subtitle: "Autres informations",
        pillTextOn: "Autorisé",
        pillTextOff: "Non autorisé",
        switchValue: true,
        onSwitchChanged: (bool) {}),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Utilisateurs'),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (BuildContext context, int index) {
            final card = cards[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  cards.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.lime,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    content: Text(
                      'Utilisateur supprimé',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                );
              },
              background: Container(
                margin: const EdgeInsets.all(8),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Icon(Icons.delete, color: Colors.white),
                    ),
                  ),
                ),
              ),
              child: card,
            );
          },
        ),
      ),
    );
  }
}
