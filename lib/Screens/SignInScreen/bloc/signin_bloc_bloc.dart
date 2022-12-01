import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:arawinzhilo/Screens/AllAddress/Model/allAddressModel.dart';
import 'package:arawinzhilo/Screens/SignInScreen/Model/signinmodel.dart';
import 'package:arawinzhilo/Screens/SignInScreen/Model/signinmodel.dart';
import 'package:arawinzhilo/Screens/SignInScreen/Repository/signinvalidation.dart';

part 'signin_bloc_event.dart';
part 'signin_bloc_state.dart';

class SigninBlocBloc extends Bloc<SigninBlocEvent, SigninBlocState> {
  final signinRepository _signinrepository;
  SigninBlocBloc(this._signinrepository) : super(SigninBlocIntialState()) {
    on<LoadSigninBlocEvent>((event, emit) async {
      print("1");
      emit(SigninBlocLoadingState());
      try {
       final Signinmodel = await _signinrepository.signinValidation(event.mobile, event.password);
        emit(SigninBlocLoadedState(Signinmodel));
      } catch (e) {
        emit(SigninBlocErrorState(e.toString()));
      }
    });
  }
}
