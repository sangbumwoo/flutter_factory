import 'package:flutter/material.dart';
import 'index.dart';

class ListViewItem extends BaseModel {
  final String name;
  final Widget page;

  ListViewItem({
    required this.name,
    required this.page,
  });
}
