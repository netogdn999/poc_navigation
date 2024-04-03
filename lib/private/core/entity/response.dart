class Response<E, R> {
  final E? _error;
  final R? _body;

  const Response({E? error, R? body})
   : assert(error != null || body != null),
     _error = error,
     _body = body;

  bool get isError => _error != null;

  T map<T>(T Function(R result) success, T Function(E error) failure,) {
    if(isError) {
      return failure(_error as E);
    }
    return success(_body as R);
  }

  T mapOnErrorListEmpty<T>(T Function(R result) success, dynamic Function(E error) failure,) {
    if(isError) {
      failure(_error as E);
      return const [] as T;
    }
    return success(_body as R);
  }
}

class Unit {
  const Unit._internal();
  @override String toString() => "()";
}

const Unit unit = Unit._internal();

T id<T>(T result) => result;