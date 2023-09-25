class VolumeInfo {
  String? title;
  String? subtitle;
  List<String>? authors;
  String? publisher;
  DateTime? publishedDate;
  String? description;
  int? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  ImageLinks imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  VolumeInfo({
    this.title, 
    this.subtitle, 
    this.authors, 
    this.publisher, 
    this.publishedDate, 
    this.description, 
    this.pageCount, 
    this.printType, 
    this.categories, 
    this.maturityRating, 
    this.allowAnonLogging, 
    this.contentVersion, 
    required this.imageLinks, 
    this.language, 
    this.previewLink, 
    this.infoLink, 
    this.canonicalVolumeLink,
  });

  VolumeInfo.fromMap(Map<String, dynamic> volumeInfo)
    : title = volumeInfo['title'],
      subtitle = volumeInfo['subtitle'],
      authors = volumeInfo['authors'] != null ? List<String>.from(volumeInfo['authors']) : null,
      publisher = volumeInfo['publisher'],
      publishedDate = volumeInfo['publishedDate'] != null ? DateTime.tryParse(volumeInfo['publishedDate']) : null,
      description = volumeInfo['description'],
      pageCount = volumeInfo['pageCount'],
      printType = volumeInfo['printType'],
      categories = volumeInfo['categories'] != null ? List<String>.from(volumeInfo['categories']) : null,
      maturityRating = volumeInfo['maturityRating'],
      allowAnonLogging = volumeInfo['allowAnonLogging'],
      contentVersion = volumeInfo['contentVersion'],
      imageLinks = ImageLinks.fromMap(volumeInfo['imageLinks']),
      language = volumeInfo['language'],
      previewLink = volumeInfo['previewLink'],
      infoLink = volumeInfo['infoLink'],
      canonicalVolumeLink = volumeInfo['canonicalVolumeLink'];

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'authors': authors,
      'publisher': publisher,
      'publishedDate': publishedDate,
      'description': description,
      'pageCount': pageCount,
      'printType': printType,
      'categories': categories,
      'maturityRating': maturityRating,
      'allowAnonLogging': allowAnonLogging,
      'contentVersion': contentVersion,
      'imageLinks': imageLinks.toMap(),
      'language': language,
      'previewLink': previewLink,
      'infoLink': infoLink,
      'canonicalVolumeLink': canonicalVolumeLink,
    };
  }
}

class ImageLinks {
  String? smallThumbnail;
  String? thumbnail;
  String? small;

  ImageLinks({
    this.smallThumbnail, 
    this.thumbnail,
    this.small,
  });

  Map<String, dynamic> toMap() {
    return {
      'smallThumbnail': smallThumbnail,
      'thumbnail': thumbnail,
      'small': small,
    };
  }

  ImageLinks.fromMap(Map<String, dynamic> imageLinks)
    : smallThumbnail = imageLinks['smallThumbnail'],
      thumbnail = imageLinks['thumbnail'],
      small = imageLinks['small'];
}