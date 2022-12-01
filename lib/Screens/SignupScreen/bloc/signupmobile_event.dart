part of 'signupmobile_bloc.dart';

abstract class SignupmobileEvent extends Equatable {
  
}
class LoadSignupmobileEvent extends SignupmobileEvent{
final String mobile;
LoadSignupmobileEvent(this.mobile);

@override
  List<Object> get props => [];
}
class ErrorSignupmobileEvent extends SignupmobileEvent{
@override
  List<Object> get props => [];
}