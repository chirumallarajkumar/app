part of 'signin_bloc_bloc.dart';

abstract class SigninBlocEvent extends Equatable {
  const SigninBlocEvent();

 
}
class LoadSigninBlocEvent extends SigninBlocEvent{
 final String mobile,password;
LoadSigninBlocEvent(this.mobile,this.password);
   @override
  List<Object?> get props => [];
}