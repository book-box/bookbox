import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../models/book.dart';

enum OrderBy { relevance, newest }

enum PrintType { all, books, magazines }

enum Filter { partial, full, freeEbooks, paidEbooks, ebooks }

class BookService {
  static const String _apiKey = 'AIzaSyBfyRr1QIB9RPOg9xXOXI230LY54KBspDs';
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  static Future<List<Book>> searchBooks({
    required String query,
    int numberOfElements = 20,
    OrderBy orderBy = OrderBy.relevance,
    PrintType printType = PrintType.all,
    Filter filter = Filter.partial,
  }) async {
    if (numberOfElements > 40) {
      throw Exception('The maximum number of elements is 40');
    } else if (query.contains(' ')) {
      query = query.replaceAll(' ', '+');
    }

    final url = Uri.parse(
      '$_baseUrl?q=$query&maxResults=$numberOfElements&'
      'orderBy=${orderBy.toString().split('.').last}&'
      'printType=${printType.toString().split('.').last}&'
      'filter=${filter.toString().split('.').last}&key=$_apiKey',
    );
    http.Response res = await http.get(url);

    if (res.statusCode != 200) {
      throw HttpException(
        'Unexpected error: ${res.statusCode} - ${res.reasonPhrase}',
      );
    }

    List<Book> books = [];
    dynamic list = json.decode(res.body);

    for (Map<String, dynamic> item in list['items']) {
      books.add(Book.fromMap(item));
    }

    return books;
  }

  static Future<Book?> getBookById(String id) async {
    final url = Uri.parse('$_baseUrl/$id?key=$_apiKey');
    http.Response res = await http.get(url);

    if (res.statusCode != 200) {
      throw HttpException(
        'Unexpected error: ${res.statusCode} - ${res.reasonPhrase}',
      );
    }

    dynamic book = json.decode(res.body);
    return Book.fromMap(book);
  }
}
