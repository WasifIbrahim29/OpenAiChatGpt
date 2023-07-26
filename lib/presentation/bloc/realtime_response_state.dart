import 'package:chatgpt_app/domain/entities/realtime_response.dart';
import 'package:equatable/equatable.dart';

abstract class RealTimeResponseState extends Equatable {
  const RealTimeResponseState();

  @override
  List<Object?> get props => [];
}

class RealTimeResponseEmpty extends RealTimeResponseState {}

class RealTimeResponseLoading extends RealTimeResponseState {}

class RealTimeResponseError extends RealTimeResponseState {
  final String message;

  RealTimeResponseError(this.message);

  @override
  List<Object?> get props => [message];
}

class RealTimeResponseHasData extends RealTimeResponseState {
  final RealTimeResponse result;

  RealTimeResponseHasData(this.result);

  @override
  List<Object?> get props => [result];
}
