import 'package:flutter_bloc/flutter_bloc.dart';

class BlocWrapper<T extends Cubit<Object?>> {
  final T bloc;

  BlocWrapper(this.bloc);
}
