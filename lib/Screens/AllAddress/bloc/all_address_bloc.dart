import 'package:bloc/bloc.dart';
import 'package:arawinzhilo/Screens/AllAddress/Model/allAddressModel.dart';
import 'package:arawinzhilo/Screens/AllAddress/Repository/alladdressesapi.dart';
import 'package:meta/meta.dart';

import 'package:equatable/equatable.dart';

part 'all_address_event.dart';
part 'all_address_state.dart';

class AllAddressBloc extends Bloc<AllAddressEvent, AllAddressState> {
  final UserRepository _userRepository;
  AllAddressBloc(this._userRepository) : super(AllAddressLoadingState()) {
    on<LoadAllAddressEvent>((event, emit) async{
      // TODO: implement event handler
      emit(AllAddressLoadingState());
     try {
      final addresses = await _userRepository.getalladdress();
      emit(AllAddressLoadedState(addresses));
       
     } catch (e) {
      emit(AllAddressErrorState(e.toString()));
       
     }
      
    });
  }
}
