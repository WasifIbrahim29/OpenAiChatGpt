import 'package:equatable/equatable.dart';

class RealTimeResponse extends Equatable {
  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;

  RealTimeResponse(
      {this.id, this.object, this.created, this.model, this.choices});

  @override
  List<Object?> get props => [
        id,
        object,
        created,
        model,
        choices,
      ];
}

class Choices {
  int? index;
  Delta? delta;
  String? finishReason;

  Choices({this.index, this.delta, this.finishReason});

  Choices.fromJson(Map<String, dynamic> json) {
    index = json['index'];
    delta = json['delta'] != null ? new Delta.fromJson(json['delta']) : null;
    finishReason = json['finish_reason'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['index'] = this.index;
    if (this.delta != null) {
      data['delta'] = this.delta!.toJson();
    }
    data['finish_reason'] = this.finishReason;
    return data;
  }
}

class Delta {
  String? content;

  Delta({this.content});

  Delta.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['content'] = this.content;
    return data;
  }
}
