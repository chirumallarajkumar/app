part of 'fgpassword_bloc.dart';

abstract class FgpasswordEvent extends Equatable {
  const FgpasswordEvent();

}
class LoadFgpasswordEvent extends FgpasswordEvent{
final String password;
Otpmodel otpmodel;
LoadFgpasswordEvent(this.password,this.otpmodel);

@override
  List<Object> get props => [];
}
class ErrorFgpasswordEvent extends FgpasswordEvent{
@override
  List<Object> get props => [];
}