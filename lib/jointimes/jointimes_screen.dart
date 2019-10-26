import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:joinmun_2019/dialogs/error_dialog.dart';
import 'package:joinmun_2019/jointimes/jointimes_front.dart';
import 'index.dart';

class JointimesScreen extends StatefulWidget {
  JointimesScreen(
      {Key key,
      @required JointimesBloc jointimesBloc,
      @required Completer<void> refreshCompleter})
      : _jointimesBloc = jointimesBloc,
        super(key: key);

  final JointimesBloc _jointimesBloc;
  Completer<void> _refreshCompleter;

  @override
  JointimesScreenState createState() {
    return JointimesScreenState(_jointimesBloc, _refreshCompleter);
  }
}

class JointimesScreenState extends State<JointimesScreen> {
  final JointimesBloc _jointimesBloc;
  Completer<void> _refreshCompleter;
  JointimesScreenState(this._jointimesBloc, this._refreshCompleter);

  @override
  void initState() {
    super.initState();
    this._refreshCompleter = Completer<void>();
    this._jointimesBloc.dispatch(LoadJointimesEvent());
  }

  @override
  void dispose() {
    super.dispose();
    //this._jointimesBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: widget._jointimesBloc,
      listener: (context, state) {
        if (state is JointimesError) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorDialog(
              error: state.errorMessage,
              onTap: () {
                _jointimesBloc.dispatch(LoadJointimesEvent());
              },
            ),
          );
        }
      },
      child: BlocBuilder<JointimesBloc, JointimesState>(
          bloc: widget._jointimesBloc,
          builder: (
            BuildContext context,
            JointimesState currentState,
          ) {
            if (currentState is JointimesEmpty) {
              return RefreshIndicator(
                onRefresh: () {
                  _jointimesBloc.dispatch(LoadJointimesEvent());
                  return _refreshCompleter.future;
                },
                child: Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                        "There are no posts yet, please come back later",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.title.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                        maxLines: 2,
                      ),
                  ),
                ),
              );
            }
            if (currentState is JointimesLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (currentState is JointimesError) {
              return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      currentState.errorMessage ?? 'Error',
                      textAlign: TextAlign.center,
                    ),
                  ));
            }
            return RefreshIndicator(
                onRefresh: () {
                  _jointimesBloc.dispatch(LoadJointimesEvent());
                  return _refreshCompleter.future;
                },
                child: JointimesFront());
          }),
    );
  }
}
