class FutureBuilderModel{
  int userId;
  int id;
  String title;
  String body;

  FutureBuilderModel({
    this.userId,
    this.id,
    this.title,
    this.body
  });
  
  factory FutureBuilderModel.fromJson(Map<String, dynamic> json) => new FutureBuilderModel(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
}