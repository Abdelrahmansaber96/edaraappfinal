import 'package:equatable/equatable.dart';

class PermissionModel extends Equatable {
  final dynamic permissionId;
  final dynamic num;
  final dynamic permissionDate;
  final dynamic closingDate;
  final dynamic permissionTotal;
  final dynamic status;
  final dynamic repId;
  final dynamic empId;
  final String? message;

  const PermissionModel({
    this.permissionId,
    this.num,
    this.permissionDate,
    this.closingDate,
    this.permissionTotal,
    this.status,
    this.repId,
    this.empId,
    this.message,
  });

  factory PermissionModel.fromJson(Map<String, dynamic> json) =>
      PermissionModel(
        permissionId: json['permissionId'] as dynamic,
        num: json['num'] as dynamic,
        permissionDate: json['permissionDate'] as dynamic,
        closingDate: json['closingDate'] as dynamic,
        permissionTotal: json['permissionTotal'] as dynamic,
        status: json['status'] as dynamic,
        repId: json['repId'] as dynamic,
        empId: json['empId'] as dynamic,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'permissionId': permissionId,
        'num': num,
        'permissionDate': permissionDate,
        'closingDate': closingDate,
        'permissionTotal': permissionTotal,
        'status': status,
        'repId': repId,
        'empId': empId,
        'message': message,
      };

  @override
  List<Object?> get props {
    return [
      permissionId,
      num,
      permissionDate,
      closingDate,
      permissionTotal,
      status,
      repId,
      empId,
      message,
    ];
  }
}
