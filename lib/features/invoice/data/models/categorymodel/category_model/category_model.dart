import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  final String? categoryCode;
  final String? categoryName;
  final bool? isActive;
  final dynamic message;

  const CategoryModel({
    this.categoryCode,
    this.categoryName,
    this.isActive,
    this.message,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        categoryCode: json['categoryCode'] as String?,
        categoryName: json['categoryName'] as String?,
        isActive: json['isActive'] as bool?,
        message: json['message'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'categoryCode': categoryCode,
        'categoryName': categoryName,
        'isActive': isActive,
        'message': message,
      };

  @override
  List<Object?> get props {
    return [
      categoryCode,
      categoryName,
      isActive,
      message,
    ];
  }
}
