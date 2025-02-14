part of 'login_cubit.dart';

sealed class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

final class LoginInitial extends LoginState {}

final class LoginSuccess extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginFailure extends LoginState {
  final String errMessage;

  const LoginFailure({required this.errMessage});
}

final class PermissionInitial extends LoginState {}

final class PermissionSuccess extends LoginState {}

final class PermissionLoading extends LoginState {}

final class PermissionFailure extends LoginState {
  final dynamic errMessage;

  const PermissionFailure({required this.errMessage});
}
