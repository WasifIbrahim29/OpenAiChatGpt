import 'dart:async';

import 'package:chatgpt_app/domain/usecases/get_realtime_response.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RealTimeResponseBloc extends Bloc<String, Stream<String>> {
  final GetRealTimeResponse _getRealTimeResponse;

  RealTimeResponseBloc(this._getRealTimeResponse)
      : super(const Stream<String>.empty());

  @override
  Stream<Stream<String>> mapEventToState(String question) async* {
    final result = await _getRealTimeResponse.execute(question);
    yield result;
  }
}
