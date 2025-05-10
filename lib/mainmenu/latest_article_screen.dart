import 'package:flutter/material.dart';

class LatestArticleScreen extends StatelessWidget {
  const LatestArticleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1C1F2B) // Charcoal Blue background
          : const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF6A0DAD) // Deep Purple
            : const Color.fromARGB(255, 245, 241, 245),
        title: const Text('Latest Articles'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          _buildCategorySection(
            context,
            'Nutrition',
            [
              _buildArticleOption(
                context,
                'Food & Drink',
                'images/food&drink.jpeg', 'Nourishing You and Your Little One',
                "Welcome to a journey of nourishing both you and your growing baby! It's a common thought that pregnancy means 'eating for two,' but it's more about choosing wisely than doubling your portions. Let's gently explore how to fuel this beautiful time.\n\n"
                "In your first and second trimesters, focus on maintaining a balanced diet without necessarily increasing your calorie intake. Each woman's journey is unique, so tune into what your body tells you. If you feel hungrier, opt for foods rich in nutrients—these will give you more energy.\n\n"
                "As you approach the final trimester, adding around 200 extra calories daily is often recommended if you're carrying one baby. This number goes up with more babies: 400 extra for twins and 600 for triplets. Remember, it's about quality over quantity. \n\n"
                "What should be on your plate? \n\n"
                "You might have seen 'eating for two' portrayed with lots of sugary treats, but it's more about increasing the good stuff. During pregnancy, your food choices are incredibly important. They're the building blocks for your baby. Load up on a variety of fresh fruits and vegetables for a good mix of vitamins and minerals. Opt for brown grains like rice, pasta, and bread—they are great alternatives to their white counterparts. Try to keep sugar and salt in moderation.\n\n"
                "Healthy Weight Gain \n\n"
                "For women who started at a healthy weight, gaining between 25 to 35 lbs is typical. If you started with a higher or lower weight, this might be a bit different for you. It's great to chat with your healthcare provider to understand what's right for you. The old saying 'eating for two' just needs a modern twist: it's not about eating twice as much, but about making choices that nourish you both deeply. The more variety, the more nutrients for both of you!\n\n"
                "This advice comes from a collaboration between Philips Avent and perinatal health experts.\n\n"
                "Resources: NHS guides on healthy eating and weight gain during pregnancy.",
              ),
              _buildArticleOption(
                context,
                'Nutrition Essentials',
                'images/nutrition.jpg',
                'Eating for Two - the Expert View Myth vs. Fact',
                "Let's address the common myth: 'eating for two.' While the idea of doubling your food intake might seem appealing, it's not quite right. Think of it more as nourishing both you and your baby with the right fuel.\n\n"
                "Before pregnancy, around 2000 kcal daily is typical, but this varies based on your weight and how active you are. During pregnancy, gaining too much weight isn't recommended. If you're in good health, you don't necessarily need to increase food intake in the first two trimesters. Adding about 200 kcal daily during the third trimester is generally suggested.\n\n"
                "What does this extra energy do?\n\n"
                "These extra calories fuel your baby's growth, help develop the placenta, boost your blood volume, and create amniotic fluid. It's like giving your body a little extra support for all the work it's doing. 200 kcal might not sound like a lot, but remember, you might be less active now, so you're not burning as much energy. To put it in perspective, 200 kcal could be 2 cups of natural yogurt, 12 tomatoes, 3 eggs, or 2 slices of bread each day.\n\n"
                "To sum it up: if you're healthy, focus on nourishing for one, with a little extra in the third trimester.\n\n"
                "Further Reading:\n"
                "Better Health: Start for Life: Healthy Eating in Pregnancy\n"
                "Overview: Managing Your Weight Before, During, and After Pregnancy",
              ),
            ],
          ),
          _buildCategorySection(
            context,
            'Body',
            [
              _buildArticleOption(
                context,
                'Weight Gain',
                'images/weightgain.jpg',
                'Important Facts about Weight Gain',
                "It's common to hear that during pregnancy, you're 'eating for two.' While there's some truth to this, remember it's about making nourishing choices. Typically, you might need only around 200 extra calories a day for each baby, usually starting from the third trimester. Finding a balance is key, as gaining too much or too little weight can affect both you and your little one.\n\n"
                "What's a healthy amount of weight gain during pregnancy?\n\n"
                "Each of us is wonderfully unique, so the right amount of weight gain depends on your pre-pregnancy weight. In general, you might gain between 2 to 4 lbs in the first trimester, then about 1 lb each week after that. If you started at an average weight, expect to gain between 22 to 26 lbs. Those starting at a lower weight might gain between 28 to 40 lbs, while those with a BMI over 25 might gain 15 to 25 lbs.\n\n"
                "If you're expecting twins, your pre-pregnancy weight guides your overall weight gain: between 31 and 50 lbs if you're at a normal weight, or 25 to 42 lbs if you're overweight. Gaining the right amount of weight is extra important with twins, as it directly affects their weight at birth. Twins often arrive earlier, so a little extra weight can be a real plus.\n\n"
                "What if you gain too much or too little?\n\n"
                "Gaining too much weight might lead to a higher chance of a Cesarean delivery. It can also mean retaining more weight after pregnancy, which can be challenging for those already managing a higher weight. This can increase the risk of pregnancy-related high blood pressure issues.\n\n"
                "For more information:\n"
                "ACOG: Guidance on Weight Gain During Pregnancy\n"
                "Tommy's: Understanding Weight Gain in Pregnancy\n"
                "NHS: Insights on Weight Gain in Pregnancy",
              ),
              _buildArticleOption(
                context,
                'Body Changes',
                'images/bodychanges.jpg',
                'My Body is Changing',
                "During pregnancy, it's natural to look in the mirror and see someone a little different. Your body is going through amazing transformations, from a growing baby bump to changes in breast size. You might also notice hair in new areas, like your chin, and stretch marks might start appearing on your belly.\n\n"
                "These changes are normal and part of the incredible journey of creating new life. Still, it's understandable if you don't love every change you see. A great way to embrace these changes is through exercise, which can help you feel strong and uplift your mood. Eating well, showing yourself extra care, and surrounding yourself with supportive people can also make a big difference in how you feel.\n\n"
                "Instead of dwelling on weight gain or stretch marks, marvel at the amazing job your body is doing to nourish your baby. Remember, these changes are essential for your baby's growth and happiness, which may help you feel more at peace with any body image concerns that arise.",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategorySection(BuildContext context, String categoryName, List<Widget> articleOptions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            categoryName,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(8.0),
          children: articleOptions,
        ),
      ],
    );
    
  }

  Widget _buildArticleOption(
    BuildContext context,
    String title,
    String imagePath,
    String heading,
    String content,
  ) {
    return Card(
      elevation: 8,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      shadowColor: Colors.black.withOpacity(0.3),
       margin: const EdgeInsets.all(8),
      
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => ArticleDetailScreen(
                imagePath: imagePath,
                heading: heading,
                content: content,
              ),
              transitionsBuilder: (context, animation, secondaryAnimation, child) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );
              },
            ),
          );
        },
        child: Stack(
          alignment: Alignment.bottomLeft,
          
          children: [
           Hero(
              tag: imagePath,
              child: Image.asset(
                imagePath,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
               padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
               
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent
                  ],
                  begin: Alignment.bottomCenter, 
                  end: Alignment.topCenter
                ),
              ),
                child: Text(
                title,
                 style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  color: const Color(0xFFD8BFD8).withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.article, color: Colors.white, size: 16),
                      const SizedBox(width: 4),
                      Text(
                        'Articles',
                        style: const TextStyle(color: Colors.white, fontSize: 12),
                     ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String content;

  const ArticleDetailScreen({
    super.key,
    required this.imagePath,
    required this.heading,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? const Color(0xFF1C1F2B) // Charcoal Blue background
          : const Color(0xFFE6E6FA),
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? const Color(0xFF6A0DAD) // Deep Purple
            : const Color(0xFFD8BFD8),
        title: Text(heading),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Hero(
            tag: imagePath,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                height: 250,
                width: double.infinity,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            heading,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: TextStyle(
                fontSize: 18,
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white
                    : Colors.black),
            textAlign: TextAlign.justify,
          ),
        ]),
      ),
    );
  }
}
