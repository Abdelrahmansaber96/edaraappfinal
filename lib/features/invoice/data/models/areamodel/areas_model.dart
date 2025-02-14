import 'package:equatable/equatable.dart';

class AreasModel extends Equatable {
  final int? id;
  final String? areaName;

  const AreasModel({this.id, this.areaName});

  factory AreasModel.fromJson(Map<String, dynamic> json) => AreasModel(
        id: json['id'] as int?,
        areaName: json['areaName'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'areaName': areaName,
      };

  @override
  List<Object?> get props => [id, areaName];
}
