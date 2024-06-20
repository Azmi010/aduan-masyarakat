class Aduan {
  final int id;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String createdAt;
  final int like;
  final bool liked;
  final String username;

  Aduan({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.gambar,
    required this.createdAt,
    required this.like,
    required this.liked,
    required this.username,
  });

  factory Aduan.fromJson(Map<String, dynamic> json) {
    return Aduan(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      createdAt: json['created_at'],
      like: json['like'],
      liked: json['liked'] ?? false,
      username: json['user']['username'],
    );
  }
}
