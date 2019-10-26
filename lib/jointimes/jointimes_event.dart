import 'dart:async';
import 'package:joinmun_2019/jointimes/jointimes_provider.dart';
import 'package:joinmun_2019/jointimes/index.dart';
import 'package:meta/meta.dart';

@immutable
abstract class JointimesEvent {
  Future<JointimesState> applyAsync(
      {JointimesState currentState, JointimesBloc bloc});
}

class LoadJointimesEvent extends JointimesEvent {
  final IJointimesProvider _jointimesProvider = JointimesProvider();
  @override
  String toString() => 'Load Jointimes Event';

  @override
  Future<JointimesState> applyAsync(
      {JointimesState currentState, JointimesBloc bloc}) async {
    try {
      var posts = await _jointimesProvider.getPosts();
      if (posts.posts.isEmpty) {
        return JointimesEmpty();
      } else {
        return JointimesLoaded(postData: posts);
      }
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return JointimesError(_?.toString());
    }
  }
}
