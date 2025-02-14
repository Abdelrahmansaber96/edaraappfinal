import 'package:equatable/equatable.dart';

class ProductDataModel extends Equatable {
  final String? productCode;
  final String? productName;
  final String? categoryName;
  final String? productUnit;
  final double? productStock;
  final String? productImage;
  final int? priceId;
  final double? productPrice;
  final double? productBuyingPrice;
  final double? productQuty;
  final double? productProfit;
  final dynamic isPriceAdded;

  const ProductDataModel({
    this.productCode,
    this.productName,
    this.categoryName,
    this.productUnit,
    this.productStock,
    this.productImage,
    this.priceId,
    this.productPrice,
    this.productBuyingPrice,
    this.productQuty,
    this.productProfit,
    this.isPriceAdded,
  });

  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      productCode: json['productCode'] as String?,
      productName: json['productName'] as String?,
      categoryName: json['categoryName'] as String?,
      productUnit: json['productUnit'] as String?,
      productStock: json['productStock'] as double?,
      productImage: json['productImage'] as String?,
      priceId: json['priceId'] as int?,
      productPrice: json['productPrice'] as double?,
      productBuyingPrice: json['productBuyingPrice'] as double?,
      productQuty: json['productQuty'] as double?,
      productProfit: json['productProfit'] as double?,
      isPriceAdded: json['isPriceAdded'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'productCode': productCode,
        'productName': productName,
        'categoryName': categoryName,
        'productUnit': productUnit,
        'productStock': productStock,
        'productImage': productImage,
        'priceId': priceId,
        'productPrice': productPrice,
        'productBuyingPrice': productBuyingPrice,
        'productQuty': productQuty,
        'productProfit': productProfit,
        'isPriceAdded': isPriceAdded,
      };

  @override
  List<Object?> get props {
    return [
      productCode,
      productName,
      categoryName,
      productUnit,
      productStock,
      productImage,
      priceId,
      productPrice,
      productBuyingPrice,
      productQuty,
      productProfit,
      isPriceAdded,
    ];
  }
}
