import 'package:flutter/material.dart';

class LatestArticleScreen extends StatelessWidget {
  const LatestArticleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Latest Articles'),
      ),
      body: ListView(
        children: [
          // Nutrition Category
          _buildCategoryTile(
            'Nutrition',
            [
              _buildArticleOption(
                context,
                'Food & Drink',
                'images/food&drink.jpeg',
                'Pregnancy diet: eating for two',
                "We've all heard the phrase 'eating for two', but now that you're pregnant, should you really be doubling your food intake? The simple answer is no, but it's important to eat a healthy diet to ensure you have enough energy and get enough nutrients for both you and your baby."
                "During the first and second trimesters, there is generally no need to increase your calorie intake. However, every woman is different and it's important to be your own guide on this journey - listen to your body and talk to your healthcare provider if you have any concerns. You may find that by switching to a more nutritionally dense diet, you are able to eat more if you feel hungry.\n\n"
                "As for the final trimester, pregnant women carrying one baby are advised to eat an extra 200 calories a day. This number doubles according to the number of babies you are carrying - 400 extra calories for twins and 600 extra calories for triplets, for example.\n\n"
                "So, what should you be eating?\n\n"
                "Interestingly, in films and on TV we often hear the phrase 'eating for two' whenever cake or ice cream is on the menu. It's rare to see anyone ordering twice the mixed salad. It's important to remember that when you do increase your food intake, it should be the healthy stuff you eat more of not the junk food. "
                "Now that you're pregnant, your diet is more important than ever. It's essential that your food provides all the goodness your body needs to make a person. This means eating a variety of fresh fruits and vegetables to ensure you get a mix of vitamins and minerals. When it comes to eating grains think brown. Brown rice, brown pasta and brown bread, are better substitutes than the white versions of these foods. Reduce your sugar and salt intake, and generally try to eat as healthily as you can. Don't starve yourself of treats just remember, everything in moderation!\n\n"
                "Healthy weight gain\n\n"
                "Women who were a healthy weight pre-pregnancy, gain on average between 25 and 35 lbs (11 16 kg). Women who were overweight, with a BMI over 25 before the pregnancy, should aim to put on less. Women who are underweight will be advised to put more. Speak to your healthcare provider if you want to find out what is an appropriate amount of weight gain for you. The phrase 'eating for two' isn't outdated, it just needs a new meaning for modern life. Instead of thinking about double the quantities, we should think of it as choosing foods that are good for our bodies the more variety you inculde, the bigger the range of nutrients you and your baby will be getting.\n\n"
                "Written by Philips Avent in collaboration with scientists and perinatal psychologists\n\n"
                "Sources: NHS: Have a healthy diet in pregnancy; NHS: Weight gain in pregnancy",
              ),
              _buildArticleOption(
                context,
                'Nutrition Essentials',
                'images/nutrition.jpg',
                'Eating for Two - the Expert View Myth vs. Fact',
                'Have you heard the old pregnancy myth that says "you are eating for two"? Many women think they can double up their food intake and all the extra weight they gain as a result will reduce after pregnancy.\n\n'
                'However, this is not the case! Before pregnancy, approximately 2000 kcal per day is considered normal, depending on your weight and activity level. Gaining excessive weight during pregnancy is not advised. If you\'re healthy, there is no need to eat more during the first two trimesters. However, you can add about 200 kcal to your diet per day in the 3rd trimester.\n\n'
                'What are the extra calories for?\n\n'
                'The extra calories provide energy and nutrients for your baby. They are also required for the growth of the placenta, increase in blood volume, and formation of amniotic fluid. This extra energy intake enables your body to perform all the extra functions of pregnancy. While 200 kcal may not sound like a lot, you are most likely less active and therefore burn fewer calories in the 3rd trimester. So, how much food is 200 kcal, really? It depends! 200 kcal is 2 cups of natural yoghurt OR 12 tomatoes OR 3 eggs OR 2 slices of bread each day.\n\n'
                'In conclusion: if you are healthy, do not eat for two, but only for 1.1. And only in the 3rd trimester.\n\n'
                'References:\n'
                'Better Health: Start for Life: Healthy eating in pregnancy\n'
                'Overview Weight management before, during and after pregnancy',
              ),
            ],
          ),
          // Body Category
          _buildCategoryTile(
            'Body',
            [
              _buildArticleOption(
                context,
                'Weight Gain',
                'images/weightgain.jpg',
                'Important Facts about Weight Gain',
                'When you are pregnant, the traditional narrative is that you are eating for two, right? This is true, but you need only 200 extra calories a day, per baby you are carrying and only typically from the third trimester. Gaining too much or too little weight can be harmful to both you and your baby it\'s all about balance.\n\n'
                'What is the \'correct\' amount of weight gain during pregnancy?\n\n'
                'Every woman is different and that means pre-pregnancy weight, too. In general, you gain approximately between 2 and 4 Ibs. in the first trimester and 1 lb. for each week after that. A woman of average weight gains between 22 and 26 Ibs. (10 12.5 kg) during pregnancy. Women with a lower pre-pregnancy weight can gain between 28 and 40 Ibs. (12.5 - 18 kg), while women with a BMI of 25 or more only need to gain between 15 and 25 Ibs. (6-11 kg).\n\n'
                'If you\'re carrying twins, your pre-pregnancy weight will determine your overall weight gain between 31 and 50 Ibs. (14 22.5 kg) (normal weight) and between 25 and 42 lbs. (11 19 kg) (overweight). Weight gain during pregnancy is especially important when you expecting twins, since your weight affects the weight of your babies. Twins are usually delivered early, so they benefit from some extra weight at birth.\n\n'
                'What happens if you gain too little or too much weight?\n\n'
                'Women who gain too much weight have a higher chance of a Cesarean delivery. They also tend to retain much of their weight after pregnancy and start with a higher weight in their following pregnancies. This can be a problem with women who are already overweight, as this increases their risk of certain pregnancy-related hypertensive disorders.\n\n'
                'References\n'
                'ACOG: Weight Gain During Pregnancy\n'
                'Tommy\'s: How much weight should gain in pregnancy?\n'
                'Weight gain in pregnancy- NHS',
              ),
              _buildArticleOption(
                context,
                'Body Changes',
                'images/bodychanges.jpg',
                'My Body is Changing',
                'At some point in your pregnancy, you may look at your body in the mirror and not quite recognize it. Your body goes through a lot of changes from a growing baby bump to an increase in breast size. You may also notice more hair in areas, such as your chin and upper lip. If that were not enough, stretch marks might start to appear on your belly.\n\n'
                'All the changes to your body are normal, but even though they are to be expected, you may not love everything you see. One thing you can do to deal with body image issues is exercise. Exercise can help you feel strong and fit. It can also improve your mood and help you relax. Eating well, pampering yourself and surrounding yourself with positive, supportive people can also help you feel healthy and improve your overall well-being.\n\n'
                'Instead of focusing on baby weight or stretch marks, think about what an amazing job your body is doing to nourish your baby. Knowing the changes happening to your body are essential for your baby\'s development and well-being may help you with any body image issues that come up.',
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Build category tile
  Widget _buildCategoryTile(String categoryName, List<Widget> articles) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            categoryName,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        ...articles,
      ],
    );
  }

  // Build article option
  Widget _buildArticleOption(
    BuildContext context,
    String title,
    String imagePath,
    String heading,
    String content,
  ) {
    return ListTile(
      leading: Image.asset(imagePath, width: 50, height: 50),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ArticleDetailScreen(
              imagePath: imagePath,
              heading: heading,
              content: content,
            ),
          ),
        );
      },
    );
  }
}

class ArticleDetailScreen extends StatelessWidget {
  final String imagePath;
  final String heading;
  final String content;

  const ArticleDetailScreen({
    Key? key,
    required this.imagePath,
    required this.heading,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(heading),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display image
              Image.asset(imagePath),
              const SizedBox(height: 16),
              // Display heading
              Text(
                heading,
                style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              // Display content
              Text(
                content,
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
