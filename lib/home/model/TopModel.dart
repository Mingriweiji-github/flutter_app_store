import 'package:flutter_appstore/home/model/homeModel.dart';

class TopModel {
  late TopFeed feed;

  TopModel({required this.feed});

  TopModel.fromJson(Map<String, dynamic> json) {
    feed = (json['feed'] != null ? TopFeed.fromJson(json['feed']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feed'] = this.feed.toJson();
    return data;
  }
}

class TopFeed {
  String? title;
  String? id;
  Author? author;
  List<Link?>? link;
  String? copyright;
  String? country;
  String? icon;
  String? updated;
  List<Detail>? results;

  TopFeed(
      {this.title,
      this.id,
      this.author,
      this.link,
      this.copyright,
      this.icon,
      this.country,
      this.updated,
      this.results});

  TopFeed.fromJson(Map<String, dynamic> json) {
    title = json['title'] != null ? json['title'] : null;
    id = json['id'] != null ? json['id'] : null;
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['link'] != null) {
      link = [];
      json['link'].forEach((v) {
        link?.add(new Link.fromJson(v));
      });
    }
    copyright = json['copyright'] != null ? json['copyright'] : null;
    country = json['country'] != null ? json['country'] : null;
    icon = json['icon'] != null ? json['icon'] : null;
    updated = json['updated'] != null ? json['updated'] : null;

    if (json['results'] != null) {
      results = [];
      json['results'].forEach((v) {
        results?.add(new Detail.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.title != null) {
      data['title'] = this.title.toString();
    }
    if (this.id != null) {
      data['id'] = this.id?.toString();
    }
    if (this.author != null) {
      data['author'] = this.author?.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link?.map((v) => v?.toJson()).toList();
    }
    if (this.copyright != null) {
      data['copyright'] = this.copyright.toString();
    }
    if (this.icon != null) {
      data['icon'] = this.icon?.toString();
    }
    if (this.updated != null) {
      data['updated'] = this.updated?.toString();
    }
    if (this.results != null) {
      data['results'] = this.results?.map((e) => e.toJson()).toList();
    }

    return data;
  }
}

class Detail {
  String? artistName;
  String? id;
  String? name;
  String? releaseDate;
  String? kind;
  String? artworkUrl100;
  List<dynamic>? genres;
  String? url;

  Detail.fromJson(Map<String, dynamic> json) {
    artistName = json['artistName'] != null ? json['artistName'] : null;
    id = json['id'] != null ? json['id'] : null;
    name = json['name'] != null ? json['name'] : null;
    releaseDate = json['releaseDate'] != null ? json['releaseDate'] : null;
    kind = json['kind'] != null ? json['kind'] : null;
    artworkUrl100 =
        json['artworkUrl100'] != null ? json['artworkUrl100'] : null;
    if (json['genres'] != null) {
      genres = [];
      if (json['genres'].length > 0) {
        print('genres>>>>>');
        // json['genres'].forEach((v) {
        //   genres?.add(new Detail.fromJson(v));
        // });
      }
    }
    url = json['url'] != null ? json['url'] : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.artistName != null) {
      data['artistName'] = this.artistName.toString();
    }
    if (this.id != null) {
      data['id'] = this.id?.toString();
    }
    if (this.name != null) {
      data['name'] = this.name;
    }
    if (this.releaseDate != null) {
      data['releaseDate'] = this.releaseDate;
    }
    if (this.kind != null) {
      data['kind'] = this.kind.toString();
    }
    if (this.artworkUrl100 != null) {
      data['artworkUrl100'] = this.artworkUrl100?.toString();
    }
    // if (this.genres != null) {
    //   data['genres'] = this.genres?.map((e) => e?.toJ)
    // }

    return data;
  }
}
