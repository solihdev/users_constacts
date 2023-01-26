import 'package:flutter/material.dart';
import 'package:users_contacts/ui/tab_box/tabs/add_contact/add_contact.dart';

import 'tabs/get_contact/get_contacts.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List pages = [
      AddContactScreen(),
      const GetContactsScreen(),
    ];
    return Scaffold(
      body: pages[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_outlined),
            label: "",
          ),
        ],
      ),
    );
  }
}
