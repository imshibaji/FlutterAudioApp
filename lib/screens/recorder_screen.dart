import 'package:flutter/material.dart';

class RecorderScreen extends StatelessWidget {
  const RecorderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        color: const Color.fromARGB(255, 28, 28, 28),
        width: double.infinity,
        height: double.infinity,
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 60,
                height: double.infinity,
                child: KeyBtn(icon: Icons.volume_up_outlined, onPressed: () {}),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 2.0),
                  child: Container(
                    color: const Color.fromARGB(255, 51, 51, 51),
                    width: double.infinity,
                    child:
                        ListView(scrollDirection: Axis.horizontal, children: [
                      Container(
                        decoration: BoxDecoration(border: Border.all()),
                        width: 100,
                        child: const Text(
                          '00:00',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ]),
                  ),
                ),
              ),
            ]),
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60),
      child: Container(
        color: const Color.fromARGB(255, 28, 28, 28),
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.exit_to_app_outlined,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Exit',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.rebase_edit,
                color: Colors.white,
                size: 20,
              ),
              tooltip: 'Edit',
            ),
            const Spacer(),
            const Text('00:00', style: TextStyle(color: Colors.white)),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Done',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class KeyBtn extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const KeyBtn({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2.0),
      child: InkWell(
        onTap: onPressed(),
        child: Container(
          color: const Color.fromARGB(136, 67, 67, 67),
          padding: const EdgeInsets.all(9.0),
          height: 60,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
