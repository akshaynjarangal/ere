import 'package:ereakshay/src/data/repository/post_repo.dart';
import 'package:ereakshay/src/data/service/post_service.dart';
import 'package:ereakshay/src/provider/post_provider.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupDependencies() {
  getIt.registerLazySingleton<PostService>(() => PostImpl());
  getIt.registerLazySingleton<PostRepo>(() => PostRepo(postService: getIt<PostService>()));
  getIt.registerFactory<PostProvider>(() => PostProvider(postRepo : getIt<PostRepo>()));
}