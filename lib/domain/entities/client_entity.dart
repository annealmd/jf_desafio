class ClientEntity {
  final StateEntity state;
  final CityEntity city;

  ClientEntity({
    required this.state,
    required this.city,
  });
}

class StateEntity {
  final int id;
  final String name;
  final String uf;

  StateEntity({required this.id, required this.name, required this.uf});
}

class CityEntity {
  final String name;

  CityEntity({required this.name});
}
