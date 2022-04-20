class TopGrossingApp {
  late Feed feed;

  TopGrossingApp({required this.feed});

  TopGrossingApp.fromJson(Map<String, dynamic> json) {
    feed = (json['feed'] != null ? Feed.fromJson(json['feed']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['feed'] = this.feed.toJson();
    return data;
  }
}

class Feed {
  Author? author;
  List<Entry?>? entry;
  Name? updated;
  Name? rights;
  Name? title;
  Name? icon;
  List<Link?>? link;
  Name? id;

  Feed(
      {this.author,
      this.entry,
      this.updated,
      this.rights,
      this.title,
      this.icon,
      this.link,
      this.id});

  Feed.fromJson(Map<String, dynamic> json) {
    author =
        json['author'] != null ? new Author.fromJson(json['author']) : null;
    if (json['entry'] != null) {
      entry = [];
      json['entry'].forEach((v) {
        entry?.add(new Entry.fromJson(v));
      });
    }
    updated =
        json['updated'] != null ? new Name.fromJson(json['updated']) : null;
    rights = json['rights'] != null ? new Name.fromJson(json['rights']) : null;
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    icon = json['icon'] != null ? new Name.fromJson(json['icon']) : null;
    if (json['link'] != null) {
      link = [];
      json['link'].forEach((v) {
        link?.add(new Link.fromJson(v));
      });
    }
    id = json['id'] != null ? new Name.fromJson(json['id']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.author != null) {
      data['author'] = this.author!.toJson();
    }
    if (this.entry != null) {
      data['entry'] = this.entry?.map((v) => v?.toJson()).toList();
    }
    if (this.updated != null) {
      data['updated'] = this.updated?.toJson();
    }
    if (this.rights != null) {
      data['rights'] = this.rights?.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title?.toJson();
    }
    if (this.icon != null) {
      data['icon'] = this.icon?.toJson();
    }
    if (this.link != null) {
      data['link'] = this.link?.map((v) => v?.toJson()).toList();
    }
    if (this.id != null) {
      data['id'] = this.id?.toJson();
    }
    return data;
  }
}

class Author {
  // Name? name;
  // Name? uri;
  // String? name;
  // String? uri;
  dynamic name;
  dynamic uri;

  Author({this.name, this.uri});

  Author.fromJson(Map<String, dynamic> json) {
    // name = json['name'] != null ? Name.fromJson(json['name']) : null;
    // uri = json['uri'] != null ? Name.fromJson(json['uri']) : null;
    // name = json['name'] != null ? json['name'] : null;
    // uri = json['uri'] != null ? json['uri'] : null;
    if (json['name'] is String) {
      name = json['name'] != null ? json['name'] : null;
    } else if (json['name'] is Map) {
      name = json['name'] != null ? Name.fromJson(json['name']) : null;
    }

    if (json['uri'] is String) {
      uri = json['uri'] != null ? json['uri'] : null;
    } else if (json['uri'] is Map) {
      uri = json['uri'] != null ? Name.fromJson(json['uri']) : null;
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name ?? '';
    }
    if (this.uri != null) {
      data['uri'] = this.uri ?? '';
    }
    return data;
  }
}

class Name {
  String? label;

  Name({this.label});

  Name.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Attributes {
  String? id;
  String? bundleId;
  Attributes({this.id, this.bundleId});
  Attributes.fromJson(Map<String, dynamic> json) {
    id = json['im:id'];
    bundleId = json['im:bundleId'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['im:id'] = this.id.toString();
    data['im:bundleId'] = this.bundleId.toString();
    return data;
  }
}

class IDName {
  String? label;
  Attributes? attributes;
  IDName({this.label});

  IDName.fromJson(Map<String, dynamic> json) {
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    return data;
  }
}

class Entry {
  Name? imName;
  List<ImImage?>? imImage;
  Name? summary;
  ImImage? imPrice;
  ImContentType? imContentType;
  Name? rights;
  Name? title;
  // List<Link?>? link;
  // Link? link;
  dynamic link;
  IDName? id;
  ImImage? imArtist;
  ImContentType? category;
  ImImage? imReleaseDate;

  Entry(
      {this.imName,
      this.imImage,
      this.summary,
      this.imPrice,
      this.imContentType,
      this.rights,
      this.title,
      this.link,
      this.id,
      this.imArtist,
      this.category,
      this.imReleaseDate});

  Entry.fromJson(Map<String, dynamic> json) {
    imName =
        json['im:name'] != null ? new Name.fromJson(json['im:name']) : null;
    if (json['im:image'] != null) {
      imImage = [];
      json['im:image'].forEach((v) {
        imImage?.add(new ImImage.fromJson(v));
      });
    }
    summary =
        json['summary'] != null ? new Name.fromJson(json['summary']) : null;
    imPrice = json['im:price'] != null
        ? new ImImage.fromJson(json['im:price'])
        : null;
    imContentType = json['im:contentType'] != null
        ? new ImContentType.fromJson(json['im:contentType'])
        : null;
    rights = json['rights'] != null ? new Name.fromJson(json['rights']) : null;
    title = json['title'] != null ? new Name.fromJson(json['title']) : null;
    if (json['link'] != null) {
      // 注意这里类型有 Map 和 List
      if (json['link'] is Map) {
        link = json['link'] != null ? new Link.fromJson(json['link']) : null;
      } else {
        link = [];
        json['link'].forEach((v) {
          link?.add(new Link.fromJson(v));
        });
      }
    }
    id = json['id'] != null ? new IDName.fromJson(json['id']) : null;
    imArtist = json['im:artist'] != null
        ? new ImImage.fromJson(json['im:artist'])
        : null;
    category = json['category'] != null
        ? new ImContentType.fromJson(json['category'])
        : null;
    imReleaseDate = json['im:releaseDate'] != null
        ? new ImImage.fromJson(json['im:releaseDate'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.imName != null) {
      data['im:name'] = this.imName?.toJson();
    }
    if (this.imImage != null) {
      data['im:image'] = this.imImage?.map((v) => v?.toJson()).toList();
    }
    if (this.summary != null) {
      data['summary'] = this.summary?.toJson();
    }
    if (this.imPrice != null) {
      data['im:price'] = this.imPrice?.toJson();
    }
    if (this.imContentType != null) {
      data['im:contentType'] = this.imContentType?.toJson();
    }
    if (this.rights != null) {
      data['rights'] = this.rights?.toJson();
    }
    if (this.title != null) {
      data['title'] = this.title?.toJson();
    }
    if (this.link != null) {
      if (data['link'] is Map) {
        data['link'] = this.link?.toJson();
      } else {
        data['link'] = this.link?.map((v) => v?.toJson()).toList();
      }
    }
    if (this.id != null) {
      data['id'] = this.id?.toJson();
    }
    if (this.imArtist != null) {
      data['im:artist'] = this.imArtist?.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category?.toJson();
    }
    if (this.imReleaseDate != null) {
      data['im:releaseDate'] = this.imReleaseDate?.toJson();
    }
    return data;
  }
}

class ImImage {
  String? label;
  Name? attributes;

  ImImage({this.label, this.attributes});

  ImImage.fromJson(Map<String, dynamic> json) {
    label = json['label'];
    attributes = json['attributes'] != null
        ? new Name.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['label'] = this.label;
    if (this.attributes != null) {
      data['attributes'] = this.attributes?.toJson();
    }
    return data;
  }
}

class AttributesHeight {
  String? height;

  AttributesHeight({this.height});

  AttributesHeight.fromJson(Map<String, dynamic> json) {
    height = json['height'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['height'] = this.height;
    return data;
  }
}

class AttributesAmount {
  String? amount;
  String? currency;

  AttributesAmount({this.amount, this.currency});

  AttributesAmount.fromJson(Map<String, dynamic> json) {
    amount = json['amount'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['amount'] = this.amount;
    data['currency'] = this.currency;
    return data;
  }
}

class ImContentType {
  Name? attributes;

  ImContentType({this.attributes});

  ImContentType.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new Name.fromJson(json['attributes'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes?.toJson();
    }
    return data;
  }
}

class AttributesTerm {
  String? term;
  String? label;

  AttributesTerm({this.term, this.label});

  AttributesTerm.fromJson(Map<String, dynamic> json) {
    term = json['term'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['term'] = this.term;
    data['label'] = this.label;
    return data;
  }
}

class Link {
  Name? attributes;
  Name? imDuration;

  Link({this.attributes, this.imDuration});

  Link.fromJson(Map<String, dynamic> json) {
    attributes = json['attributes'] != null
        ? new Name.fromJson(json['attributes'])
        : null;
    imDuration = json['im:duration'] != null
        ? new Name.fromJson(json['im:duration'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.attributes != null) {
      data['attributes'] = this.attributes?.toJson();
    }
    if (this.imDuration != null) {
      data['im:duration'] = this.imDuration?.toJson();
    }
    return data;
  }
}

class AttributesRel {
  String? rel;
  String? type;
  String? href;
  String? title;
  String? imAssetType;

  AttributesRel({this.rel, this.type, this.href, this.title, this.imAssetType});

  AttributesRel.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
    title = json['title'];
    imAssetType = json['im:assetType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['type'] = this.type;
    data['href'] = this.href;
    data['title'] = this.title;
    data['im:assetType'] = this.imAssetType;
    return data;
  }
}

class AttributesImId {
  String? imId;
  String? imBundleId;

  AttributesImId({this.imId, this.imBundleId});

  AttributesImId.fromJson(Map<String, dynamic> json) {
    imId = json['im:id'];
    imBundleId = json['im:bundleId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['im:id'] = this.imId;
    data['im:bundleId'] = this.imBundleId;
    return data;
  }
}

class AttributesHref {
  String? href;

  AttributesHref({this.href});

  AttributesHref.fromJson(Map<String, dynamic> json) {
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    return data;
  }
}

class AttributesIterm {
  String? imId;
  String? term;
  String? scheme;
  String? label;

  AttributesIterm({this.imId, this.term, this.scheme, this.label});

  AttributesIterm.fromJson(Map<String, dynamic> json) {
    imId = json['im:id'];
    term = json['term'];
    scheme = json['scheme'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['im:id'] = this.imId;
    data['term'] = this.term;
    data['scheme'] = this.scheme;
    data['label'] = this.label;
    return data;
  }
}

class AttributesType {
  String? rel;
  String? type;
  String? href;

  AttributesType({this.rel, this.type, this.href});

  AttributesType.fromJson(Map<String, dynamic> json) {
    rel = json['rel'];
    type = json['type'];
    href = json['href'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['rel'] = this.rel;
    data['type'] = this.type;
    data['href'] = this.href;
    return data;
  }
}
