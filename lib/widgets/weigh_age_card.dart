import 'package:bmi_calclator/core/colors.dart';
import 'package:flutter/material.dart';

class WeighAgeCard extends StatelessWidget {
  const WeighAgeCard({
    super.key, required this.title, required this.value, required this.onAdd, required this.onRemove
  });

  final String title;
  final int value;
  final Function() onAdd;
  final Function() onRemove;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: Appcolors.secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              value.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Appcolors.textColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    onRemove();
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  style: IconButton.styleFrom(
                    backgroundColor: Appcolors.textColor,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    onAdd();
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
