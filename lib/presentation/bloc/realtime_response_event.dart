import 'package:equatable/equatable.dart';

abstract class RealTimeResponseEvent extends Equatable {
  const RealTimeResponseEvent();

  @override
  List<Object?> get props => [];
}

class SendQuestion extends RealTimeResponseEvent {
  final String question;

  const SendQuestion(this.question);

  @override
  List<Object> get props => [question];
}
