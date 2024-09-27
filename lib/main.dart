import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  bool _isShopPage = false;

  final List<Widget> _pages = [
    const HomePage(),
    const PlantsPage(),
  ];

  void _onItemTapped(int index) {
    if (index == 2) {
      setState(() {
        _isShopPage = true;
      });
    } else {
      setState(() {
        _selectedIndex = index;
        _isShopPage = false;
      });
    }
  }

  void _goBack() {
    setState(() {
      _isShopPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: _isShopPage
            ? AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: _goBack,
                ),
                centerTitle: true,
                title: const Text('Shop'),
              )
            : AppBar(
                title: const Text('MyApp'),
              ),
        body: _isShopPage ? const ShopPage() : _pages[_selectedIndex],
        bottomNavigationBar: _isShopPage
            ? BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.store),
                    label: '상품',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shopping_cart),
                    label: '장바구니',
                  ),
                ],
                currentIndex: 0,
                onTap: (index) {},
              )
            : BottomNavigationBar(
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.local_florist),
                    label: 'Plants',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.shop),
                    label: 'Shop',
                  ),
                ],
                currentIndex: _selectedIndex,
                onTap: _onItemTapped,
              ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Home Page'),
    );
  }
}

class PlantsPage extends StatelessWidget {
  const PlantsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Plants Page'),
    );
  }
}

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Shop Page'),
    );
  }
}
