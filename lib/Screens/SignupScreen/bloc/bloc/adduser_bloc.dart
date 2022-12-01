import 'package:arawinzhilo/Screens/SignupScreen/Model/addusermodel.dart';
import 'package:arawinzhilo/Screens/SignupScreen/Repository/registerRepository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'adduser_event.dart';
part 'adduser_state.dart';

class AdduserBloc extends Bloc<AdduserEvent, AdduserState> {
  final registerRepository _repository;
  AdduserBloc(this._repository) : super(AdduserInitial()) {
    on<LoadAdduserEvent>((event, emit) async {
      // TODO: implement event handler
      emit(AdduserLoadingState());
      try {
        final addusermodel = await _repository.useradd(event.mobile, event.email, event.pass, event.otp, event.otp_token, event.name);
        emit(AdduserLoadedState(addusermodel));
      } catch (e) {
        emit(AdduserErrorState(e.toString()));
      }
    });
    on<ErrorAdduserEvent>((event, emit) => emit(AdduserInitial()));
  }
}
