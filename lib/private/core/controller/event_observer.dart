
import 'package:flutter/material.dart';

part 'event_observable.dart';

class EventObserver {
  final Map<EventsObservables, List<EventObservable>> _observables = {};
  static EventObserver? _instance;

  EventObserver._();

  static get instance => _instance ??= EventObserver._();

  void subscribeController(EventsObservables event, EventObservable observable) {
    if (!_observables.containsKey(event)) {
      _observables[event] = [];
    }
    _observables[event]?.add(observable);
  }

  void unsubscribeController(EventsObservables event, EventObservable observable) {
    if (_observables.containsKey(event)) {
      _observables[event]?.remove(observable);
      if(_observables[event]!.isEmpty) {
        _observables.remove(event);
      }
    }
  }

  void removeSubscription(EventObservable observable) {
    _observables.forEach((key, value) {
      value.remove(observable);
    });
  }

  void sendEvent(EventsObservables event) {
    switch (event) {
      case EventsObservables.refetchData: return _observables[event]?.forEach((observable) => observable.refetchData());
    }
  }

}

extension EventObserverContext on BuildContext {
  EventObserver get eventObserver => EventObserver.instance;
}