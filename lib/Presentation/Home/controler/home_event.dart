import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable{
  const HomeEvent();

  @override
  List<Object> get props =>[];
}
class GetAllSectionsEvent extends HomeEvent {}
class GetParticipantDomainEvent extends HomeEvent {
  final int id;

  const GetParticipantDomainEvent({required this.id});

  @override
  List<Object> get props =>[id];
}