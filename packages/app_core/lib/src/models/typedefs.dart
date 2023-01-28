part of 'models.dart';

typedef BoolCallback = ValueGetter<bool>;
typedef FutureBoolCallback = Future<bool> Function();
typedef FutureVoidCallback = AsyncCallback;
typedef TwoValuesChanged<TFirst, TSecond> = void Function(TFirst, TSecond);
typedef FromJsonCallback<T> = T Function(Map<String, dynamic> json);
typedef CheckFunction<T> = bool Function(T);
