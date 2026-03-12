import Foundation
import SQLite3

class DatabaseManager {

    static let shared = DatabaseManager()

    private var db: OpaquePointer?

    private init() {
        openDatabase()
        createTable()
    }

    private func openDatabase() {

        let fileURL = try! FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appendingPathComponent("tasks.sqlite")

        if sqlite3_open(fileURL.path, &db) != SQLITE_OK {
            print("Error opening database")
        } else {
            print("Database opened successfully")
        }
    }

    private func createTable() {

        let query = """
        CREATE TABLE IF NOT EXISTS tasks(
        id TEXT PRIMARY KEY,
        title TEXT,
        description TEXT,
        taskType TEXT,
        dueDate DOUBLE,
        isCompleted INTEGER
        );
        """

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {
            sqlite3_step(statement)
        } else {
            print("Failed to create table")
        }

        sqlite3_finalize(statement)
    }

    func insertTask(task: Task) {

        let query = "INSERT INTO tasks (id,title,description,taskType,dueDate,isCompleted) VALUES (?,?,?,?,?,?)"

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {

            sqlite3_bind_text(statement, 1, (task.id.uuidString as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 2, (task.title as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 3, (task.description as NSString).utf8String, -1, nil)
            sqlite3_bind_text(statement, 4, (task.taskType as NSString).utf8String, -1, nil)
            sqlite3_bind_double(statement, 5, task.dueDate.timeIntervalSince1970)
            sqlite3_bind_int(statement, 6, task.isCompleted ? 1 : 0)

            if sqlite3_step(statement) != SQLITE_DONE {
                print("Insert failed")
            }

        } else {
            print("Insert statement failed")
        }

        sqlite3_finalize(statement)
    }

    func fetchTasks() -> [Task] {

        var tasks: [Task] = []

        let query = "SELECT * FROM tasks"

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {

            while sqlite3_step(statement) == SQLITE_ROW {

                let idString = String(cString: sqlite3_column_text(statement, 0))
                let title = String(cString: sqlite3_column_text(statement, 1))
                let description = String(cString: sqlite3_column_text(statement, 2))
                let taskType = String(cString: sqlite3_column_text(statement, 3))
                let dueDate = Date(timeIntervalSince1970: sqlite3_column_double(statement, 4))
                let isCompleted = sqlite3_column_int(statement, 5) == 1

                let task = Task(
                    id: UUID(uuidString: idString)!,
                    title: title,
                    description: description,
                    taskType: taskType,
                    dueDate: dueDate,
                    isCompleted: isCompleted
                )

                tasks.append(task)
            }
        }

        sqlite3_finalize(statement)

        return tasks
    }

    func deleteTask(id: UUID) {

        let query = "DELETE FROM tasks WHERE id = ?"

        var statement: OpaquePointer?

        if sqlite3_prepare_v2(db, query, -1, &statement, nil) == SQLITE_OK {

            sqlite3_bind_text(statement, 1, (id.uuidString as NSString).utf8String, -1, nil)

            if sqlite3_step(statement) != SQLITE_DONE {
                print("Delete failed")
            }
        }

        sqlite3_finalize(statement)
    }
}