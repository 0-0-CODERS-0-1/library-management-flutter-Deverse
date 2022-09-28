class BookModel {
  String name, image, author, price;

  BookModel(this.name, this.image, this.author, this.price);
}

List bookList = <BookModel>[
  BookModel(
      "The Millennial Mind", "assets/book2.jpeg", "Daniel M. Francis", "ISSUE"),
  BookModel(
      "The Glass Hotel", "assets/book3.jpeg", "Emily St. John Mandel", "ISSUE"),
  BookModel(
      "The Willpower Instinct", "assets/book4.jpeg", "Kelly McGonigal", "ISSUE"),
  BookModel(
      "Awaken the Giant Within", "assets/book5.jpeg", "Tony Robbins", "ISSUE"),
];
