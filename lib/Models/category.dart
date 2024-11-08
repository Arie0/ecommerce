class Category {
  final int id;
  final String name;
  final List<String> subcategories;

  Category({
    required this.id,
    required this.name,
    this.subcategories = const [], // Lista de subcategorias vazia por padrão
  });

  // Método opcional para adicionar subcategoria diretamente no modelo
  void addSubcategory(String subcategory) {
    subcategories.add(subcategory);
  }

  static fromJson(json) {}
}
