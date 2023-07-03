import 'package:flutter/material.dart';

class TapItem extends StatelessWidget {
  bool selected;
  String source;
  TapItem(this.selected, this.source);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: selected ? Theme.of(context).primaryColor : Colors.transparent,
        border: Border.all(
          color: Theme.of(context).primaryColor,
        ),
      ),
      child: Text(source,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
            color: selected? Colors.white:Theme.of(context).primaryColor,
          ),
      ),
    );
  }
}
