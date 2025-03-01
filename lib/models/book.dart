class Book {
  final String title;
  final String author;
  final String imageUrl;
  final bool isFavourite;
  final String genre;
  final String content;

  Book({
    required this.title,
    required this.author,
    required this.imageUrl,
    this.isFavourite = false,
    required this.genre,
    required this.content,
  });

  Book copyWith({
    String? title,
    String? author,
    String? imageUrl,
    bool? isFavourite,
    String? genre,
    String? content,
  }) {
    return Book(
      title: title ?? this.title,
      author: author ?? this.author,
      imageUrl: imageUrl ?? this.imageUrl,
      isFavourite: isFavourite ?? this.isFavourite,
      genre: genre ?? this.genre,
      content: content ?? this.content,
    );
  }
}
