part of 'otp_bloc.dart';

abstract class OtpEvent extends Equatable {
  const OtpEvent();

  
}
class LoadOtpEvent extends OtpEvent{
final String mobile;
LoadOtpEvent(this.mobile);

@override
  List<Object> get props => [];
}
class ErrorOtpEvent extends OtpEvent{
@override
  List<Object> get props => [];
}