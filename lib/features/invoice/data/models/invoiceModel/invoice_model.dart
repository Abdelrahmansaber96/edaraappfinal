import 'package:equatable/equatable.dart';

class InvoiceModel extends Equatable {
  final String? invId;
  final String? invDate;
  final int? payementId;
  final int? customerId;
  final int? repId;
  final String? productId;
  final int? priceId;
  final int? descount;
  final int? quantity;
  final int? availableQuantity;
  final int? totalStock;
  final int? subTotalPreDiscont;
  final int? subTotal;
  final int? actualSubTotal;
  final int? invTotal;
  final int? empId;
  final int? rowId;
  final String? permissionId;
  final String? message;

  const InvoiceModel({
    this.invId,
    this.invDate,
    this.payementId,
    this.customerId,
    this.repId,
    this.productId,
    this.priceId,
    this.descount,
    this.quantity,
    this.availableQuantity,
    this.totalStock,
    this.subTotalPreDiscont,
    this.subTotal,
    this.actualSubTotal,
    this.invTotal,
    this.empId,
    this.rowId,
    this.permissionId,
    this.message,
  });

  factory InvoiceModel.fromJson(Map<String, dynamic> json) => InvoiceModel(
        invId: json['invId'] as String?,
        invDate: json['invDate'] as String?,
        payementId: json['payementId'] as int?,
        customerId: json['customerId'] as int?,
        repId: json['repId'] as int?,
        productId: json['productId'] as String?,
        priceId: json['priceId'] as int?,
        descount: json['descount'] as int?,
        quantity: json['quantity'] as int?,
        availableQuantity: json['availableQuantity'] as int?,
        totalStock: json['totalStock'] as int?,
        subTotalPreDiscont: json['subTotalPreDiscont'] as int?,
        subTotal: json['subTotal'] as int?,
        actualSubTotal: json['actualSubTotal'] as int?,
        invTotal: json['invTotal'] as int?,
        empId: json['empId'] as int?,
        rowId: json['rowId'] as int?,
        permissionId: json['permissionId'] as String?,
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'invId': invId,
        'invDate': invDate,
        'payementId': payementId,
        'customerId': customerId,
        'repId': repId,
        'productId': productId,
        'priceId': priceId,
        'descount': descount,
        'quantity': quantity,
        'availableQuantity': availableQuantity,
        'totalStock': totalStock,
        'subTotalPreDiscont': subTotalPreDiscont,
        'subTotal': subTotal,
        'actualSubTotal': actualSubTotal,
        'invTotal': invTotal,
        'empId': empId,
        'rowId': rowId,
        'permissionId': permissionId,
        'message': message,
      };

  @override
  List<Object?> get props {
    return [
      invId,
      invDate,
      payementId,
      customerId,
      repId,
      productId,
      priceId,
      descount,
      quantity,
      availableQuantity,
      totalStock,
      subTotalPreDiscont,
      subTotal,
      actualSubTotal,
      invTotal,
      empId,
      rowId,
      permissionId,
      message,
    ];
  }
}
