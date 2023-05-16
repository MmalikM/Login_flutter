
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:tech_test_zicare/repositories/repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent,AuthenticationState>{
  final UserRepository userRepository;
  AuthenticationBloc({required this.userRepository}) : super(AuthenticationUnauthenticated()){
    on<AppStarted>((event, emit) async{
      final bool hasToken = await userRepository.hasToken();
      if (hasToken) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });

    on<LoggedIn>((event, emit) async{
      emit(AuthenticationLoading());
      await userRepository.addToken(event.token);
      emit(AuthenticationAuthenticated());
      
    });

    on<LoggedOut>((event, emit) async{
      emit(AuthenticationLoading());
      await userRepository.deleteToken();
      emit(AuthenticationUnauthenticated());
    });
  }
}





