// ignore_for_file: camel_case_types

class category {
  final String title;
  final String thumbnail;
  final String desc;

  category({required this.title, required this.thumbnail, required this.desc});

  factory category.fromjson(jsonData) {
    return category(
      title: jsonData['title'] ?? 'Default Title',
      thumbnail: jsonData['thumbnail'] ?? 'Default Thumbnail',
      desc: jsonData['desc'] ?? 'Default desc',
    );
  }
}
