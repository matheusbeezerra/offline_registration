class Item {
  final String id;
  final String name;
  final String description;

  Item({required this.id, required this.name, required this.description});

  factory Item.fromFirestore(Map<String, dynamic> data, String id) {
    return Item(
      id: id,
      name: data['name'],
      description: data['description'],
    );
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      id: map['id'],
      name: map['name'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}
