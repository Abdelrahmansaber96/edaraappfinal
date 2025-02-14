import 'package:equatable/equatable.dart';

class CustomerModel extends Equatable {
  final int? customerId;
  final String? customerName;
  final dynamic address;
  final dynamic email;
  final dynamic startDate;
  final bool? isActive;
  final dynamic deptBalance;
  final dynamic startDebt;
  final int? areaId;
  final String? areaName;
  final dynamic message;
  final dynamic phones;

  const CustomerModel({
    this.customerId,
    this.customerName,
    this.address,
    this.email,
    this.startDate,
    this.isActive,
    this.deptBalance,
    this.startDebt,
    this.areaId,
    this.areaName,
    this.message,
    this.phones,
  });

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
        customerId: json['customerId'] as int?,
        customerName: json['customerName'] as String?,
        address: json['address'] as dynamic,
        email: json['email'] as dynamic,
        startDate: json['startDate'] as dynamic,
        isActive: json['isActive'] as bool?,
        deptBalance: json['deptBalance'] as dynamic,
        startDebt: json['startDebt'] as dynamic,
        areaId: json['areaId'] as int?,
        areaName: json['areaName'] as String?,
        message: json['message'] as dynamic,
        phones: json['phones'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'customerId': customerId,
        'customerName': customerName,
        'address': address,
        'email': email,
        'startDate': startDate,
        'isActive': isActive,
        'deptBalance': deptBalance,
        'startDebt': startDebt,
        'areaId': areaId,
        'areaName': areaName,
        'message': message,
        'phones': phones,
      };

  @override
  List<Object?> get props {
    return [
      customerId,
      customerName,
      address,
      email,
      startDate,
      isActive,
      deptBalance,
      startDebt,
      areaId,
      areaName,
      message,
      phones,
    ];
  }
}
