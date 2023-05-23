import 'package:quizz/common_dependencies.dart';

void registerDependencies() {
  GetIt.I.registerLazySingleton(() => BubbleLogic());
}
