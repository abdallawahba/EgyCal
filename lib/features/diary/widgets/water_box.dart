import 'package:flutter/material.dart';

class WaterBottleIndicator extends StatelessWidget {
  final double intake;
  final double goal;

  const WaterBottleIndicator({
    super.key,
    required this.intake,
    required this.goal,
  });

  @override
  Widget build(BuildContext context) {
    final percent = (intake / goal).clamp(0.0, 1.0);
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        width: 40,
        height: 100,
        color: Colors.grey[300],
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            FractionallySizedBox(
              heightFactor: percent.clamp(0.0, 1.0),
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      const BorderRadius.vertical(bottom: Radius.circular(20)),
                  gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFB0E5F9),
                      Color(0xFF30BCE2),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: Text(
                '${(percent * 100).round()}%',
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
