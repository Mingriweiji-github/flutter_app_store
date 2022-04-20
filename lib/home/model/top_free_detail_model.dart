class TopFreeDetailModel {
  late int resultCount;
  late List<Results> results;

  TopFreeDetailModel({required this.resultCount, required this.results});

  TopFreeDetailModel.fromJson(Map<String, dynamic> json) {
    resultCount = json['resultCount'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results = [];
        results.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['resultCount'] = this.resultCount;
    data['results'] = this.results.map((v) => v.toJson()).toList();
    return data;
  }
}

class Results {
  List<String>? ipadScreenshotUrls;
  List<String>? appletvScreenshotUrls;
  String? artworkUrl60;
  String? artworkUrl512;
  String? artworkUrl100;
  String? artistViewUrl;
  List<String>? screenshotUrls;
  bool? isGameCenterEnabled;
  List<String>? features;
  List<String>? supportedDevices;
  List<String>? advisories;
  String? kind;
  String? trackViewUrl;
  String? minimumOsVersion;
  String? trackCensoredName;
  List<String>? languageCodesISO2A;
  String? fileSizeBytes;
  String? formattedPrice;
  double? averageUserRatingForCurrentVersion;
  int? userRatingCountForCurrentVersion;
  double? averageUserRating;
  String? trackContentRating;
  String? contentAdvisoryRating;
  String? bundleId;
  int? trackId;
  String? trackName;
  String? releaseDate;
  List<String>? genreIds;
  String? primaryGenreName;
  bool? isVppDeviceBasedLicensingEnabled;
  String? sellerName;
  String? currentVersionReleaseDate;
  String? releaseNotes;
  int? primaryGenreId;
  String? currency;
  int? artistId;
  String? artistName;
  List<String>? genres;
  num? price;
  String? description;
  String? version;
  String? wrapperType;
  int? userRatingCount;

  Results(
      {this.ipadScreenshotUrls,
      this.appletvScreenshotUrls,
      this.artworkUrl60,
      this.artworkUrl512,
      this.artworkUrl100,
      this.artistViewUrl,
      this.screenshotUrls,
      this.isGameCenterEnabled,
      this.features,
      this.supportedDevices,
      this.advisories,
      this.kind,
      this.trackViewUrl,
      this.minimumOsVersion,
      this.trackCensoredName,
      this.languageCodesISO2A,
      this.fileSizeBytes,
      this.formattedPrice,
      this.averageUserRatingForCurrentVersion,
      this.userRatingCountForCurrentVersion,
      this.averageUserRating,
      this.trackContentRating,
      this.contentAdvisoryRating,
      this.bundleId,
      this.trackId,
      this.trackName,
      this.releaseDate,
      this.genreIds,
      this.primaryGenreName,
      this.isVppDeviceBasedLicensingEnabled,
      this.sellerName,
      this.currentVersionReleaseDate,
      this.releaseNotes,
      this.primaryGenreId,
      this.currency,
      this.artistId,
      this.artistName,
      this.genres,
      this.price,
      this.description,
      this.version,
      this.wrapperType,
      this.userRatingCount});

  Results.fromJson(Map<String, dynamic> json) {
    ipadScreenshotUrls = json['ipadScreenshotUrls'].cast<String>();
    if (json['appletvScreenshotUrls'] != null) {
      appletvScreenshotUrls = [];
      json['appletvScreenshotUrls'].forEach((v) {
        appletvScreenshotUrls?.add(v);
      });
    }
    artworkUrl60 = json['artworkUrl60'];
    artworkUrl512 = json['artworkUrl512'];
    artworkUrl100 = json['artworkUrl100'];
    artistViewUrl = json['artistViewUrl'];
    screenshotUrls = json['screenshotUrls'].cast<String>();
    isGameCenterEnabled = json['isGameCenterEnabled'];
    features = json['features'].cast<String>();
    supportedDevices = json['supportedDevices'].cast<String>();
    if (json['advisories'] != null) {
      advisories = [];
      json['advisories'].forEach((v) {
        advisories?.add(v);
      });
    }
    kind = json['kind'];
    trackViewUrl = json['trackViewUrl'];
    minimumOsVersion = json['minimumOsVersion'];
    trackCensoredName = json['trackCensoredName'];
    languageCodesISO2A = json['languageCodesISO2A'].cast<String>();
    fileSizeBytes = json['fileSizeBytes'];
    formattedPrice = json['formattedPrice'];
    averageUserRatingForCurrentVersion =
        json['averageUserRatingForCurrentVersion'];
    userRatingCountForCurrentVersion = json['userRatingCountForCurrentVersion'];
    averageUserRating = json['averageUserRating'];
    trackContentRating = json['trackContentRating'];
    contentAdvisoryRating = json['contentAdvisoryRating'];
    bundleId = json['bundleId'];
    trackId = json['trackId'];
    trackName = json['trackName'];
    releaseDate = json['releaseDate'];
    genreIds = json['genreIds'].cast<String>();
    primaryGenreName = json['primaryGenreName'];
    isVppDeviceBasedLicensingEnabled = json['isVppDeviceBasedLicensingEnabled'];
    sellerName = json['sellerName'];
    currentVersionReleaseDate = json['currentVersionReleaseDate'];
    releaseNotes = json['releaseNotes'];
    primaryGenreId = json['primaryGenreId'];
    currency = json['currency'];
    artistId = json['artistId'];
    artistName = json['artistName'];
    genres = json['genres'].cast<String>();
    price = json['price'];
    description = json['description'];
    version = json['version'];
    wrapperType = json['wrapperType'];
    userRatingCount = json['userRatingCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ipadScreenshotUrls'] = this.ipadScreenshotUrls;
    if (this.appletvScreenshotUrls != null) {
      data['appletvScreenshotUrls'] =
          this.appletvScreenshotUrls?.map((v) => v).toList();
    }
    data['artworkUrl60'] = this.artworkUrl60;
    data['artworkUrl512'] = this.artworkUrl512;
    data['artworkUrl100'] = this.artworkUrl100;
    data['artistViewUrl'] = this.artistViewUrl;
    data['screenshotUrls'] = this.screenshotUrls;
    data['isGameCenterEnabled'] = this.isGameCenterEnabled;
    data['features'] = this.features;
    data['supportedDevices'] = this.supportedDevices;
    if (this.advisories != null) {
      data['advisories'] = this.advisories?.map((v) => v).toList();
    }
    data['kind'] = this.kind;
    data['trackViewUrl'] = this.trackViewUrl;
    data['minimumOsVersion'] = this.minimumOsVersion;
    data['trackCensoredName'] = this.trackCensoredName;
    data['languageCodesISO2A'] = this.languageCodesISO2A;
    data['fileSizeBytes'] = this.fileSizeBytes;
    data['formattedPrice'] = this.formattedPrice;
    data['averageUserRatingForCurrentVersion'] =
        this.averageUserRatingForCurrentVersion;
    data['userRatingCountForCurrentVersion'] =
        this.userRatingCountForCurrentVersion;
    data['averageUserRating'] = this.averageUserRating;
    data['trackContentRating'] = this.trackContentRating;
    data['contentAdvisoryRating'] = this.contentAdvisoryRating;
    data['bundleId'] = this.bundleId;
    data['trackId'] = this.trackId;
    data['trackName'] = this.trackName;
    data['releaseDate'] = this.releaseDate;
    data['genreIds'] = this.genreIds;
    data['primaryGenreName'] = this.primaryGenreName;
    data['isVppDeviceBasedLicensingEnabled'] =
        this.isVppDeviceBasedLicensingEnabled;
    data['sellerName'] = this.sellerName;
    data['currentVersionReleaseDate'] = this.currentVersionReleaseDate;
    data['releaseNotes'] = this.releaseNotes;
    data['primaryGenreId'] = this.primaryGenreId;
    data['currency'] = this.currency;
    data['artistId'] = this.artistId;
    data['artistName'] = this.artistName;
    data['genres'] = this.genres;
    data['price'] = this.price;
    data['description'] = this.description;
    data['version'] = this.version;
    data['wrapperType'] = this.wrapperType;
    data['userRatingCount'] = this.userRatingCount;
    return data;
  }
}
