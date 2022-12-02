part of 'edit_address_bloc.dart';

abstract class EditAddressState extends Equatable {
  const EditAddressState();
  
  @override
  List<Object> get props => [];
}

class EditAddressInitial extends EditAddressState {}
class AddAddressLoadingState extends EditAddressState {
  @override
  List<Object> get props => [];
}
class AddAddressLoadedState extends EditAddressState {
final EditAddress editAddress;
 AddAddressLoadedState(this.editAddress);
  @override
  List<Object> get props => [];
}

class AddAddressErrorState extends EditAddressState {
final String error;
  AddAddressErrorState(this.error);
  
  @override
  List<Object> get props => [];
}
