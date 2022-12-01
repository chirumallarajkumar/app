import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/Model/otpmodel.dart';
import 'package:hilo_bloc/Screens/ForgotPassword/Repository/otpapi.dart';

part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final otpRepository _otprepository;
  OtpBloc(this._otprepository) : super(OtpIntialState()) {
    on<LoadOtpEvent>((event, emit) async {
      emit(OtpLoadingState());
      // TODO: implement event handler
      try {
        final Otpmodel = await _otprepository.getotp(event.mobile);
        emit(OtpLoadedState(Otpmodel));
      } catch (e) {
        emit(OtpErrorState(e.toString()));
      }
    });
    on<ErrorOtpEvent>(((event, emit) => emit( OtpIntialState())));
  }
}
