import 'package:coursework/resources/resources.dart';
import 'package:flutter/material.dart';

class ButtLive extends StatefulWidget {
  const ButtLive({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ButtLiveState();
}

class _ButtLiveState extends State<ButtLive> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /*_navigateToNextScreen(context);*/
      },
      child: Ink(
        height: 370,
        width: 430,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            image: DecorationImage(
                fit: BoxFit.cover, image: AssetImage(Images.live))),
      ),
    );
  }
}

/*
void _navigateToNextScreen(BuildContext context) {
  Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => const Lives()));
}
*/
