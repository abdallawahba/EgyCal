import 'package:egycal/features/diary/widgets/water_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/models/current_users_data_model.dart';

class WaterCard extends StatefulWidget {
  const WaterCard({super.key});
  @override
  State<WaterCard> createState() => _WaterCardState();
}

class _WaterCardState extends State<WaterCard> {
  double intake = 0;
  @override
  Widget build(BuildContext context) {
    final double goal = Provider.of<CurrentUserDataModel>(context).goalWaterL!;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      shadowColor: Colors.white,
      color: Colors.grey[50],
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Water Intake',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 8),
                  Text.rich(
                    TextSpan(
                      text: intake.toStringAsFixed(1),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18),
                      children: [
                        TextSpan(
                          text: ' / $goal L',
                          style: const TextStyle(
                              fontWeight: FontWeight.normal, fontSize: 14),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    width: 35,
                    height: 35,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (intake < goal) {
                              setState(() {
                                intake += 0.1;
                                if (intake > goal) intake = goal;
                              });
                            }
                          });
                        },
                        iconSize: 20,
                        icon: const Icon(Icons.add)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey[300],
                    ),
                    width: 35,
                    height: 35,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            if (intake > 0.0) {
                              setState(() {
                                intake -= 0.1;
                                if (intake < 0.0) intake = 0.0;
                              });
                            }
                          });
                        },
                        iconSize: 20,
                        icon: const Icon(Icons.remove)),
                  ),
                )
              ],
            ),
            SizedBox(width: 8,),
            WaterBottleIndicator(intake: intake, goal: goal),
          ],
        ),
      ),
    );
  }
}
