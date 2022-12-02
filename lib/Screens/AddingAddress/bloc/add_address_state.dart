part of 'add_address_bloc.dart';

abstract class AddAddressState extends Equatable {
  const AddAddressState();
}
class AddAddressInitial extends AddAddressState {
   @override
  List<Object> get props => [];
}
class AddAddressLoadingState extends AddAddressState {
  @override
  List<Object> get props => [];
}
class AddAddressLoadedState extends AddAddressState {
 final AddAddressmodel addAddressmodel;
 AddAddressLoadedState(this.addAddressmodel);
  @override
  List<Object> get props => [];
}

class AddAddressErrorState extends AddAddressState {
final String error;
  AddAddressErrorState(this.error);
  
  @override
  List<Object> get props => [];
}
