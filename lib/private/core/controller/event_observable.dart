
part of 'event_observer.dart';

enum EventsObservables {
  refetchData
}

abstract class EventObservable {
  void refetchData();
}