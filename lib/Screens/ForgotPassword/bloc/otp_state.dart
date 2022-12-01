part of 'otp_bloc.dart';

abstract class OtpState extends Equatable {
  
}
class OtpIntialState extends OtpState {

  
  @override
  List<Object> get props => [];
}
class OtpLoadingState extends OtpState {

  
  @override
  List<Object> get props => [];
}
class OtpLoadedState extends OtpState {
  OtpLoadedState(this.otpmodel);
  final Otpmodel otpmodel;

  
  @override
  List<Object> get props => [];
}

class OtpErrorState extends OtpState {
final String error;
  OtpErrorState(this.error);
  
  @override
  List<Object> get props => [];
}
