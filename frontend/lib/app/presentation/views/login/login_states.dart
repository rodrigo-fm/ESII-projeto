// possíveis estados para a view de login
abstract class LoginState {}

class LoadingLoginState implements LoginState {}

class ErrorLoginState implements LoginState {}

class SuccessLoginState implements LoginState {}