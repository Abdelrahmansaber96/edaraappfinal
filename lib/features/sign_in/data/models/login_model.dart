import 'package:equatable/equatable.dart';

class LoginModel extends Equatable {
  final dynamic message;
  final bool? isAuthenticated;
  final String? username;
  final String? userId;
  final List<dynamic>? roles;
  final String? token;
  final String? empName;
  final int? empid;
  final dynamic customerName;
  final dynamic customerid;
  final dynamic repName;
  final dynamic repid;
  final bool? isCustomerAccount;
  final bool? isRepAccount;
  final bool? isNormalAccount;
  final String? expiresOn;
  final String? refreshToken;
  final DateTime? refreshTokenExpiration;

  const LoginModel({
    this.message,
    this.isAuthenticated,
    this.username,
    this.userId,
    this.roles,
    this.token,
    this.empName,
    this.empid,
    this.customerName,
    this.customerid,
    this.repName,
    this.repid,
    this.isCustomerAccount,
    this.isRepAccount,
    this.isNormalAccount,
    this.expiresOn,
    this.refreshToken,
    this.refreshTokenExpiration,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        message: json['message'] as dynamic,
        isAuthenticated: json['isAuthenticated'] as bool?,
        username: json['username'] as String?,
        userId: json['userId'] as String?,
        roles: json['roles'] as List<dynamic>?,
        token: json['token'] as String?,
        empName: json['empName'] as String?,
        empid: json['empid'] as int?,
        customerName: json['customerName'] as dynamic,
        customerid: json['customerid'] as dynamic,
        repName: json['repName'] as dynamic,
        repid: json['repid'] as dynamic,
        isCustomerAccount: json['isCustomerAccount'] as bool?,
        isRepAccount: json['isRepAccount'] as bool?,
        isNormalAccount: json['isNormalAccount'] as bool?,
        expiresOn: json['expiresOn'] as String?,
        refreshToken: json['refreshToken'] as String?,
        refreshTokenExpiration: json['refreshTokenExpiration'] == null
            ? null
            : DateTime.parse(json['refreshTokenExpiration'] as String),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'isAuthenticated': isAuthenticated,
        'username': username,
        'userId': userId,
        'roles': roles,
        'token': token,
        'empName': empName,
        'empid': empid,
        'customerName': customerName,
        'customerid': customerid,
        'repName': repName,
        'repid': repid,
        'isCustomerAccount': isCustomerAccount,
        'isRepAccount': isRepAccount,
        'isNormalAccount': isNormalAccount,
        'expiresOn': expiresOn,
        'refreshToken': refreshToken,
        'refreshTokenExpiration': refreshTokenExpiration?.toIso8601String(),
      };

  @override
  List<Object?> get props {
    return [
      message,
      isAuthenticated,
      username,
      userId,
      roles,
      token,
      empName,
      empid,
      customerName,
      customerid,
      repName,
      repid,
      isCustomerAccount,
      isRepAccount,
      isNormalAccount,
      expiresOn,
      refreshToken,
      refreshTokenExpiration,
    ];
  }
}
