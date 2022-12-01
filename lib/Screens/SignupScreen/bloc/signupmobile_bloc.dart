
import 'package:arawinzhilo/Screens/SignupScreen/Repository/mobileRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../Model/MobileOtpmodel.dart';
part 'signupmobile_event.dart';
part 'signupmobile_state.dart';

class SignupmobileBloc extends Bloc<SignupmobileEvent, SignupmobileState> {
  final mobileRepository _repository;
  SignupmobileBloc(this._repository) : super(SignupmobileInitial()) {
    on<LoadSignupmobileEvent>((event, emit) async {
      emit(OtpLoadingState());
      try {
        final MobileOtpmode = await _repository.getotp(event.mobile);
        emit(OtpLoadedState(MobileOtpmode));
      } catch (e) {
        emit(OtpErrorState(e.toString()));
      }
    });
     on<ErrorSignupmobileEvent>(((event, emit) => emit( SignupmobileInitial())));
  }
  
}
