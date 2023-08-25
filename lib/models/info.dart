class MainModel {
  List<InfoModel>? users;
  int? skip;
  int? total;
  int? limit;

  MainModel.fromJson(Map<String, dynamic> json) {
    skip = json['skip'];
    total = json['total'];
    limit = json['limit'];
    users = (json['users'] as List).map((e) => InfoModel.fromJson(e)).toList();
  }
}

class InfoModel {
  int id = 0;
  String name = '';
  int age = 0;
  String surName = '';
  String username = '';
  String password = '';
  String cardNumber = '';
  String cardType = '';

  InfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    name = json['firstName'] ?? '';
    age = json['age'] ?? 0;
    surName = json['lastName'] ?? '';
    username = json['username'] ?? '';
    password = json['password'] ?? '';
    cardNumber = json['cardNumber'].toString();
    cardType = json['cardType'].toString();
  }
}
