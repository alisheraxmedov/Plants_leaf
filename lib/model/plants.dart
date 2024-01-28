class LeafsModel {
  final String kasallikNomi;
  final String ehtimollik;
  final String maslahat;
  final String youTubeLink;

  LeafsModel({
    required this.kasallikNomi,
    required this.ehtimollik,
    required this.maslahat,
    required this.youTubeLink,
  });

  factory LeafsModel.fromJson(Map<String, dynamic> json) {
    return LeafsModel(
      kasallikNomi: json['kasallik_nomi'],
      ehtimollik: json['ehtimollik'],
      maslahat: json['maslahat'],
      youTubeLink: json['urll'],
    );
  }
}
