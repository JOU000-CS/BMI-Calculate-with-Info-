import 'package:bmi_calclator/core/colors.dart';
import 'package:bmi_calclator/widgets/main_button.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final int weight;
  final int height;
  final int age;
  final bool isMale;

  const ResultScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.isMale,
  });

  double calculateBMI() {
    double heightInMeters = height / 100.0;
    return weight / (heightInMeters * heightInMeters);
  }

  Map<String, dynamic> getBMIStatus() {
    double bmi = calculateBMI();
    
    if (bmi < 18.5) {
      return {
        'status': 'UNDERWEIGHT',
        'description': isMale 
          ? 'You are underweight. Consider strength training and increased protein intake to build healthy muscle mass.'
          : 'You are underweight. Focus on nutritious, calorie-dense foods and consult a healthcare provider.',
        'color': Colors.blue,
      };
    } else if (bmi >= 18.5 && bmi < 25) {
      return {
        'status': 'NORMAL',
        'description': isMale
          ? 'Excellent! You have a healthy weight. Maintain with regular exercise and balanced nutrition.'
          : 'Perfect! You have a healthy weight. Continue with your current lifestyle and regular health checkups.',
        'color': Colors.green,
      };
    } else if (bmi >= 25 && bmi < 30) {
      return {
        'status': 'OVERWEIGHT',
        'description': isMale
          ? 'You are overweight. Focus on cardiovascular exercise and strength training to build lean muscle.'
          : 'You are overweight. Consider a balanced diet with regular cardio and resistance exercises.',
        'color': Colors.orange,
      };
    } else {
      return {
        'status': 'OBESE',
        'description': isMale
          ? 'You are in the obese category. Consult a healthcare provider for a comprehensive weight management plan.'
          : 'You are in the obese category. Please consult a doctor for personalized health and nutrition guidance.',
        'color': Colors.red,
      };
    }
  }

  String getHealthTips() {
    double bmi = calculateBMI();
    
    if (isMale) {
      if (bmi < 18.5) {
        return 'Men typically need 2,500-3,000 calories daily. Focus on protein-rich foods and compound exercises.';
      } else if (bmi >= 18.5 && bmi < 25) {
        return 'Maintain your weight with 150 minutes of moderate exercise weekly and balanced macronutrients.';
      } else if (bmi >= 25 && bmi < 30) {
        return 'Create a 500-calorie deficit daily. Men lose weight effectively with strength training + cardio.';
      } else {
        return 'Gradual weight loss of 1-2 lbs/week is safe. Consider professional guidance for sustainable results.';
      }
    } else {
      if (bmi < 18.5) {
        return 'Women need 2,000-2,400 calories daily. Include healthy fats and calcium-rich foods in your diet.';
      } else if (bmi >= 18.5 && bmi < 25) {
        return 'Great work! Women benefit from both cardio and strength training for bone health and metabolism.';
      } else if (bmi >= 25 && bmi < 30) {
        return 'Women respond well to consistent moderate exercise and mindful eating. Track progress beyond the scale.';
      } else {
        return 'Focus on sustainable lifestyle changes. Women may need different approaches during hormonal changes.';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double bmi = calculateBMI();
    Map<String, dynamic> bmiStatus = getBMIStatus();

    return Scaffold(
      backgroundColor: Appcolors.backgroundColor,
      appBar: AppBar(
        backgroundColor: Appcolors.backgroundColor,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'BMI Result',
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  constraints: BoxConstraints(
                    minHeight: MediaQuery.of(context).size.height * 0.7,
                  ),
                  decoration: BoxDecoration(
                    color: Appcolors.secondaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      bmiStatus['status'],
                      style: TextStyle(
                        color: bmiStatus['color'],
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Text(
                      bmi.toStringAsFixed(1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        bmiStatus['description'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: bmiStatus['color'].withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: bmiStatus['color'], width: 1),
                      ),
                      child: Column(
                        children: [
                          Icon(
                            Icons.lightbulb_outline,
                            color: bmiStatus['color'],
                            size: 24,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Health Tip',
                            style: TextStyle(
                              color: bmiStatus['color'],
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            getHealthTips(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Container(
                      padding: EdgeInsets.all(15),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Appcolors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'BMI Categories',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          _buildBMIRange('Underweight', '< 18.5', Colors.blue, bmi < 18.5),
                          _buildBMIRange('Normal', '18.5 - 24.9', Colors.green, bmi >= 18.5 && bmi < 25),
                          _buildBMIRange('Overweight', '25.0 - 29.9', Colors.orange, bmi >= 25 && bmi < 30),
                          _buildBMIRange('Obese', '≥ 30.0', Colors.red, bmi >= 30),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    
                    Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                        color: Appcolors.backgroundColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Gender:',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                isMale ? 'Male' : 'Female',
                                style: TextStyle(color: Appcolors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Age:',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                '$age years',
                                style: TextStyle(color: Appcolors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Height:',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                '$height cm',
                                style: TextStyle(color: Appcolors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Weight:',
                                style: TextStyle(color: Colors.white, fontSize: 16),
                              ),
                              Text(
                                '$weight kg',
                                style: TextStyle(color: Appcolors.primaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                MainButton(
                  onTap: () => Navigator.pop(context),
                  text: 'RE-CALCULATE',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBMIRange(String category, String range, Color color, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      margin: EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color: isActive ? color.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: isActive ? Border.all(color: color, width: 1) : null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            category,
            style: TextStyle(
              color: isActive ? color : Colors.white70,
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            range,
            style: TextStyle(
              color: isActive ? color : Colors.white70,
              fontSize: 14,
              fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
