import 'dart:convert';
import 'package:book_app/core/util/sqldb.dart';
import 'package:book_app/model/book_model.dart';
import 'package:book_app/model/category_model.dart';
import '../api/end_points.dart';
import '../api/status_code.dart';
import '../core/error/failure.dart';
import 'package:fpdart/fpdart.dart';
import 'package:http/http.dart' as http;
import '../core/error/server_exception.dart';
import '../core/util/app_string.dart';
import '../core/util/check_network.dart';

class BooksServices {
  BooksServices(this._sqlDb);
  final SqlDb _sqlDb;
  // جلب جميع الكتب
  Future<Either<Failure, List<BookModel>>> getBooks({int? title}) async {
    List<BookModel> l = [];
    if (await testInternet()) {
      try {
        final finalUrl =
            "${EndPoints.booksUrl}${title != null ? '?title=$title' : ''}";

        http.Response response = await http.get(Uri.parse(finalUrl));

        if (response.statusCode == StatusCode.ok) {
          List data = jsonDecode(response.body);

          for (var d in data) {
            l.add(BookModel.fromJson(d));
          }
          return right(l);
        } else {
          return left(Failure(message: AppString.internalServerError));
        }
      } on ServerException catch (e) {
        return left(Failure(message: e.message));
      }
    } else {
      return left(Failure(message: AppString.internetConnectionError));
    }
  }

  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    if (await testInternet()) {
      try {
        http.Response response =
            await http.get(Uri.parse(EndPoints.categoriesUrl));

        if (response.statusCode == StatusCode.ok) {
          List data = jsonDecode(response.body);

          List<CategoryModel> cats =
              data.map((e) => CategoryModel.fromJson(e)).toList();
          return right(cats);
        } else {
          return left(Failure(message: AppString.internalServerError));
        }
      } on ServerException catch (e) {
        return left(Failure(message: e.message));
      }
    } else {
      return left(Failure(message: AppString.internetConnectionError));
    }
  }

///////// Search  /////////////////////////////////////////
  Future<List<String>> getSearchHistory() async {
    final data = await _sqlDb
        .readData("SELECT query FROM search ORDER BY id DESC LIMIT 10");
    List<String> recentSearches = [];
    recentSearches = data.map((e) => e['query'] as String).toList();
    return recentSearches;
  }

  Future<void> addSearchQuery(String query) async {
    if (query.trim().isEmpty) return;

    // احذف التكرارات
    await _sqlDb.deleteData(
        "DELETE FROM search WHERE query = '${query.replaceAll("'", "''")}'");

    // أدخل الكلمة الجديدة
    await _sqlDb.insertData(
        "INSERT INTO search (query, createdAt) VALUES ('$query', '${DateTime.now().toIso8601String()}')");

    // احذف القديمة إذا تجاوزت 10
    await _sqlDb.deleteData(
        "DELETE FROM search WHERE id NOT IN (SELECT id FROM search ORDER BY id DESC LIMIT 10)");
  }

  Future<void> clearHistory() async {
    await _sqlDb.deleteData("DELETE FROM search");
  }
}
