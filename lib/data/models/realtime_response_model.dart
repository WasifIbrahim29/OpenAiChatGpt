import 'package:chatgpt_app/domain/entities/realtime_response.dart';
import 'package:equatable/equatable.dart';

class RealTimeResponseModel extends Equatable {
  RealTimeResponseModel(
      {this.id, this.object, this.created, this.model, this.choices});

  String? id;
  String? object;
  int? created;
  String? model;
  List<Choices>? choices;

  factory RealTimeResponseModel.fromJson(Map<String, dynamic> json) {
    List<Choices> choices = <Choices>[];
    if (json['choices'] != null) {
      choices = <Choices>[];
      json['choices'].forEach((v) {
        choices.add(new Choices.fromJson(v));
      });
    }
    return RealTimeResponseModel(
      id: json['id'],
      object: json['object'],
      created: json['created'],
      model: json['model'],
      choices: choices,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['object'] = this.object;
    data['created'] = this.created;
    data['model'] = this.model;
    if (this.choices != null) {
      data['choices'] = this.choices!.map((v) => v.toJson()).toList();
    }
    return data;
  }

  RealTimeResponse toEntity() => RealTimeResponse(
        id: id,
        object: object,
        created: created,
        model: model,
        choices: choices,
      );

  @override
  List<Object?> get props => [
        id,
        object,
        created,
        model,
        choices,
      ];
}
