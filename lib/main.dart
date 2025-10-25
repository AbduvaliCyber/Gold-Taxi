import 'package:flutter/material.dart';


void main() {
  runApp(const GoldTaxiApp());
}

class GoldTaxiApp extends StatelessWidget {
  const GoldTaxiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gold Taxi',
      theme: ThemeData(
        primaryColor: Colors.black,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
            foregroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
          labelLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
        ),

      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// Kirish Ekrani
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  void _login() {
    if (!mounted) return;
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Iltimos, email va parolni kiriting'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Iltimos, to‘g‘ri email kiriting'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      try {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Xato: $e')),
        );
      }
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kirish'),
        ),
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                  children: [
                  const SizedBox(height: 20),
              // Waving person animation
              SizedBox(
                height: 150,


              ),


                    const SizedBox(height: 20),
                    const Text(
                      'Gold Taxi ga xush kelibsiz',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        prefixIcon: Icon(Icons.email, color: Colors.amber),
                        hintText: 'Masalan, example@domain.com',
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Parol',
                        prefixIcon: Icon(Icons.lock, color: Colors.amber),
                        hintText: 'Parolingizni kiriting',
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: _isLoading ? null : _login,
                      child: _isLoading
                          ? const CircularProgressIndicator(color: Colors.black)
                          : const Text('Kirish'),
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        if (!mounted) return;
                        try {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const SignUpScreen()),
                          );
                        } catch (e) {
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Xato: $e')),
                          );
                        }
                      },
                      child: const Text(
                        'Ro‘yxatdan o‘tish',
                        style: TextStyle(fontSize: 16, color: Colors.blue),
                      ),
                    ),
                  ],
              ),
            ),
        ),
    );
  }
}

// Ro'yxatdan o'tish Ekrani
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isLoading = false;

  bool _isValidEmail(String email) {
    return email.contains('@') && email.contains('.');
  }

  void _signUp() {
    if (!mounted) return;
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Iltimos, barcha maydonlarni to‘ldiring'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    if (!_isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Iltimos, to‘g‘ri email kiriting'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    Future.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() {
        _isLoading = false;
      });
      try {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
        );
      } catch (e) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Xato: $e')),
        );
      }
    });
  }


  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ro‘yxatdan o‘tish'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const SizedBox(height: 40),
              const Text(
                'Gold Taxi da hisob yaratish',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Ismingiz',
                  prefixIcon: Icon(Icons.person, color: Colors.amber),
                  hintText: 'Masalan, Ali',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email, color: Colors.amber),
                  hintText: 'Masalan, example@domain.com',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Parol',
                  prefixIcon: Icon(Icons.lock, color: Colors.amber),
                  hintText: 'Parolingizni kiriting',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _isLoading ? null : _signUp,
                child: _isLoading
                    ? const CircularProgressIndicator(color: Colors.black)
                    : const Text('Ro‘yxatdan o‘tish'),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  if (!mounted) return;
                  try {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                    );
                  } catch (e) {
                    if (!mounted) return;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Xato: $e')),
                    );
                  }
                },
                child: const Text(
                  'Hisobingiz bormi? Kirish',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Asosiy sahifa
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pickupController = TextEditingController();
  final dropoffController = TextEditingController();
  String selectedTimeOption = 'Hozir';
  bool showCars = false;
  double? distance;
  double? estimatedTime;


  // Mock car data with high-quality images
  final List<Map<String, dynamic>> cars = [
    {
      'name': 'Gold Economy',
      'rang': 'Oq',
      'nomer': '234',
      'price': 15000,
      'eta': '5 daqiqa',
      'speed': 35.0, // km/h
      'image': 'https://images.unsplash.com/photo-1504215680853-4c06b5f8f033?q=80&w=800', // Sedan
    },
    {
      'name': 'Gold Comfort',
      'rang': 'Qora',
      'nomer': '567',
      'price': 20000,
      'eta': '7 daqiqa',
      'speed': 40.0, // km/h
      'image': 'https://images.unsplash.com/photo-1503376780353-7e6692767b70?q=80&w=800', // SUV
    },
    {
      'name': 'Gold Premium',
      'rang': 'Qizil',
      'nomer': '890',
      'price': 25000,
      'eta': '10 daqiqa',
      'speed': 45.0, // km/h
      'image': 'https://images.unsplash.com/photo-1502877338535-766e1452684a?q=80&w=800', // Luxury car
    },
  ];

  // Mock distance table for Uzbekistan cities (in km)
  final Map<List<String>, double> distanceTable = {
    ['toshkent', 'samarqand']: 300.0,
    ['toshkent', 'buxoro']: 550.0,
    ['toshkent', 'farg\'ona']: 320.0,
    ['samarqand', 'buxoro']: 270.0,
    ['samarqand', 'farg\'ona']: 580.0,
    ['buxoro', 'farg\'ona']: 820.0,
  };

  // Calculate distance based on city pairs
  double _calculateDistance(String pickup, String dropoff) {
    pickup = pickup.toLowerCase().trim();
    dropoff = dropoff.toLowerCase().trim();
    final key1 = [pickup, dropoff];
    final key2 = [dropoff, pickup];
    if (distanceTable.containsKey(key1)) {
      return distanceTable[key1]!;
    } else if (distanceTable.containsKey(key2)) {
      return distanceTable[key2]!;
    }
    return 10.0; // Default distance
  }

  // Calculate time based on distance and car speed
  double _calculateEstimatedTime(double distance, double speed) {
    return (distance / speed) * 60; // Convert to minutes
  }

  void _placeOrder() {
    if (!mounted) return;
    final pickup = pickupController.text.trim();
    final dropoff = dropoffController.text.trim();

    if (pickup.isEmpty || dropoff.isEmpty) {
      try {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Iltimos, barcha maydonlarni to‘ldiring'),
            backgroundColor: Colors.red,
          ),
        );
      } catch (e) {
        return;
      }
      return;
    }

    setState(() {
      distance = _calculateDistance(pickup, dropoff);
      estimatedTime = _calculateEstimatedTime(distance!, 40.0);
      showCars = true;
    });
  }


  void _confirmRide(Map<String, dynamic> car) {
    if (!mounted) return;
    final timeForCar = _calculateEstimatedTime(distance!, car['speed']);
    try {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Sayohatni tasdiqlash', style: TextStyle(fontWeight: FontWeight.bold)),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Siz ${car['name']} ni tanladingiz', style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                Text('Qayerdan: ${pickupController.text}'),
                Text('Qayerga: ${dropoffController.text}'),
                Text('Masofa: ${distance!.toStringAsFixed(2)} km'),
                Text('Taxminiy vaqt: ${timeForCar.toStringAsFixed(0)} daqiqa'),
                Text('Narxi: ${car['price']} UZS'),
                Text('Yetib kelish vaqti: ${car['eta']}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (!mounted) return;
                Navigator.pop(context);
              },
              child: const Text('Bekor qilish', style: TextStyle(color: Colors.black)),
            ),
            ElevatedButton(
              onPressed: () {
                if (!mounted) return;
                Navigator.pop(context);
                try {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Sayohat ${car['name']} bilan tasdiqlandi!')),
                  );
                  setState(() {
                    pickupController.clear();
                    dropoffController.clear();
                    showCars = false;
                    distance = null;
                    estimatedTime = null;
                  });
                } catch (e) {
                  if (!mounted) return;
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Xato: $e')),
                  );
                }
              },
              child: const Text('Tasdiqlash'),
            ),
          ],
        ),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xato: $e')),
      );
    }
  }

  void _logout() {
    if (!mounted) return;
    try {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginScreen()),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Xato: $e')),
      );
    }
  }

  @override
  void dispose() {
    pickupController.dispose();
    dropoffController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Gold Taxi'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: _logout,
              tooltip: 'Chiqish',
            ),
          ],
        ),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                  Container(
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: NetworkImage('https://images.unsplash.com/photo-1563013561-0b6f4f5a5f45?q=80&w=800'),
                      fit: BoxFit.cover,
                      opacity: 0.7,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'Xarita (Namuna)',
                      style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, backgroundColor: Colors.black54),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Qayerga ketmoqchisiz?',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: pickupController,
                  decoration: const InputDecoration(
                    labelText: 'Qayerdan',
                    prefixIcon: Icon(Icons.my_location, color: Colors.green),
                    hintText: 'Masalan, Toshkent',
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: dropoffController,
                  decoration: const InputDecoration(
                    labelText: 'Qayerga',
                    prefixIcon: Icon(Icons.location_on, color: Colors.red),
                    hintText: 'Masalan, Samarqand',
                  ),
                ),
                const SizedBox(height: 15),
                DropdownButton<String>(
                  value: selectedTimeOption,
                  items: ['Hozir', 'Keyinroq']
                      .map((String value) => DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  ))
                      .toList(),
                  onChanged: (newValue) {
                    if (!mounted) return;
                    setState(() {
                      selectedTimeOption = newValue!;
                    });
                  },
                  isExpanded: true,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                  dropdownColor: Colors.white,
                ),
                if (distance != null && estimatedTime != null) ...[
            const SizedBox(height: 15),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Masofa: ${distance!.toStringAsFixed(2)} km',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Taxminiy vaqt: ${estimatedTime!.toStringAsFixed(0)} daqiqa',
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ),
        ],
        const SizedBox(height: 20),
    ElevatedButton(
    onPressed: _placeOrder,
    child: const Text('Sayohatni rejalashtirish'),
    ),
    const SizedBox(height: 20),

                    if (showCars) ...[
                      const Text(
                        'Mavjud mashinalar',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...cars.map((car) => Card(
                        child: ListTile(
                          leading: Image.network(
                            car['image'],
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const Icon(
                              Icons.directions_car,
                              color: Colors.amber,
                            ),
                          ),
                          title: Text('${car['name']} (${car['rang']})'),
                          subtitle: Text(
                            'Nomer: ${car['nomer']}\n'
                                'Narxi: ${car['price']} UZS\n'
                                'Yetib kelish: ${car['eta']}',
                          ),
                          onTap: () => _confirmRide(car),
                        ),
                      )),
                    ],
                  ],
                ),
            ),
        ),
    );
  }
}
