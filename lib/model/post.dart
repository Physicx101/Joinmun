class PostData {
  List<Post> posts;

  PostData({this.posts});

  factory PostData.fromJson(List<dynamic> json) {
    List<Post> posts = new List<Post>();
    posts = json.map((i) => Post.fromJson(i)).toList();
    return new PostData(posts: posts);
  }

}

class Post {
  int id;
  String message;
  int userId;
  String createdAt;
  String updatedAt;
  String judul;
  String footer;
  FilePath filePath;

  Post(
      {this.id,
      this.message,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.judul,
      this.footer,
      this.filePath});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      message: json['message'],
      userId: json['user_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      judul: json['judul'],
      footer: json['footer'],
      filePath: json['file_path'] != null
          ? new FilePath.fromJson(json['file_path'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['message'] = this.message;
    data['user_id'] = this.userId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['judul'] = this.judul;
    data['footer'] = this.footer;
    if (this.filePath != null) {
      data['file_path'] = this.filePath.toJson();
    }
    return data;
  }
}

class FilePath {
  String url;

  FilePath({this.url});

  factory FilePath.fromJson(Map<String, dynamic> json) {
    return FilePath(url: json['url']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
