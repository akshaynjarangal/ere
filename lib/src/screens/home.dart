import 'package:ereakshay/src/provider/post_provider.dart';
import 'package:ereakshay/src/screens/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<PostProvider>(
        builder: (context,state,_) {
          if(state.isLoading){
            return const Center(
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
                strokeWidth: 2,
              ),
            );
          }
          if(state.posts.isNotEmpty){
            return SafeArea(
              child: RefreshIndicator(
                onRefresh: () async{
                  context.read<PostProvider>().getUserPosts;
                },
                child: SingleChildScrollView(
                  child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: List.generate(state.posts.length, (index) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                                  settings: RouteSettings(
                                    arguments: state.posts[index]
                                  ),
                                  builder: (context)=>const UserProfile())),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: Image.network('${state.posts[index].owner?.picture}',
                                      fit: BoxFit.cover,
                                      height: 50,
                                      ),
                                    ),
                                    const SizedBox(width: 16),
                                    Expanded(child: Text('${state.posts[index].owner?.firstName} ${state.posts[index].owner?.lastName}'))
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 200,
                              width: double.infinity,
                              margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("${state.posts[index].image}"))),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ),
              ),
            );
          }
          return Container();
        }
      ),
    );
  }
}