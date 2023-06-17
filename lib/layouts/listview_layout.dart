import 'package:flutter/material.dart';
import '../Configs/theme.dart';
import '../models/listview_item.dart';

class ListViewLayout extends StatefulWidget {
  final List<ListViewItem> items;
  const ListViewLayout({
    Key? key,
    required this.items,
  }) : super(key: key);

  @override
  State<ListViewLayout> createState() => _ListViewLayoutState();
}

class _ListViewLayoutState extends State<ListViewLayout> {
  _renderButton({
    required ListViewItem item,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => item.page,
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: THEME.greyBorderColor,
            ),
            bottom: BorderSide(
              color: THEME.greyBorderColor,
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                item.name,
              ),
              const Icon(
                Icons.chevron_right,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '코드팩토리',
        ),
      ),
      body: ListView.separated(
        itemCount: widget.items.length,
        separatorBuilder: (context, index) {
          return Container(
            height: 8.0,
          );
        },
        itemBuilder: (context, index) {
          return _renderButton(
            item: widget.items[index],
          );
        },
      ),
    );
  }
}
