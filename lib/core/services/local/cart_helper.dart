import 'package:ecommerce_app/core/constants.dart';
import 'package:ecommerce_app/model/cart_product_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class CartDbHelper {
  CartDbHelper._();
  static final CartDbHelper db = CartDbHelper._();
  static Database _database;
  Future<Database> get database async {
    if (_database == null) {
      _database = await initDb();
    }
    return _database;
  }

  Future<Database> initDb() async {
    String path = join(await getDatabasesPath(), 'cart_product.db');
    return await openDatabase(path, version: 1, onCreate: _createDb);
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $tableCartProduct($colProductId TEXT PRIMARY KEY, $colName TEXT NOT NULL, '
        '$colImage TEXT NOT NULL, $colPrice TEXT NOT NULL, $colQty INTEGER NOT NULL)');
  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> insertData(CartProductModel model) async {
    Database db = await this.database;
    var result = await db.insert(tableCartProduct, model.toJson());
    return result;
  }

  Future<List<Map<String, dynamic>>> getMapList() async {
    Database db = await this.database;
    var result = await db.query(tableCartProduct, orderBy: '$colProductId ASC');
    return result;
  }

  Future<List<CartProductModel>> getList() async {
    var db = await database;
    List<Map> maps = await db.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient.update(tableCartProduct, model.toJson(),
        where: '$colProductId = ?', whereArgs: [model.productId]);
  }
}
/**

    await db.execute('''CREATE TABLE $tableCartProduct ('
    ' $colProductId TEXT NOT NULL, '
    ' $colName TEXT NOT NULL, '
    ' $colImage TEXT NOT NULL,'
    '$colQty INTEGER NOT NULL,'
    '$colPrice TEXT NOT NULL)''');

 * */

/*
(Database db, int version) async {
      await db.execute('CREATE TABLE $tableCartProduct ('
          ' $colProductId TEXT NOT NULL, '
          ' $colName TEXT NOT NULL, '
          ' $colImage TEXT NOT NULL,'
          ' $colQty INTEGER NOT NULL,'
          ' $colPrice TEXT NOT NULL)');
    }
* */
