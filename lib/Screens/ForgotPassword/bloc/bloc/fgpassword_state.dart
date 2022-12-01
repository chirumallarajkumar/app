part of 'fgpassword_bloc.dart';

abstract class FgpasswordState extends Equatable {
  const FgpasswordState();
  
  @override
  List<Object> get props => [];
}

class FgpasswordInitial extends FgpasswordState {}


class FgpasswordLoadingState extends FgpasswordState {

  
  @override
  List<Object> get props => [];
}
class FgpasswordLoadedState extends FgpasswordState {
  FgpasswordLoadedState(this.fgpasswordmodel);
 Passwordfgmodel fgpasswordmodel;

  
  @override
  List<Object> get props => [];
}

class FgpasswordErrorState extends FgpasswordState {
final String error;
  FgpasswordErrorState(this.error);
  
  @override
  List<Object> get props => [];
}
