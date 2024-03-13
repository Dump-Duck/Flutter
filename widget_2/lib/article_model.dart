class Article {
  String? title;
  String? description;
  String? url;
  String? urlToImage;

  Article({
    this.title,
    this.description,
    this.url,
    this.urlToImage,
  });

  // Define a factory method to create Article objects from JSON data
  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
    );
  }

  // Define a method to convert Article objects to JSON data
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'url': url,
      'urlToImage': urlToImage,
    };
  }
}
