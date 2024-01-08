class FaqModel {
  String? answer;
  String? created_at;
  num? id;
  String? question;
  num? ranking;
  num? status;
  String? updated_at;

  FaqModel(
      {this.answer,
      this.created_at,
      this.id,
      this.question,
      this.ranking,
      this.status,
      this.updated_at});

  factory FaqModel.fromJson(Map<String, dynamic> json) {
    return FaqModel(
      id: json['id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      status: json['status'],
      answer: json['answer'],
      question: json['question'],
      ranking: json['ranking'],
    );
  }
}
