import 'package:edaraappfinal/features/home/presentation/views/home_view.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/invoice_page.dart';
import 'package:edaraappfinal/features/invoice/presentation/views/products_page.dart';
import 'package:edaraappfinal/features/sign_in/presentation/views/signin.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/home';
  static const kLoginPage = '/SignInScreen';
  static const kInvoicePage = '/invoice';
  static const kProductPage = '/products';
  static final router = GoRouter(routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: '/invoice',
      builder: (context, state) => InvoicePage(),
    ),
    // GoRoute(
    //   path: '/products',
    //   builder: (context, state) =>const ProductPage(),
    // ),
  ]);
}
