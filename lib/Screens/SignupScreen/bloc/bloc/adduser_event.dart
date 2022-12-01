part of 'adduser_bloc.dart';

abstract class AdduserEvent extends Equatable {
  const AdduserEvent();

}
class LoadAdduserEvent extends AdduserEvent{
 final String mobile,email, pass, otp, otp_token, name; 
 LoadAdduserEvent(this.mobile,this.email,this.name,this.otp,this.otp_token,this.pass);


  @override
  List<Object> get props => [];
}

class ErrorAdduserEvent extends AdduserEvent{
  @override
  List<Object> get props => [];
}