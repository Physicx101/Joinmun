import 'package:equatable/equatable.dart';
import 'package:joinmun_2019/model/post.dart';
import 'package:meta/meta.dart';

@immutable
abstract class JointimesState extends Equatable {
  JointimesState([Iterable props]) : super();

  /// Copy object for use in action
  JointimesState getStateCopy();
}

/// Empty
class JointimesEmpty extends JointimesState {
  @override
  String toString() => 'Jointimes Empty';

  @override
  JointimesState getStateCopy() {
    return JointimesEmpty();
  }

  @override
  List<Object> get props => null;
}

/// Loading
class JointimesLoading extends JointimesState {
  @override
  String toString() => 'Jointimes Loading';

  @override
  JointimesState getStateCopy() {
    return JointimesLoading();
  }

  @override
  List<Object> get props => null;
}

/// Data loaded
class JointimesLoaded extends JointimesState {
  final PostData postData;

  JointimesLoaded({@required this.postData,}) 
  : super([postData,]);

  @override
  String toString() => 'Jointimes Loaded';

  @override
  JointimesState getStateCopy() {
    return JointimesLoaded(
      postData: this.postData,
    );
  }

  @override
  List<Object> get props => null;
}

class JointimesError extends JointimesState {
  final String errorMessage;

  JointimesError(this.errorMessage);

  @override
  String toString() => 'Jointimes Error';

  @override
  JointimesState getStateCopy() {
    return JointimesError(this.errorMessage);
  }

  @override
  List<Object> get props => null;
}
