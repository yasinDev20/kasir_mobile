import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  static Future<void> createUpdatedAtTrigger(
    Database db,
    String tableName,
  ) async {
    await db.execute('''
    CREATE TRIGGER update_${tableName}_updated_at
    AFTER UPDATE ON $tableName
    FOR EACH ROW
    BEGIN
      UPDATE $tableName
      SET updated_at = CURRENT_TIMESTAMP
      WHERE id = OLD.id;
    END;
  ''');
  }

  static Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'kasir.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
      CREATE TABLE transactions (
        id TEXT PRIMARY KEY,
        product_id TEXT NOT NULL,
        quantity INTEGER NOT NULL,
        price REAL NOT NULL,
        created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');

        await db.execute('''
      CREATE TABLE products (
        id TEXT PRIMARY KEY,
        name TEXT NOT NULL,
        price REAL NOT NULL,
        notes TEXT,
        created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
        updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
      )
    ''');

        await createUpdatedAtTrigger(db, 'transactions');
        await createUpdatedAtTrigger(db, 'products');
      },
    );
  }
}
