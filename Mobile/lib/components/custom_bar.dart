// ignore_for_file: file_names
import 'package:flutter/material.dart';

class CustomBottomBar extends StatefulWidget {
  final int selectedIndex;
  const CustomBottomBar({super.key, required this.selectedIndex});

  @override
  // ignore: library_private_types_in_public_api
  _CustomBottomBarState createState() => _CustomBottomBarState();
}

class _CustomBottomBarState extends State<CustomBottomBar> {
  int _selectedIndex = 2;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.selectedIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    switch (index) {
      // case 0:
      //   Navigator.of(context)
      //       .push(MaterialPageRoute(builder: (context) => const HomePage()));
      //   break;
      case 1:
        Navigator.of(context).pushNamed("/statistics");
        break;
      case 2:
        Navigator.of(context).pushNamed("/");
        break;
      case 3:
        Navigator.of(context).pushNamed("/categories");
        break;
      // case 4:
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => WalletPage()));
      //   break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildIconButton(0, Icons.person_outline, 'Compte'),
        _buildIconButton(1, Icons.signal_cellular_alt, 'Statistique'),
        _buildIconButton(2, Icons.add, 'Plus'),
        _buildIconButton(3, Icons.category_outlined, 'Categories'),
        _buildIconButton(4, Icons.account_balance_wallet_outlined, 'Pochette'),
      ],
    );
  }

  Widget _buildIconButton(int index, IconData icon, String label) {
    if (_selectedIndex == index) {
      return Transform.translate(
        offset: const Offset(0, -40),
        child: Container(
          width: 75,
          height: 75,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(color: Colors.transparent),
          ),
          child: IconButton(
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(icon, color: Colors.white, size: 45),
              ],
            ),
            onPressed: () => _onItemTapped(index),
          ),
        ),
      );
    } else {
      return IconButton(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.grey, size: 35),
            Text(label, style: const TextStyle(color: Colors.grey)),
          ],
        ),
        onPressed: () => _onItemTapped(index),
      );
    }
  }
}
