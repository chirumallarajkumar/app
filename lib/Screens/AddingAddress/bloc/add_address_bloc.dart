import 'package:arawinzhilo/Screens/AddingAddress/Model/AddAddressModel.dart';
import 'package:arawinzhilo/Screens/AddingAddress/repository/addaddressapi.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'add_address_event.dart';
part 'add_address_state.dart';

class AddAddressBloc extends Bloc<AddAddressEvent, AddAddressState> {
  final addAddressRepository _repository;
  AddAddressBloc(this._repository) : super(AddAddressInitial()) {
    on<LoadAddAddressEvent>((event, emit) async {
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
    on<ErrorAddAddressEvent>((event, emit) => emit(AddAddressInitial()));
  }
}
