import 'package:sqflite/sqflite.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database> get db async {
    if (_db == null) {
      _db = await initalDb();
      return _db!;
    } else {
      return _db!;
    }
  }

  initalDb() async {
    String databasePath = await getDatabasesPath(); // مكان قاعدة البيانات

    String path = join(databasePath,
        "book_app.db"); // دمج اسم القاعدة مع الموقع للحصول على مسار كامل

    Database mydb = await openDatabase(path,
        onCreate: _onCreate, version: 1, onUpgrade: _onUpgrade);

    return mydb;
  }

  //  يتم استدعائها مره واحدة فقط وظيفتها انشاء الجداول لقاعدة البيانات
  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE search (id INTEGER  NOT NULL  PRIMARY KEY AUTOINCREMENT, query TEXT NOT NULL ,  createdAt TEXT NOT NULL )');
  }

// يتم استدعائها في كل مره تغير فيها رقم version الغرض منها هو لتحديث قاعدة البيانات مثلا اضافة جدول جديد او حذف جدول
  _onUpgrade(Database db, int oldversion, int newversion) {}

// Select
  Future<List<Map<String, dynamic>>> readData(String sql) async {
    Database mydb = await db;

    List<Map<String, dynamic>> response = await mydb.rawQuery(sql);

    return response;
  }

// insert
  Future<int> insertData(String sql) async {
    Database mydb = await db;

    int response = await mydb.rawInsert(sql);

    return response;
  }

// update
  updateData(String sql) async {
    Database mydb = await db;

    int response = await mydb.rawUpdate(sql);

    return response;
  }

// delete
  Future<int> deleteData(String sql) async {
    Database mydb = await db;

    int response = await mydb.rawDelete(sql);

    return response;
  }
}
