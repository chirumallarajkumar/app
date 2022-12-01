part of 'signin_bloc_bloc.dart';

abstract class SigninBlocState extends Equatable {
  @override
  List<Object> get props => [];
}
class SigninBlocIntialState extends SigninBlocState {
  @override
  List<Object> get props => [];
}

class SigninBlocLoadingState extends SigninBlocState {
  @override
  List<Object> get props => [];
}

//data loaded state
class SigninBlocLoadedState extends SigninBlocState {
  SigninBlocLoadedState(this.signinmodel);
  final Signinmodel signinmodel;
  @override
  List<Object> get props => [];
}

//data error loading state

class SigninBlocErrorState extends SigninBlocState {
  final String error;
  SigninBlocErrorState(this.error);
  @override
  List<Object> get props => [UserData];
}
