// função que assim que for executada devolve o tipo genérico
typedef InstanceCreator<T> = T Function();
//typedef T InstanceCreator<T>();

class DependencyInjector {
  DependencyInjector._();
  static final _singleton = DependencyInjector._();
  factory DependencyInjector() => _singleton;

// guardar todas as instancias aqui.
  final _instanceMap = <Type, _InstanceGenerator<Object>>{};

  void register<T extends Object>(
    InstanceCreator<T> instance, {
    bool isSingleton = true,
  }) =>
      _instanceMap[T] = _InstanceGenerator(instance, isSingleton);

  T get<T extends Object>() {
    final instance = _instanceMap[T]?.getInstance();

    if (instance != null && instance is T) return instance;

    throw Exception('[ERROR] -> instance ${T.toString()} not found');
  }

  call<T extends Object>() => get<T>();
}

class _InstanceGenerator<T> {
  // para ? caso não consiga fabricar a instância
  T? _instance;
  bool _isFirstGet = false;
  // p criar factory ou singleton

  final InstanceCreator<T> _instanceCreator;
  // ao ser executada devolve o tipo T

  _InstanceGenerator(this._instanceCreator, bool isSingleton)
      : _isFirstGet = isSingleton;

  T? getInstance() {
    if (_isFirstGet) {
      _instance = _instanceCreator();
      _isFirstGet = false;
    }
    return (_instance != null) ? _instance : _instanceCreator();
  }
}