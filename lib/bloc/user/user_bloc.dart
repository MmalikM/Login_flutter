import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tech_test_zicare/model/profile.dart';
import 'package:tech_test_zicare/repositories/getUser.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    final GetUser _user = GetUser();

    on<GetUserList>((event, emit) async {
      try {
        emit (UserLoading());
        final detailUser = await _user.fetchUser();
        emit(UserLoaded(detailUser));
      } catch (error){
        print(error);
      }
    });
  }
}
