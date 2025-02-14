import 'package:edaraappfinal/core/utils/database/cache/cache_helper.dart';

class EndPoints {
  static String baseUrl = 'https://testedara.runasp.net/';
  static String login = 'api/Account/LogIn';
  static String getallareas = 'api/Area/GetAllAreas';
  static String getactivecategories = '/api/Category/GetActiveCategories';
  static String getAllCustomers(selectedareaid) {
    return 'api/Customer/GetActivCustomersByAreaId?areaid=$selectedareaid';
  }

  static String getPermissionId(repid) {
    return 'api/Store/GetOpendRepPerMission?repid=$repid';
  }

  static String getProductData(categotyid) {
    return 'api/Product/GetProductsDataByCategoryWithoutEmptyStock?categoryid=$categotyid';
  }
}

class ApiKey {
  static String userName = "userName";
  static String password = "password";
  static String token = "Authorization";
  static String repid = "repid";
  static String permissionId = "permissionId";
}
