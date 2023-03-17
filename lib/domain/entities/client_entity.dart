class ClientEntity {
  final State state;
  final City city;

  ClientEntity({
    required this.state,
    required this.city,
  });
}

class State {
  final int id;
  final String name;
  final String uf;

  State({required this.id, required this.name, required this.uf});
}

class City {
  final String name;

  City({required this.name});
}
