import 'package:flutter/material.dart';

class IconBadge extends StatefulWidget {
  final IconData icon;

  const IconBadge({Key key, @required this.icon}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IconBadgeState createState() => _IconBadgeState();
}

class _IconBadgeState extends State<IconBadge> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Icon(
          widget.icon,
        ),
        Positioned(
          right: 0.0,
          child: Container(
            padding: const EdgeInsets.all(1),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondary,
              borderRadius: BorderRadius.circular(6),
            ),
            constraints: const BoxConstraints(
              minWidth: 13,
              minHeight: 13,
            ),
            child: const Padding(
              padding: EdgeInsets.only(top: 1),
              child: Text(
                '2',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 8,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
