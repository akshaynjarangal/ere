import 'package:ereakshay/src/data/model/post_model.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments as UserFeed;
    return Scaffold(
      appBar: AppBar(
        title: Text('${arg.owner?.firstName} ${arg.owner?.lastName}'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: NetworkImage("${arg.owner?.picture}"))),
          ),
          const SizedBox(
            height: 32,
          ),
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage("${arg.image}"))),
          ),
          const SizedBox(
            height: 16,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Tags',style: TextStyle(fontWeight: FontWeight.bold),),
          ),
          const SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Wrap(
              spacing: 16,
              runSpacing: 16,
              children: List.generate(arg.tags?.length??0, (index) => Chip(label: Text('${arg.tags?[index]}'))),
            ),
          )
        ],
      ),
    );
  }
}
