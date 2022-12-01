part of 'signupmobile_bloc.dart';

abstract class SignupmobileState extends Equatable {
 
  
}
class SignupmobileInitial extends SignupmobileState {
  @override
  List<Object> get props => [];
}
class OtpLoadingState extends SignupmobileState {

  
  @override
  List<Object> get props => [];
}
class OtpLoadedState extends SignupmobileState {
 final MobileOtpmodel mobileOtpmodel;
 OtpLoadedState(this.mobileOtpmodel);

  
  @override
  List<Object> get props => [];
}

class OtpErrorState extends SignupmobileState {
final String error;
  OtpErrorState(this.error);
  
  @override
  List<Object> get props => [];
}
