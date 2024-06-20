class RejectLaporanModel {
  final int id;
  final String judul;
  final String deskripsi;
  final String gambar;
  final String createdAt;
  final int like;
  final String status;
  final String username;

  RejectLaporanModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.gambar,
    required this.createdAt,
    required this.like,
    required this.status,
    required this.username,
  });

  factory RejectLaporanModel.fromJson(Map<String, dynamic> json) {
    return RejectLaporanModel(
      id: json['id'],
      judul: json['judul'],
      deskripsi: json['deskripsi'],
      gambar: json['gambar'],
      createdAt: json['created_at'],
      like: json['like'],
      status: json['status'],
      username: json['user']['username'],
    );
  }
}
