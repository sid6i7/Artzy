class Category {
  late String? name;

  get getName => name;

  set setName(name) => this.name = name;

  Category({
    this.name,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
