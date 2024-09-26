import 'package:flutter/material.dart';

class ScheduleButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ScheduleButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 5,
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        shape: const StadiumBorder(),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.black.withOpacity(0.5),
      ),
      child: Ink(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color.fromARGB(162, 220, 6, 244),
              const Color.fromARGB(95, 87, 55, 13),
              const Color.fromARGB(139, 182, 6, 246),
              const Color.fromARGB(92, 78, 43, 0),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: const Center(
            child: Text(
              'Entrar',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
