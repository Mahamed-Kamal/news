import 'package:flutter/material.dart';

import '../../api/model/sources_responses/Source.dart';
import '../../shared/style/componenets/tap_item.dart';
import 'news_list_fragment.dart';

class ArticlesScreen extends StatefulWidget {
  List<Source>? sources;

  ArticlesScreen(this.sources);

  @override
  State<ArticlesScreen> createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources?.length ?? 0,
      child: Column(
        children: [
          TabBar(
            isScrollable: true,
            indicatorColor: Colors.transparent,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            tabs: widget.sources
                    ?.map((source) => TapItem(
                        selectedIndex == widget.sources?.indexOf(source),
                        source))
                    .toList() ??
                [],
          ),
          NewsListFragment(widget.sources?[selectedIndex]),
        ],
      ),
    );
  }
}
