class RecentSearchModel {
  final int? id; // id تلقائي في قاعدة البيانات
  final String query;
  final DateTime createdAt;

  RecentSearchModel({
    this.id,
    required this.query,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'query': query,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory RecentSearchModel.fromMap(Map<String, dynamic> map) {
    return RecentSearchModel(
      id: map['id'],
      query: map['query'],
      createdAt: DateTime.parse(map['createdAt']),
    );
  }
}
