import 'package:bookbox/livro/models/volume_info.dart';

class Book {
  String kind;
  String id;
  String? etag;
  String? selfLink;
  VolumeInfo volumeInfo;

  Book({
    required this.kind, 
    required this.id, 
    this.etag, 
    this.selfLink, 
    required this.volumeInfo,
  });
  

  Book.fromMap(Map<String, dynamic> book)
    : kind = book['kind'],
      id = book['id'],
      etag = book['etag'],
      selfLink = book['selfLink'],
      volumeInfo = VolumeInfo.fromMap(book['volumeInfo']);

  Map<String, dynamic> toMap() {
    return {
      'kind': kind,
      'id': id,
      'etag': etag,
      'selfLink': selfLink,
      'volumeInfo': volumeInfo.toMap(),
    };
  }
}



