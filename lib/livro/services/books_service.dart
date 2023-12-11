import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../models/book.dart';


enum OrderBy { relevance, newest }
enum PrintType { all, books, magazines }
enum Filter { partial, full, freeEbooks, paidEbooks, ebooks }

class BookService {
  // Replace with an appropriate method to retrieve your API key securely
  static const String _apiKey = 'AIzaSyCqL41dJbcKJ5sF68w8GHVAW1uPly3sRBs';
  static const String _baseUrl = 'https://www.googleapis.com/books/v1/volumes';

  /// Searches for books using the Google Books API.
  /// Throws [HttpException] for network-related errors and [FormatException] for parsing errors.
  static Future<List<Book>> searchBooks({
    required String query,
    int numberOfElements = 20,
    OrderBy orderBy = OrderBy.relevance,
    PrintType printType = PrintType.all,
    Filter filter = Filter.partial,
  }) async {
    if (numberOfElements > 40) {
      throw Exception('The maximum number of elements is 40');
    }
    final encodedQuery = Uri.encodeComponent(query);

    final url = Uri.parse(
      '$_baseUrl?q=$encodedQuery&maxResults=$numberOfElements&'
      'orderBy=${orderBy.toString().split('.').last}&'
      'printType=${printType.toString().split('.').last}&'
      'filter=${filter.toString().split('.').last}&key=$_apiKey',
    );

    try {
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
    } catch (e) {
      // Consider logging the error or handling it appropriately
      rethrow;
    }
  }

  /// Retrieves a book by its ID.
  /// Throws [HttpException] for network-related errors and [FormatException] for parsing errors.
  static Future<Book?> getBookById(String id) async {
    final url = Uri.parse('$_baseUrl/$id?key=$_apiKey');

    try {
      http.Response res = await http.get(url);

      if (res.statusCode != 200) {
        throw HttpException(
          'Unexpected error: ${res.statusCode} - ${res.reasonPhrase}',
        );
      }

      dynamic book = json.decode(res.body);
      return Book.fromMap(book);
    } catch (e) {
      // Consider logging the error or handling it appropriately
      rethrow;
    }
  }
}
