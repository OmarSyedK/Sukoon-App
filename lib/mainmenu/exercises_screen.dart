import 'package:flutter/material.dart';

class ExercisesScreen extends StatelessWidget {
  const ExercisesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercises'),
        backgroundColor: const Color.fromRGBO(241, 191, 220, 1),
      ),
      body: const ExercisesView(),
    );
  }
}

class ExercisesView extends StatelessWidget {
  const ExercisesView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Bold heading
          const Text(
            'Importance of Exercise',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),

          // Image centered
          Center(
            child: Image.asset('images/exercise.jpg'),
          ),
          const SizedBox(height: 16),

          // Subheading
          const Text(
            'Understanding the vitality of safe exercise for mothers',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 16),

          // Bullet point paragraphs
          const BulletPointParagraph(
              text:
                  'Exercise during pregnancy is of paramount importance for both the mother and the baby\'s well-being. Engaging in regular physical activity helps maintain a healthy weight, and enhances overall mood and energy levels.'),
          const BulletPointParagraph(
              text:
                  'It can also alleviate common discomforts like backaches and swelling. Additionally, exercise promotes better sleep quality and prepares the body for labour and delivery by improving endurance and strength.'),
          const BulletPointParagraph(
              text:
                  'However, it is crucial for pregnant women to consult with their healthcare provider before starting any exercise regimen to ensure safety and suitability for their individual needs.'),
          const SizedBox(height: 16),

          // List of exercises
          const Text(
            "Here's a list of safe exercises for pregnant or new mothers: ",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          const NumberedExerciseList(),
          const SizedBox(height: 16),

          // Final paragraph in bold
          const Text(
            'Remember, it\'s essential for a pregnant woman to consult with their healthcare provider before starting any exercise program to ensure safety and suitability for their individual needs.',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// Widget to create bullet-pointed paragraphs
class BulletPointParagraph extends StatelessWidget {
  final String text;

  const BulletPointParagraph({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24.0), // Indentation for the text
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.circle, size: 10), // Bullet point
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

// Widget to create the numbered exercise list
class NumberedExerciseList extends StatelessWidget {
  const NumberedExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    const exercises = [
      'Walking',
      'Swimming',
      'Stationary cycling',
      'Prenatal yoga',
      'Prenatal pilates',
      'Low-impact aerobics',
      'Water aerobics',
      'Modified strength training (using light weights or resistance bands)',
      'And more',
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        exercises.length,
        (index) => Text(
          '${index + 1}. ${exercises[index]}',
          style: const TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}