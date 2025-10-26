import 'package:flutter/material.dart';

void main() => runApp(const FoodApp());

class FoodApp extends StatefulWidget {
  const FoodApp({super.key});
  @override
  State<FoodApp> createState() => _FoodAppState();
}

class _FoodAppState extends State<FoodApp> {
  bool _isDark = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'O‘zbek Taomlari',
      debugShowCheckedModeBanner: false,
      theme: _isDark
          ? ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark(
          primary: Colors.orange,
          secondary: Colors.deepOrangeAccent,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.grey,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.white54,
        ),
      )
          : ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Colors.orange,
          secondary: Colors.deepOrangeAccent,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.orangeAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
      home: MainPage(onThemeToggle: () => setState(() => _isDark = !_isDark)),
    );
  }
}

/* ======================  MAIN PAGE  ====================== */
class MainPage extends StatefulWidget {
  final VoidCallback onThemeToggle;
  const MainPage({super.key, required this.onThemeToggle});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    final model = FoodModel();
    _pages = [
      FoodHomePage(foodModel: model),
      SearchPage(foodModel: model),
      AddFoodPage(foodModel: model),
      SettingsPage(onThemeToggle: widget.onThemeToggle),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _selectedIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Asosiy'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Qidiruv'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Qo‘shish'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Sozlamalar'),
        ],
      ),
    );
  }
}

/* ======================  FOOD MODEL  ====================== */
class FoodModel extends ChangeNotifier {
  // 100 ta taom – har biriga noyob nom va retsept
  final List<Map<String, String>> _foods = [
    // 1-20
    {'name': 'Palov', 'recipe': 'Guruch, go‘sht, sabzi, yog‘, piyoz — qozonda qaynatiladi.'},
    {'name': 'Manti', 'recipe': 'Xamir, qiyma, piyoz — bug‘da pishiriladi.'},
    {'name': 'Lag‘mon', 'recipe': 'Qaynatilgan makaron, go‘sht, sabzavotlar — qaynatiladi.'},
    {'name': 'Somsa', 'recipe': 'Xamir, go‘sht yoki kartoshka — tandirda pishiriladi.'},
    {'name': 'Kabob', 'recipe': 'Go‘sht, tuz, ziravorlar — ko‘mirda qovuriladi.'},
    {'name': 'Dimlama', 'recipe': 'Sabzavotlar, go‘sht — qozonda dimlanadi.'},
    {'name': 'Norin', 'recipe': 'Qazi, xamir, piyoz — aralashtiriladi.'},
    {'name': 'Do‘lma', 'recipe': 'Karam bargi, qiyma — bug‘da pishiriladi.'},
    {'name': 'Chuchvara', 'recipe': 'Kichik manti — qaynatiladi.'},
    {'name': 'Jarkop', 'recipe': 'Go‘sht, sabzavot — qozonda pishiriladi.'},
    {'name': 'Shashlik', 'recipe': 'Marinadlangan go‘sht — ko‘mirda qovuriladi.'},
    {'name': 'Tandir non', 'recipe': 'Xamir — tandirda yopishtirib pishiriladi.'},
    {'name': 'Qazi', 'recipe': 'Ot go‘shti, tuz — quritiladi.'},
    {'name': 'Shurpa', 'recipe': 'Go‘sht, sabzavot, suv — qaynatiladi.'},
    {'name16': 'Mastava', 'recipe': 'Guruch, go‘sht, sabzavot — qaynatiladi.'},
    {'name': 'Sutli palov', 'recipe': 'Guruch, sut, go‘sht — qaynatiladi.'},
    {'name': 'Xasip', 'recipe': 'Ichak, qiyma, guruch — qaynatiladi.'},
    {'name': 'Baliq palov', 'recipe': 'Baliq, guruch, sabzi — qaynatiladi.'},
    {'name': 'Osh', 'recipe': 'Palovning boshqa nomi.'},
    {'name': 'Tuxumli lag‘mon', 'recipe': 'Lag‘mon + tuxum — qovuriladi.'},

    // 21-40
    {'name': 'Pishiriq', 'recipe': 'Xamir, yog‘ — tandirda pishiriladi.'},
    {'name': 'Gushtli non', 'recipe': 'Non ichiga go‘sht solinadi.'},
    {'name': 'Qovurma lag‘mon', 'recipe': 'Lag‘mon + qovurilgan go‘sht.'},
    {'name': 'Piyozli manti', 'recipe': 'Manti ichiga ko‘p piyoz.'},
    {'name': 'Tovuq kabob', 'recipe': 'Tovuq go‘shti — ko‘mirda.'},
    {'name': 'Qatiqli shurpa', 'recipe': 'Shurpa + qatiq.'},
    {'name': 'Sutli choy', 'recipe': 'Choy, sut, tuz — aralashtiriladi.'},
    {'name': 'Qaymoq', 'recipe': 'Sutdan ajratilgan yog‘.'},
    {'name': 'Qurt', 'recipe': 'Qatiqdan quritilgan.'},
    {'name': 'Chakka', 'recipe': 'Qatiqni süzib olingan.'},
    {'name': 'Suzma', 'recipe': 'Chakka + tuz.'},
    {'name': 'Pishloq', 'recipe': 'Sutdan tayyorlanadi.'},
    {'name': 'Qaymoqli non', 'recipe': 'Non + qaymoq.'},
    {'name': 'Tuxumli non', 'recipe': 'Non ustiga tuxum qo‘shiladi.'},
    {'name': 'Shirin palov', 'recipe': 'Guruch, meva, shakar.'},
    {'name': 'Mevali choy', 'recipe': 'Choy + quritilgan meva.'},
    {'name': 'Qovurilgan baliq', 'recipe': 'Baliq — yog‘da qovuriladi.'},
    {'name': 'Tuxum barra', 'recipe': 'Tuxum, piyoz — qovuriladi.'},
    {'name': 'Kartoshka kabob', 'recipe': 'Kartoshka, go‘sht — ko‘mirda.'},
    {'name': 'Piyozli kabob', 'recipe': 'Kabob + piyoz.'},

    // 41-60
    {'name': 'Sabzavotli dimlama', 'recipe': 'Sabzavotlar — qozonda.'},
    {'name': 'Go‘shtli lag‘mon', 'recipe': 'Lag‘mon + ko‘p go‘sht.'},
    {'name': 'Qazi palov', 'recipe': 'Palov + qazi.'},
    {'name': 'Tuxumli manti', 'recipe': 'Manti ichiga tuxum.'},
    {'name': 'Sutli manti', 'recipe': 'Manti + sutli sous.'},
    {'name': 'Qatiqli manti', 'recipe': 'Manti + qatiq.'},
    {'name': 'Yog‘li non', 'recipe': 'Non + yog‘ surtiladi.'},
    {'name': 'Tandir kabob', 'recipe': 'Kabob tandirda pishiriladi.'},
    {'name': 'Baliqli shurpa', 'recipe': 'Shurpa + baliq.'},
    {'name': 'Tovuq shurpa', 'recipe': 'Shurpa + tovuq.'},
    {'name': 'Qoyilma', 'recipe': 'Go‘sht, sabzavot — qozonda.'},
    {'name': 'Xamirli shurpa', 'recipe': 'Shurpa + xamir bo‘laklari.'},
    {'name': 'Qazi lag‘mon', 'recipe': 'Lag‘mon + qazi.'},
    {'name': 'Pishloqli non', 'recipe': 'Non + pishloq.'},
    {'name': 'Sutli lag‘mon', 'recipe': 'Lag‘mon + sut.'},
    {'name': 'Qatiqli lag‘mon', 'recipe': 'Lag‘mon + qatiq.'},
    {'name': 'Qovurilgan kartoshka', 'recipe': 'Kartoshka — yog‘da qovuriladi.'},
    {'name': 'Piyozli kartoshka', 'recipe': 'Kartoshka + piyoz.'},
    {'name': 'Tuxumli kartoshka', 'recipe': 'Kartoshka + tuxum.'},
    {'name': 'Go‘shtli kartoshka', 'recipe': 'Kartoshka + go‘sht.'},

    // 61-80
    {'name': 'Sabzavotli kartoshka', 'recipe': 'Kartoshka + sabzavotlar.'},
    {'name': 'Qatiqli kartoshka', 'recipe': 'Kartoshka + qatiq.'},
    {'name': 'Pishloqli kartoshka', 'recipe': 'Kartoshka + pishloq.'},
    {'name': 'Yog‘li kartoshka', 'recipe': 'Kartoshka + ko‘p yog‘.'},
    {'name': 'Tandir kartoshka', 'recipe': 'Kartoshka — tandirda.'},
    {'name': 'Qovurma', 'recipe': 'Go‘sht — yog‘da qovuriladi.'},
    {'name': 'Piyozli qovurma', 'recipe': 'Qovurma + piyoz.'},
    {'name': 'Sabzavotli qovurma', 'recipe': 'Qovurma + sabzavot.'},
    {'name': 'Tuxumli qovurma', 'recipe': 'Qovurma + tuxum.'},
    {'name': 'Qatiqli qovurma', 'recipe': 'Qovurma + qatiq.'},
    {'name': 'Yog‘li qovurma', 'recipe': 'Qovurma + ko‘p yog‘.'},
    {'name': 'Tandir qovurma', 'recipe': 'Qovurma — tandirda.'},
    {'name': 'Baliqli qovurma', 'recipe': 'Baliq — qovuriladi.'},
    {'name': 'Tovuq qovurma', 'recipe': 'Tovuq — qovuriladi.'},
    {'name': 'Go‘shtli non 2', 'recipe': 'Non ichiga go‘sht.'},
    {'name': 'Pishloqli non 2', 'recipe': 'Non + pishloq.'},
    {'name': 'Qaymoqli non 2', 'recipe': 'Non + qaymoq.'},
    {'name': 'Tuxumli non 2', 'recipe': 'Non + tuxum.'},
    {'name': 'Yog‘li non 2', 'recipe': 'Non + yog‘.'},
    {'name': 'Shirin non', 'recipe': 'Non + shakar.'},

    // 81-100
    {'name': 'Mevali non', 'recipe': 'Non + quritilgan meva.'},
    {'name': 'Qatiqli non', 'recipe': 'Non + qatiq.'},
    {'name': 'Sutli non', 'recipe': 'Non + sut.'},
    {'name': 'Choyli non', 'recipe': 'Non + choy.'},
    {'name': 'Qurtli non', 'recipe': 'Non + qurt.'},
    {'name': 'Chakkali non', 'recipe': 'Non + chakka.'},
    {'name': 'Pishloqli manti', 'recipe': 'Manti + pishloq.'},
    {'name': 'Qatiqli manti 2', 'recipe': 'Manti + qatiq.'},
    {'name': 'Yog‘li manti', 'recipe': 'Manti + ko‘p yog‘.'},
    {'name': 'Piyozli manti 2', 'recipe': 'Manti + ko‘p piyoz.'},
    {'name': 'Tuxumli manti 2', 'recipe': 'Manti + tuxum.'},
    {'name': 'Sabzavotli manti', 'recipe': 'Manti + sabzavot.'},
    {'name': 'Go‘shtli manti 2', 'recipe': 'Manti + ko‘p go‘sht.'},
    {'name': 'Tovuq manti', 'recipe': 'Manti + tovuq go‘shti.'},
    {'name': 'Baliqli manti', 'recipe': 'Manti + baliq.'},
    {'name': 'Shirin manti', 'recipe': 'Manti + shakar, meva.'},
    {'name': 'Qatiqli non 2', 'recipe': 'Non + qatiq.'},
    {'name': 'Sutli non 2', 'recipe': 'Non + sut.'},
    {'name': 'Qaymoqli non 3', 'recipe': 'Non + qaymoq.'},
    {'name': 'Tuxumli non 3', 'recipe': 'Non + tuxum.'},
  ];

  List<Map<String, String>> get foods => List.unmodifiable(_foods);

  void addFood(String name, String recipe) {
    _foods.add({'name': name, 'recipe': recipe});
    notifyListeners();
  }
}

/* ======================  HOME PAGE  ====================== */
class FoodHomePage extends StatelessWidget {
  final FoodModel foodModel;
  const FoodHomePage({super.key, required this.foodModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('O‘zbek Taomlari')),
      body: AnimatedBuilder(
        animation: foodModel,
        builder: (_, __) {
          final list = foodModel.foods;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (_, i) {
              final f = list[i];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  leading: const Icon(Icons.restaurant_menu, color: Colors.orange),
                  title: Text(
                    f['name']!,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FoodDetailPage(name: f['name']!, recipe: f['recipe']!),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/* ======================  DETAIL PAGE  ====================== */
class FoodDetailPage extends StatelessWidget {
  final String name;
  final String recipe;
  const FoodDetailPage({super.key, required this.name, required this.recipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Text(recipe, style: const TextStyle(fontSize: 16, height: 1.5)),
        ),
      ),
    );
  }
}

/* ======================  SEARCH PAGE  ====================== */
class SearchPage extends StatefulWidget {
  final FoodModel foodModel;
  const SearchPage({super.key, required this.foodModel});
  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Qidiruv')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Taom nomini kiriting...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                filled: true,
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: widget.foodModel,
              builder: (_, __) {
                final results = widget.foodModel.foods
                    .where((e) => e['name']!.toLowerCase().contains(_query.toLowerCase()))
                    .toList();
                if (results.isEmpty) {
                  return const Center(child: Text('Hech narsa topilmadi'));
                }
                return ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (_, i) {
                    final f = results[i];
                    return ListTile(
                      leading: const Icon(Icons.search, color: Colors.orange),
                      title: Text(f['name']!),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FoodDetailPage(name: f['name']!, recipe: f['recipe']!),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ======================  ADD PAGE  ====================== */
class AddFoodPage extends StatefulWidget {
  final FoodModel foodModel;
  const AddFoodPage({super.key, required this.foodModel});
  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage> {
  final _nameCtrl = TextEditingController();
  final _recipeCtrl = TextEditingController();

  @override
  void dispose() {
    _nameCtrl.dispose();
    _recipeCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Taom qo‘shish')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameCtrl,
              decoration: InputDecoration(
                labelText: 'Taom nomi',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _recipeCtrl,
              decoration: InputDecoration(
                labelText: 'Retsept',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              maxLines: 5,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  final n = _nameCtrl.text.trim();
                  final r = _recipeCtrl.text.trim();
                  if (n.isNotEmpty && r.isNotEmpty) {
                    widget.foodModel.addFood(n, r);
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('$n qo‘shildi!')));
                    _nameCtrl.clear();
                    _recipeCtrl.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Barcha maydonlarni to‘ldiring')));
                  }
                },
                child: const Text('Qo‘shish', style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/* ======================  SETTINGS PAGE  ====================== */
class SettingsPage extends StatelessWidget {
  final VoidCallback onThemeToggle;
  const SettingsPage({super.key, required this.onThemeToggle});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(title: const Text('Sozlamalar')),
      body: ListView(
        children: [
          SwitchListTile(
            secondary: Icon(isDark ? Icons.dark_mode : Icons.light_mode),
            title: const Text('Tungi rejim'),
            value: isDark,
            onChanged: (_) => onThemeToggle(),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Ilova haqida'),
            subtitle: Text('O‘zbek taomlari • 100 ta taom • Flutter'),
          ),
          ListTile(
            leading: const Icon(Icons.restaurant_menu),
            title: const Text('Taomlar soni'),
            subtitle: Text('${FoodModel().foods.length} ta'),
          ),
        ],
      ),
    );
  }
}