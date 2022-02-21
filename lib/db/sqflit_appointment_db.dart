import 'package:flutter/foundation.dart';
import 'package:procare_app/model/appointment_model.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class SQLHelper {
  static sql.Database? _db;
  static final int _version = 1;
  static final String _tableName = "appointment3_table";
  static final String _dbApp = 'procare3.db';


  static Future<void> createTables(sql.Database database) async {


    //await database.execute("DROP TABLE IF EXISTS $_tableName");

    await database.execute(
      "CREATE TABLE $_tableName("
          "id INTEGER PRIMARY KEY AUTOINCREMENT, "
          "note STRING, time STRING, intent STRING, date STRING"
          ")",
    );

  }
// id: the id of a item
// title, description: name and description of your activity
// created_at: the time that the item was created. It will be automatically handled by SQLite
  static Future<sql.Database> db() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _dbApp);
    return sql.openDatabase(
      path,
      version: _version,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  // Create new item (journal)
  static Future<int> createItem(AppointmentModel appointmentModel) async {
    final db = await SQLHelper.db();
    //this prevent us from listing our content as stated in the comment section
    //final data = TaskModel();
    //final data = {};
    //return await db.delete(_tableName);
    final id = await db.insert(_tableName, appointmentModel.toJson(),
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  // Read all items (journals)
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query(_tableName, orderBy: "id");
  }

  // Read a single item by id
  // The app doesn't use this method but I put here in case you want to see it
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query(_tableName, where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update an item by id
  static Future<int> updateItem( int id, AppointmentModel updatedDataModel) async {
    final db = await SQLHelper.db();

    final result =
    await db.update(_tableName, updatedDataModel.toJson(), where: "id = ?", whereArgs: [id]); //id can also be updatedDatamodel.id
    return result;
  }

  // you could've also used this query to update just isCompleted
  // static update(int id) async{ return await _db!.rawUpdate(''' UPDATE tasks SET isCompleted = ? WHERE id=? ''',[1, id]);}

  // Delete
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete(_tableName, where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

}
