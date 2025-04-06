import 'package:flutter/material.dart';

class BabyNamesScreen extends StatefulWidget {
  const BabyNamesScreen({Key? key}) : super(key: key);

  @override
  State<BabyNamesScreen> createState() => _BabyNamesScreenState();
}

class _BabyNamesScreenState extends State<BabyNamesScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  List<String> _favouriteNames = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Baby Names'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Most Popular'),
            Tab(text: 'My Favourites'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildMostPopularTab(),
          _buildMyFavouritesTab(),
        ],
      ),
    );
  }

  Widget _buildMostPopularTab() {
    return ListView(
      children: [
        ExpansionTile(
          leading: const Icon(Icons.flag),
          title: const Text('American Names'),
          children: _buildNameList(americanNames),
        ),
        ExpansionTile(
          leading: const Icon(Icons.flag),
          title: const Text('Indian Names'),
          children: _buildNameList(indianNames),
        ),
        ExpansionTile(
          leading: const Icon(Icons.flag),
          title: const Text('African Names'),
          children: _buildNameList(africanNames),
        ),
      ],
    );
  }

  Widget _buildMyFavouritesTab() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: const InputDecoration(
              hintText: 'Enter a custom name',
            ),
            onSubmitted: (name) {
              setState(() {
                _favouriteNames.add(name);
              });
            },
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: _favouriteNames.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_favouriteNames[index]),
              );
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _buildNameList(List<String> names) {
    return names.map((name) =>
        ListTile(
          title: Text(name),
          trailing: IconButton(
            icon: Icon(
              _favouriteNames.contains(name) ? Icons.favorite : Icons.favorite_border,
              color: _favouriteNames.contains(name) ? Colors.red : null,
            ),
            onPressed: () {
              setState(() {
                if (_favouriteNames.contains(name)) {
                  _favouriteNames.remove(name);
                } else {
                  _favouriteNames.add(name);
                }
              });
            },
          ),
        )
    ).toList();
  }

  // Add the lists of names here
  final List<String> americanNames = const [
    "Abigail", "Alexander", "Avery", "Austin",
    "Benjamin", "Brooklyn", "Bryce", "Brittany",
    "Charlotte", "Caleb", "Cameron", "Chloe",
    "Daniel", "Dakota", "David", "Diana",
    "Emma", "Ethan", "Evan", "Elizabeth",
    "Faith", "Finn", "Frederick", "Felicity",
    "Grace", "Gabriel", "George", "Gianna",
    "Hannah", "Henry", "Harper", "Hudson",
    "Isabella", "Isaac", "Ian", "Ivy",
    "James", "Jackson", "Julia", "Josephine",
    "Kevin", "Kylie", "Kaden", "Kennedy",
    "Liam", "Lily", "Lucas", "Leah",
    "Madison", "Matthew", "Mia", "Mason",
    "Noah", "Natalie", "Nathaniel", "Nicole",
    "Olivia", "Owen", "Oscar", "Orion",
    "Patrick", "Penelope", "Parker", "Piper",
    "Quinn", "Quincy",
    "Ryan", "Ruby", "Rachel", "Robert",
    "Samuel", "Sophia", "Steven", "Scarlett",
    "Thomas", "Taylor", "Timothy", "Tessa",
    "Ursula", "Ulysses",
    "Victoria", "Vincent", "Violet", "Vera",
    "William", "Willow", "Wesley", "Wendy",
    "Xavier", "Xander",
    "Yvonne", "Yahir",
    "Zoe", "Zachary", "Zane"
  ];

  final List<String> indianNames = const [
    "Aarav", "Aditi", "Ananya", "Arjun",
    "Bharat", "Bhavya", "Bhuvan", "Bina",
    "Charulata", "Chaitanya", "Chandana", "Chetan",
    "Deepak", "Divya", "Devanshi", "Dinesh",
    "Ekta", "Esha", "Eshan", "Elina",
    "Faiz", "Farhan", "Falguni", "Flora",
    "Gautam", "Gita", "Gaurav", "Gajal",
    "Harish", "Harini", "Hitesh", "Hemal",
    "Ishaan", "Isha", "Indira", "Irfan",
    "Jai", "Jaya", "Jitendra", "Juhi",
    "Krishna", "Kavya", "Karan", "Komal",
    "Lakshmi", "Laxman", "Lila", "Lalit",
    "Manish", "Meera", "Mohan", "Mithila",
    "Neha", "Nikhil", "Nandini", "Naveen",
    "Om", "Ojas", "Oindrila", "Omer",
    "Priya", "Parth", "Pooja", "Pradeep",
    "Quadir", "Qasim",
    "Rajesh", "Riya", "Rohit", "Radhika",
    "Siddharth", "Sita", "Sunil", "Shruti",
    "Tanvi", "Tejas", "Tarun", "Trisha",
    "Usha", "Uday", "Urvashi", "Utkarsh",
    "Vijay", "Vandana", "Vikram", "Varsha",
    "Waseem", "Wasim", "Wafa",
    "Xara", "Xander",
    "Yash", "Yami", "Yogesh", "Yuvraj",
    "Zoya", "Zain", "Zahra", "Zubair"
  ];

  final List<String> africanNames = const [
    "Amina", "Adama", "Akilah", "Amara",
    "Binta", "Baako", "Boubacar", "Bhekizizwe",
    "Chiamaka", "Chidi", "Celeste", "Cheikh",
    "Diala", "Dumi", "Dada", "Dlamini",
    "Ekene", "Efe", "Eshe", "Esi",
    "Fatou", "Femi", "Fola", "Faduma",
    "Gwenn", "Gimba", "Gugu", "Gbenga",
    "Hafsa", "Hakeem", "Hilda", "Hassan",
    "Imani", "Ife", "Ibraheem", "Ireti",
    "Juma", "Jendayi", "Jamal", "Jendayi",
    "Kwame", "Kofi", "Kazi", "Kesi",
    "Lunga", "Lindiwe", "Lamine", "Lekan",
    "Makena", "Masego", "Mbali", "Musa",
    "Nia", "Niazi", "Nia", "Nyasha",
    "Olumide", "Omari", "Oluwaseun", "Onyekachi",
    "Penda", "Palesa", "Prosper", "Pumla",
    "Quamina", "Quraysh",
    "Ramatoulaye", "Rami", "Rudo", "Rona",
    "Sanele", "Sade", "Shani", "Siti",
    "Thabisa", "Temba", "Tawfiq", "Tumelo",
    "Uche", "Uzo", "Umu", "Udo",
    "Vusimuzi", "Vuyisile",
    "Winta", "Wole", "Wasim", "Winnie",
    "Xolani", "Xhosa",
    "Yara", "Youssef", "Yvonne", "Yao",
    "Zanele", "Zuri", "Zaynab", "Zawadi"
  ];
}
