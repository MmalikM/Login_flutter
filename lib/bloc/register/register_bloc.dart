import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tech_test_zicare/bloc/auth_bloc/auth_bloc.dart';
import 'package:tech_test_zicare/repositories/repositories.dart';

part 'register_event.dart';
part 'register_state.dart';

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
        authenticationBloc.add(LoggedIn(token: token));
        emit(RegisterInitial());
      } catch (error) {
        emit(RegisterFailure(error: error.toString()));
      }
    });
  }
}
