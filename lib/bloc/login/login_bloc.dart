import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tech_test_zicare/bloc/auth_bloc/auth_bloc.dart';
import 'package:tech_test_zicare/repositories/repositories.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({required this.userRepository, required this.authenticationBloc})
      : super(LoginInitial()) {
    on<LoginButton>((event, emit) async {
      emit(LoginLoading());
      try {
        final token = await userRepository.login(event.email, event.password);
        authenticationBloc.add(LoggedIn(token: token));
        emit(LoginInitial());
      } catch (error) {
        emit(LoginFailure(error: error.toString()));
      }
    });
  }
  
}

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  RegisterBloc({required this.userRepository, required this.authenticationBloc})
      : super(RegisterInitial()) {
    on<RegisterButton>((event, emit) async {
      emit(RegisterLoading());
      try {
        final token = await userRepository.register(
        event.full_name, event.username, event.email, event.password);
        // authenticationBloc.add(LoggedIn(token: token));
        emit(RegisterInitial());
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}

 