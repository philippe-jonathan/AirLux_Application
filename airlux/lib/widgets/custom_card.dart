import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  final IconData icon;
  final IconData outlinedIcon;
  final String title;
  final String subtitle;
  final String pillTextOn;
  final String pillTextOff;
  final bool switchValue;
  final String? building;
  final String? room;
  final Function(bool) onSwitchChanged;

  const CustomCard({
    super.key,
    required this.icon,
    required this.outlinedIcon,
    required this.title,
    required this.subtitle,
    required this.pillTextOn,
    required this.pillTextOff,
    required this.switchValue,
    this.building,
    this.room,
    required this.onSwitchChanged,
  });

  @override
  CustomCardState createState() => CustomCardState();
}

class CustomCardState extends State<CustomCard> {
  late bool _switchValue;

  @override
  void initState() {
    super.initState();
    _switchValue = widget.switchValue;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  // widget.icon,
                  _switchValue ? widget.icon : widget.outlinedIcon,
                  size: 40,
                ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: _switchValue ? Colors.lime : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    _switchValue ? widget.pillTextOn : widget.pillTextOff,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Expanded(
                        child: SizedBox(
                          width: 95,
                          child: Text(
                            widget.title,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.subtitle,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (value) {
                    setState(() {
                      _switchValue = value;
                    });
                    widget.onSwitchChanged(value);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
