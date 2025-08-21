import 'package:bmi_calclator/core/colors.dart';
import 'package:bmi_calclator/page/result_screen.dart';
import 'package:bmi_calclator/widgets/gender_card.dart';
import 'package:bmi_calclator/widgets/main_button.dart';
import 'package:bmi_calclator/widgets/weigh_age_card.dart';
import 'package:flutter/material.dart';

class bmi_clac extends StatefulWidget {
  const bmi_clac({super.key});

  @override
  State<bmi_clac> createState() => _bmi_clacState();
}

class _bmi_clacState extends State<bmi_clac> {
  int weight = 60;
  int age = 20;
  int height = 170;
  bool isMale = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        title: Text(
          'BMI Calculator',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 180,
                child: maleAndFemale(),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: heightUI(),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 180,
                child: weightAndAge(),
              ),
              SizedBox(height: 20),
              MainButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        weight: weight,
                        height: height,
                        age: age,
                        isMale: isMale,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget heightUI() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Appcolors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 10,
        children: [
            Text(
              'Height',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  height.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'cm',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Slider(
              value: height.toDouble(),
              onChanged: (value) {
                setState(() {
                  height = value.toInt();
                });
              },
              min: 80,
              max: 220,
              activeColor: Appcolors.primaryColor,
              inactiveColor: Appcolors.textColor,
            ),
          ],
        ),
      );
    }

  Widget maleAndFemale() {
    return Row(
      spacing: 10,
      children: [
          GenderCard(
            title: 'Male',
            icon: Icons.male,
            color: isMale ? Appcolors.primaryColor : Appcolors.secondaryColor,
            onTap: (){
              setState(() {
                isMale = true;
              });
            },
          ),
          GenderCard(
            title: 'Female',
            icon: Icons.female,
            color: !isMale ? Appcolors.primaryColor : Appcolors.secondaryColor,
            onTap: (){
              setState(() {
                isMale = false;
              });
            },
          ),
        ],
      );
    }

  Widget weightAndAge() {
    return Row(
      spacing: 10,
      children: [
          WeighAgeCard(
            title: 'Weight',
            value: weight,
            onAdd: () {
              setState(() {
                weight++;
              });
            },
            onRemove: () {
              setState(() {
                if (weight > 0) weight--;
              });
            },
          ),
          WeighAgeCard(
            title: 'Age',
            value: age,
            onAdd: () {
              setState(() {
                age++;
              });
            },
            onRemove: () {
              setState(() {
                if (age > 0) age--;
              });
            },
          ),
        ],
      );
    }
}