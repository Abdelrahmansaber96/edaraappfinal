import 'package:edaraappfinal/core/router/appRouter.dart';
import 'package:edaraappfinal/core/utils/assets.dart';
import 'package:edaraappfinal/features/sign_in/presentation/maneger/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  // final _formKey = GlobalKey<FormState>();

  const SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('success'),
            ),
          );
          GoRouter.of(context).push(AppRouter.kHomeView);
        } else if (state is LoginFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      SizedBox(height: constraints.maxHeight * 0.1),
                      Image.asset(
                        AssetsData.logo,
                        width: 300,
                      ),
                      SizedBox(height: constraints.maxHeight * 0.1),
                      Text(
                        "تسجيل الدخول",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: constraints.maxHeight * 0.05),
                      Form(
                        key: context.read<LoginCubit>().signInFormKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller:
                                  context.read<LoginCubit>().signInUserName,
                              textAlign: TextAlign.right,
                              decoration: const InputDecoration(
                                hintText: 'اسم المستخدم',
                                filled: true,
                                fillColor: Color(0xFFF5FCF9),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16.0 * 1.5, vertical: 16.0),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(50)),
                                ),
                              ),
                              keyboardType: TextInputType.name,
                              onSaved: (phone) {
                                // Save it
                              },
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 16.0),
                              child: TextFormField(
                                controller:
                                    context.read<LoginCubit>().signInPassword,
                                textAlign: TextAlign.right,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: 'كلمة المرور',
                                  filled: true,
                                  fillColor: Color(0xFFF5FCF9),
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 16.0 * 1.5, vertical: 16.0),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                ),
                                onSaved: (passaword) {
                                  // Save it
                                },
                              ),
                            ),
                            state is LoginLoading
                                ? const CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () {
                                      context.read<LoginCubit>().login();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor: const Color(0xFF1f9fda),
                                      foregroundColor: Colors.white,
                                      minimumSize:
                                          const Size(double.infinity, 48),
                                      shape: const StadiumBorder(),
                                    ),
                                    child: const Text("تسجيل الدخول"),
                                  ),
                            const SizedBox(height: 16.0),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'هل نسيت كلمة المرور?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .color!
                                          .withOpacity(0.64),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
