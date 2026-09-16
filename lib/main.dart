import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const FoodDeciderApp());
}

// ============================================================
// APP
// ============================================================

class FoodDeciderApp extends StatelessWidget {
  const FoodDeciderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food Decider',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const FoodHomePage(),
    );
  }
}

// ============================================================
// HOME PAGE
// ============================================================

class FoodHomePage extends StatefulWidget {
  const FoodHomePage({super.key});

  @override
  State<FoodHomePage> createState() => _FoodHomePageState();
}

class _FoodHomePageState extends State<FoodHomePage> {
  final Random random = Random();

  int selectedPage = 0;

  String selectedCategory = 'Any Food';
  String selectedFood = '🤔';

  bool noRepeat = false;
  bool isRolling = false;

  final List<String> favorites = [];
  final List<String> history = [];
  final List<String> myFoods = [];
  final List<String> usedFoods = [];

  final Map<String, List<String>> categories = {
    'Any Food': [
      '🍕 Pizza',
      '🍔 Burger',
      '🍗 Biryani',
      '🍝 Pasta',
      '🍜 Noodles',
      '🌮 Taco',
      '🥪 Sandwich',
      '🍣 Sushi',
      '🥞 Dosa',
      '🍟 French Fries',
      '🌯 Wrap',
      '🍰 Cake',
    ],

    'Indian': [
      '🍗 Biryani',
      '🥘 Butter Chicken',
      '🧀 Paneer Tikka',
      '🥞 Dosa',
      '🍲 Idli',
      '🍛 Dal Rice',
      '🥘 Chole Bhature',
      '🍜 Masala Noodles',
    ],

    'Fast Food': [
      '🍕 Pizza',
      '🍔 Burger',
      '🌮 Taco',
      '🍟 French Fries',
      '🌭 Hot Dog',
      '🥪 Sandwich',
      '🍗 Fried Chicken',
      '🌯 Wrap',
    ],

    'Healthy': [
      '🥗 Salad',
      '🥑 Avocado Toast',
      '🍲 Vegetable Soup',
      '🥙 Veg Wrap',
      '🍎 Fruit Bowl',
      '🥣 Oatmeal',
      '🥦 Grilled Vegetables',
      '🍚 Brown Rice',
    ],

    'Desserts': [
      '🍰 Cake',
      '🍦 Ice Cream',
      '🍩 Donuts',
      '🍪 Cookies',
      '🍫 Chocolate',
      '🥞 Pancakes',
      '🍮 Pudding',
      '🧁 Cupcake',
    ],
  };

  // ============================================================
  // GET FOOD LIST
  // ============================================================

  List<String> getFoodList() {
    final List<String> foods = [];

    if (selectedCategory == 'Any Food') {
      for (final foodList in categories.values) {
        for (final food in foodList) {
          if (!foods.contains(food)) {
            foods.add(food);
          }
        }
      }
    } else {
      foods.addAll(
        categories[selectedCategory] ?? [],
      );
    }

    for (final food in myFoods) {
      if (!foods.contains(food)) {
        foods.add(food);
      }
    }

    return foods;
  }

  // ============================================================
  // 🎲 DICE / DECIDE FOOD
  // ============================================================

  void decideFood() {
    // Get all available foods.
    final List<String> foods = getFoodList();

    if (foods.isEmpty) {
      return;
    }

    // Show that the button was clicked.
    setState(() {
      isRolling = true;
      selectedFood = '🎲';
    });

    // Small delay so the user can see the dice roll.
    Future.delayed(const Duration(milliseconds: 350), () {
      if (!mounted) {
        return;
      }

      List<String> availableFoods = List<String>.from(foods);

      // NO REPEAT MODE
      if (noRepeat) {
        availableFoods = foods
            .where(
              (food) => !usedFoods.contains(food),
            )
            .toList();

        // If every food has already appeared,
        // start a new cycle.
        if (availableFoods.isEmpty) {
          usedFoods.clear();
          availableFoods = List<String>.from(foods);
        }
      }

      // Pick random food.
      final int randomIndex =
          random.nextInt(availableFoods.length);

      final String newFood =
          availableFoods[randomIndex];

      setState(() {
        selectedFood = newFood;
        isRolling = false;

        history.insert(0, newFood);

        if (noRepeat) {
          usedFoods.add(newFood);
        }

        if (history.length > 50) {
          history.removeLast();
        }
      });
    });
  }

  // ============================================================
  // ❤️ FAVORITE
  // ============================================================

  void toggleFavorite() {
    if (selectedFood == '🤔' ||
        selectedFood == '🎲') {
      return;
    }

    setState(() {
      if (favorites.contains(selectedFood)) {
        favorites.remove(selectedFood);
      } else {
        favorites.add(selectedFood);
      }
    });
  }

  // ============================================================
  // ➕ ADD FOOD
  // ============================================================

  void addFood() {
    final TextEditingController controller =
        TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return AlertDialog(
          title: const Text('🍽️ Add Your Food'),

          content: TextField(
            controller: controller,
            autofocus: true,
            decoration: const InputDecoration(
              hintText: 'Enter food name',
              border: OutlineInputBorder(),
            ),
          ),

          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext);
              },
              child: const Text('Cancel'),
            ),

            ElevatedButton(
              onPressed: () {
                final String name =
                    controller.text.trim();

                if (name.isNotEmpty) {
                  setState(() {
                    myFoods.add('🍽️ $name');
                  });
                }

                Navigator.pop(dialogContext);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  // ============================================================
  // DELETE FAVORITE
  // ============================================================

  void deleteFavorite(int index) {
    setState(() {
      favorites.removeAt(index);
    });
  }

  // ============================================================
  // DELETE MY FOOD
  // ============================================================

  void deleteMyFood(int index) {
    setState(() {
      myFoods.removeAt(index);
    });
  }

  // ============================================================
  // CLEAR HISTORY
  // ============================================================

  void clearHistory() {
    setState(() {
      history.clear();
    });
  }

  // ============================================================
  // 🏠 HOME PAGE
  // ============================================================

  Widget buildHomePage() {
    final bool isFavorite =
        favorites.contains(selectedFood);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          const SizedBox(height: 15),

          // TITLE
          const Text(
            '🍽️ Food Decider',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Stop thinking. Start eating! 😋',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 25),

          // MAIN CARD
          Card(
            elevation: 5,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [
                  const Text(
                    'What do you want to eat?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    'Choose a category and let us decide.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 25),

                  // CATEGORY TITLE
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Choose Category',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // CATEGORY CHIPS
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,

                    children:
                        categories.keys.map((name) {
                      return ChoiceChip(
                        label: Text(name),

                        selected:
                            selectedCategory == name,

                        onSelected: (_) {
                          setState(() {
                            selectedCategory = name;
                            selectedFood = '🤔';
                            usedFoods.clear();
                          });
                        },
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 25),

                  // ==================================================
                  // RESULT BOX
                  // ==================================================

                  Container(
                    width: double.infinity,

                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.orange.shade50,

                      borderRadius:
                          BorderRadius.circular(20),

                      border: Border.all(
                        color: Colors.orange.shade200,
                      ),
                    ),

                    child: Column(
                      children: [
                        Text(
                          isRolling
                              ? 'Rolling the dice...'
                              : selectedFood == '🤔'
                                  ? 'Ready to decide?'
                                  : 'Your food is...',

                          style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                          ),
                        ),

                        const SizedBox(height: 15),

                        AnimatedSwitcher(
                          duration:
                              const Duration(milliseconds: 200),

                          child: Text(
                            selectedFood,

                            key: ValueKey(selectedFood),

                            textAlign: TextAlign.center,

                            style: const TextStyle(
                              fontSize: 38,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        if (selectedFood != '🤔' &&
                            selectedFood != '🎲' &&
                            !isRolling) ...[
                          const SizedBox(height: 8),

                          IconButton(
                            onPressed: toggleFavorite,

                            icon: Icon(
                              isFavorite
                                  ? Icons.favorite
                                  : Icons.favorite_border,

                              size: 30,

                              color: isFavorite
                                  ? Colors.red
                                  : Colors.black54,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // ==================================================
                  // 🎲 BIG DICE BUTTON
                  // ==================================================

                  SizedBox(
                    width: double.infinity,
                    height: 65,

                    child: Material(
                      color: Colors.orange,
                      borderRadius:
                          BorderRadius.circular(18),

                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(18),

                        onTap: isRolling
                            ? null
                            : () {
                                decideFood();
                              },

                        child: Center(
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.center,

                            children: [
                              Icon(
                                isRolling
                                    ? Icons.hourglass_top
                                    : Icons.casino,

                                color: Colors.white,

                                size: 30,
                              ),

                              const SizedBox(width: 12),

                              Text(
                                isRolling
                                    ? 'Rolling...'
                                    : 'Decide for Me',

                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight:
                                      FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 15),

          // ADD FOOD BUTTON
          OutlinedButton.icon(
            onPressed: addFood,

            icon: const Icon(Icons.add),

            label: const Text(
              'Add Your Own Food',
            ),
          ),

          const SizedBox(height: 20),

          const Text(
            'Made with ❤️ using Flutter',

            style: TextStyle(
              color: Colors.black45,
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ❤️ FAVORITES PAGE
  // ============================================================

  Widget buildFavoritesPage() {
    return buildListPage(
      title: '❤️ Favorites',
      subtitle: 'Your favorite foods',
      items: favorites,
      icon: Icons.favorite,
      emptyText: 'No favorite foods yet ❤️',
      showDelete: true,
    );
  }

  // ============================================================
  // 📜 HISTORY PAGE
  // ============================================================

  Widget buildHistoryPage() {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        children: [
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                '📜 History',

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              if (history.isNotEmpty)
                TextButton(
                  onPressed: clearHistory,
                  child: const Text('Clear'),
                ),
            ],
          ),

          const Align(
            alignment: Alignment.centerLeft,

            child: Text(
              'Your previous food decisions',

              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: history.isEmpty
                ? const Center(
                    child: Text(
                      'No decisions yet 📜',

                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )

                : ListView.builder(
                    itemCount: history.length,

                    itemBuilder:
                        (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.history,
                            color: Colors.orange,
                          ),

                          title:
                              Text(history[index]),

                          subtitle: index == 0
                              ? const Text(
                                  'Latest decision',
                                )
                              : null,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // 🍽️ MY FOODS PAGE
  // ============================================================

  Widget buildMyFoodsPage() {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 15),

          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                '🍽️ My Foods',

                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              IconButton(
                onPressed: addFood,

                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),

          const Text(
            'Foods you added yourself',

            style: TextStyle(
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: myFoods.isEmpty
                ? Center(
                    child: ElevatedButton.icon(
                      onPressed: addFood,

                      icon: const Icon(
                        Icons.add,
                      ),

                      label: const Text(
                        'Add Your First Food',
                      ),
                    ),
                  )

                : ListView.builder(
                    itemCount: myFoods.length,

                    itemBuilder:
                        (context, index) {
                      return Card(
                        child: ListTile(
                          leading: const Icon(
                            Icons.restaurant,
                            color: Colors.orange,
                          ),

                          title:
                              Text(myFoods[index]),

                          trailing: IconButton(
                            onPressed: () {
                              deleteMyFood(index);
                            },

                            icon: const Icon(
                              Icons.delete_outline,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // ⚙️ SETTINGS PAGE
  // ============================================================

  Widget buildSettingsPage() {
    return ListView(
      padding: const EdgeInsets.all(20),

      children: [
        const SizedBox(height: 15),

        const Text(
          '⚙️ Settings',

          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 25),

        // NO REPEAT
        Card(
          child: SwitchListTile(
            value: noRepeat,

            onChanged: (value) {
              setState(() {
                noRepeat = value;
                usedFoods.clear();
              });
            },

            title: const Text(
              'No Repeat Mode',

              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: const Text(
              'Do not choose the same food repeatedly',
            ),

            secondary: const Icon(
              Icons.shuffle,
            ),
          ),
        ),

        const SizedBox(height: 10),

        // FAVORITES COUNT
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.favorite,
            ),

            title: const Text(
              'Favorites',
            ),

            trailing: Text(
              '${favorites.length}',

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // HISTORY COUNT
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.history,
            ),

            title: const Text(
              'History',
            ),

            trailing: Text(
              '${history.length}',

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        // MY FOODS COUNT
        Card(
          child: ListTile(
            leading: const Icon(
              Icons.restaurant,
            ),

            title: const Text(
              'My Foods',
            ),

            trailing: Text(
              '${myFoods.length}',

              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 40),

        const Center(
          child: Text(
            'Food Decider\n\n'
            'Version 1.0.0\n\n'
            'Made with ❤️ using Flutter',

            textAlign: TextAlign.center,

            style: TextStyle(
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ),
      ],
    );
  }

  // ============================================================
  // COMMON LIST PAGE
  // ============================================================

  Widget buildListPage({
    required String title,
    required String subtitle,
    required List<String> items,
    required IconData icon,
    required String emptyText,
    required bool showDelete,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          const SizedBox(height: 15),

          Text(
            title,

            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 5),

          Text(
            subtitle,

            style: const TextStyle(
              color: Colors.black54,
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: items.isEmpty
                ? Center(
                    child: Text(
                      emptyText,

                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  )

                : ListView.builder(
                    itemCount: items.length,

                    itemBuilder:
                        (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Icon(
                            icon,
                          ),

                          title:
                              Text(items[index]),

                          trailing: showDelete
                              ? IconButton(
                                  onPressed: () {
                                    deleteFavorite(
                                      index,
                                    );
                                  },

                                  icon: const Icon(
                                    Icons
                                        .delete_outline,
                                  ),
                                )
                              : null,
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // PAGE SWITCHING
  // ============================================================

  Widget getPage() {
    switch (selectedPage) {
      case 0:
        return buildHomePage();

      case 1:
        return buildFavoritesPage();

      case 2:
        return buildHistoryPage();

      case 3:
        return buildMyFoodsPage();

      case 4:
        return buildSettingsPage();

      default:
        return buildHomePage();
    }
  }

  // ============================================================
  // MAIN SCAFFOLD
  // ============================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFFF3E0),
              Color(0xFFFFE0B2),
            ],

            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: getPage(),
        ),
      ),

      // ========================================================
      // BOTTOM NAVIGATION
      // ========================================================

      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedPage,

        onDestinationSelected: (index) {
          setState(() {
            selectedPage = index;
          });
        },

        destinations: const [
          NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
            ),

            selectedIcon: Icon(
              Icons.home,
            ),

            label: 'Home',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.favorite_border,
            ),

            selectedIcon: Icon(
              Icons.favorite,
            ),

            label: 'Favorites',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.history,
            ),

            selectedIcon: Icon(
              Icons.history,
            ),

            label: 'History',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.restaurant_menu,
            ),

            selectedIcon: Icon(
              Icons.restaurant,
            ),

            label: 'My Foods',
          ),

          NavigationDestination(
            icon: Icon(
              Icons.settings_outlined,
            ),

            selectedIcon: Icon(
              Icons.settings,
            ),

            label: 'Settings',
          ),
        ],
      ),
    );
  }
}