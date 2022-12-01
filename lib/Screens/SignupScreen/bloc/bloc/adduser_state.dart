part of 'adduser_bloc.dart';

abstract class AdduserState extends Equatable {
  const AdduserState();
  
 
}

class AdduserInitial extends AdduserState {

   @override
  List<Object> get props => [];
}

class AdduserLoadingState extends AdduserState {

  
  @override
  List<Object> get props => [];
}
class AdduserLoadedState extends AdduserState {
 final Addusermodel addusermodel;
 AdduserLoadedState(this.addusermodel);  
  @override
  List<Object> get props => [];
}

class AdduserErrorState extends AdduserState {
final String error;
  AdduserErrorState(this.error);
  
  @override
  List<Object> get props => [];
}

