import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'edit_address_event.dart';
part 'edit_address_state.dart';

class EditAddressBloc extends Bloc<EditAddressEvent, EditAddressState> {
  EditAddressBloc() : super(EditAddressInitial()) {
    on<EditAddressEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
