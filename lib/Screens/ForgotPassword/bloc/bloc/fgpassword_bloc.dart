import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/Model/otpmodel.dart';
import 'package:arawinzhilo/Screens/ForgotPassword/Model/passwordfgmodel.dart';
import '../../Repository/passwordfgapi.dart';
part 'fgpassword_event.dart';
part 'fgpassword_state.dart';
class FgpasswordBloc extends Bloc<FgpasswordEvent, FgpasswordState> {
  final fgpasswordRepository _passwordrepository;
  FgpasswordBloc(this._passwordrepository) : super(FgpasswordInitial()) {
    on<LoadFgpasswordEvent>((event, emit) async {
      emit(FgpasswordLoadingState());
      // TODO: implement event handler
      try {
        final Passwordfgmodel = await _passwordrepository.updatedpasswordstatus(
            event.otpmodel, event.password);
        emit(FgpasswordLoadedState(Passwordfgmodel));
      } catch (e) {
        emit(FgpasswordErrorState(e.toString()));
      }
      on<ErrorFgpasswordEvent>((event, emit) => emit(FgpasswordInitial()));
    });
  }
}
