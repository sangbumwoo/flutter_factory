import 'package:flutter/material.dart';
import 'package:flutter_factory/screens/form_screen.dart';
import 'package:flutter_factory/screens/layout.dart';
import '../../layouts/listview_layout.dart';
import '../../models/listview_item.dart';
import '../../screens/row_and_column.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListViewLayout(
      items: [
        ListViewItem(
          name: 'Row & Column',
          page: const RowAndColumnScreen(),
        ),
        ListViewItem(
          name: 'Layout',
          page: const Layout(),
        ),
        ListViewItem(
          name: 'Form Input',
          page: const FormScreen(),
        ),
      ],
    );
  }
}
