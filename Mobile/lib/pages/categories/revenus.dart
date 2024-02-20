import 'dart:math';

import 'package:flutter/material.dart';
import 'package:front/services/categorie_service.dart';
import 'package:front/utils/dialog_show_icons.dart';
import 'package:front/utils/switch_icons.dart';

class IncomeLists extends StatefulWidget {
  IncomeLists({Key? key}) : super(key: key ?? IncomeListsState.key);

  @override
  IncomeListsState createState() => IncomeListsState();
}

class IncomeListsState extends State<IncomeLists> {
  static GlobalKey<IncomeListsState> key = GlobalKey<IncomeListsState>();
  final UserCategoriesService _categoryService = UserCategoriesService();

  List<Map<String, dynamic>> categories = [
    {"name": "Argent", "iconData": Icons.attach_money_outlined},
    {"name": "Buisness", "iconData": Icons.business},
  ];

  List<List<Color>> colorPairs = [
    [Colors.red[50]!, Colors.red[900]!],
    [Colors.blue[50]!, Colors.blue[900]!],
    [Colors.green[50]!, Colors.green[900]!],
    [Colors.yellow[50]!, Colors.yellow[900]!],
    [Colors.orange[50]!, Colors.orange[900]!],
    [Colors.purple[50]!, Colors.purple[900]!],
    [Colors.pink[50]!, Colors.pink[900]!],
    [Colors.brown[50]!, Colors.brown[900]!],
    [Colors.cyan[50]!, Colors.cyan[900]!],
    [Colors.amber[50]!, Colors.amber[900]!],
  ];

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      List<dynamic> allCategories = await _categoryService.fetchCategories();
      List<Map<String, dynamic>> typedCategories =
          allCategories.map((item) => item as Map<String, dynamic>).toList();
      setState(() {
        categories = typedCategories
            .where((category) => category['category_type'] == 'revenue')
            .map((category) {
          String categoryName = category['category_name'];
          String iconName = category['icon_name'];
          IconData iconData = DialogIcons.getIconDataFromName(iconName);
          List<Color> randomColorPair =
              colorPairs[Random().nextInt(colorPairs.length)];
          Color backgroundColor = randomColorPair[0];
          Color iconColor = randomColorPair[1];
          return {
            ...category,
            'name': categoryName,
            'iconData': iconData,
            'backgroundColor': backgroundColor,
            "iconColor": iconColor,
          };
        }).toList();
      });
    } catch (e) {
      print('Erreur lors du chargement des catégories: $e');
    }
  }

  void addCategory(String category, IconData icon) async {
    setState(() {
      List<Color> randomColorPair =
          colorPairs[Random().nextInt(colorPairs.length)];

      Color backgroundColor = randomColorPair[0];
      Color iconColor = randomColorPair[1];

      categories.add({
        "name": category,
        "iconData": icon,
        "backgroundColor": backgroundColor,
        "iconColor": iconColor,
      });
    });

    String iconNameString = SwitchIcons.getIconName(icon);
    await _categoryService.addCategory(category, "revenue", iconNameString);
    loadCategories();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...categories.map((category) {
              Color backgroundColor = category.containsKey("backgroundColor")
                  ? category["backgroundColor"] as Color
                  : Colors.orange[50]!;
              Color iconColor = category.containsKey("iconColor")
                  ? category["iconColor"] as Color
                  : Colors.orange[900]!;
              String name = category.containsKey("name")
                  ? category["name"] as String
                  : "Dépense";
              IconData iconData = category.containsKey("iconData")
                  ? category["iconData"] as IconData
                  : Icons.error;

              return CustomExpenseLists(
                backgroundColor: backgroundColor,
                iconColor: iconColor,
                name: name,
                iconData: iconData,
              );
            }).toList(),
            CustomExpenseLists(
              backgroundColor: Colors.orange[50]!,
              iconColor: Colors.orange[900]!,
              name: "Nourritures",
              iconData: Icons.local_drink_outlined,
            ),
            CustomExpenseLists(
              backgroundColor: Colors.purple[50]!,
              iconColor: Colors.purple[900]!,
              name: "Shopping",
              iconData: Icons.shopping_cart_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

Color getRandomColorFromList(List<List<Color>> colorPairs) {
  var rng = Random();
  int index = rng.nextInt(colorPairs.length); // Génère un index aléatoire
  List<Color> colorPair = colorPairs[index];
  return rng.nextBool()
      ? colorPair[0]
      : colorPair[1]; // Renvoie une couleur aléatoire de la paire
}

class CustomExpenseLists extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;
  final String name;
  final IconData iconData;

  const CustomExpenseLists({
    super.key,
    required this.backgroundColor,
    required this.iconColor,
    required this.name,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 45,
                height: 45,
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: backgroundColor, // Colors.purple[50],
                ),
                child: Icon(
                  iconData,
                  size: 35,
                  color: iconColor, // Colors.purple[900],
                ),
              ),
              Text(
                name,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.delete_outline_outlined,
              size: 30,
            ),
          ),
        ],
      ),
    );
  }
}
