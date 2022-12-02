import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../AddingAddress/repository/addaddressapi.dart';
import '../Model/EditAddress.dart';

part 'edit_address_event.dart';
part 'edit_address_state.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  final addAddressRepository _repository;
  EditAddressBloc(this._repository) : super(EditAddressInitial()) {
   on<LoadEditAddressEvent>((event, emit) async {
      emit(AddAddressLoadingState());
      try {
        final addAddressmodel = await _repository.addAddressApi(
            event.label,
            event.line1,
            event.line2,
            event.city,
            event.State,
            event.mobile,
            event.Status,
            event.pincode);
        emit(AddAddressLoadedState(addAddressmodel));
      } catch (e) {
        emit(AddAddressErrorState(e.toString()));
      }
      // TODO: implement event handler
    });
    on<ErrorEditAddressEvent>((event, emit) => emit(EditAddressInitial()));
  }
}
