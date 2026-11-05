class Partner {
  final String name;

  /// Имя файла логотипа в папке `assets/images/<тема>/`.
  final String logoFile;
  final String websiteUrl;
  final String description;

  const Partner({
    required this.name,
    required this.logoFile,
    required this.websiteUrl,
    required this.description,
  });
}
