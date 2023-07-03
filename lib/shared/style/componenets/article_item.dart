import 'package:flutter/material.dart';

class ArticleItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          width: double.infinity,
          height: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
            image: AssetImage('assets/images/articleSport_image.png'),
            fit: BoxFit.cover,
          )),
        ),
        SizedBox(height: 10),
        Text('BBC News',style: Theme.of(context).textTheme.titleMedium),
        SizedBox(height: 10),
        Text("Why are football's biggest clubs starting a new \ntournament?",style: TextStyle(
          fontSize: 14,
          color: Color(0xFF42505C),
        )),
        SizedBox(height: 10),
        Text('3 hours ago',style: Theme.of(context).textTheme.titleLarge,textAlign: TextAlign.right,)
        



      ],
    );
  }
}
