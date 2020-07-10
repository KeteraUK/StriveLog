import Foundation

final class Log {
    // MARK: Configuration

    /// Represents a level of detail to be logged.
    public enum Level: Int {
        case verbose
        case debug
        case info
        case warning
        case error
        case off

        var name: String {
            switch self {
            case .verbose: return "Verbose"
            case .debug: return "Debug"
            case .info: return "Info"
            case .warning: return "Warning"
            case .error: return "Error"
            case .off: return "Disabled"
            }
        }

        var emoji: String {
            switch self {
            case .verbose: return "📖"
            case .debug: return "🐝"
            case .info: return "✏️"
            case .warning: return "⚠️"
            case .error: return "⁉️"
            case .off: return ""
            }
        }
    }

    /// The log level, defaults to .Off
    public static var logLevel: Level = .off

    /// If true, prints emojis to signify log type, defaults to off
    public static var useEmoji: Bool = true

    /// If this is non-nil, we will call it with the same string that we
    /// are going to print to the console. You can use this to pass log
    /// messages along to your crash reporter, analytics service, etc.
    public static var handler: ((Level, String) -> Void)?

    /// Date formatter for log
    private static let dateformatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "Y-MM-dd H:m:ss.SSSS"
        return dateFormatter
    }()

    /// Generic log method
    private static func log<T>(_ object: @autoclosure () -> T, level: Log.Level, _ fileName: String, _: String, _ line: Int) {
        if logLevel.rawValue <= level.rawValue {
            let date = Log.dateformatter.string(from: Date())
            let components: [String] = fileName.components(separatedBy: "/")
            let objectName = components.last ?? "Unknown Object"
            let levelString = Log.useEmoji ? level.emoji : "|" + level.name.uppercased() + "|"
            let logString = "\(levelString) [\(date)]: \(object()) [\(objectName): \(line)]"
            print(logString)
            handler?(level, logString)
        }
    }

    // MARK: - Log Methods

    public static func error<T>(
        _ object: @autoclosure () -> T,
        _ fileName: String = #file,
        _ functionName: String = #function,
        _ line: Int = #line
    ) {
        log(object(), level: .error, fileName, functionName, line)
    }

    public static func warning<T>(
        _ object: @autoclosure () -> T,
        _ fileName: String = #file,
        _ functionName: String = #function,
        _ line: Int = #line
    ) {
        log(object(), level: .warning, fileName, functionName, line)
    }

    public static func info<T>(
        _ object: @autoclosure () -> T,
        _ fileName: String = #file,
        _ functionName: String = #function,
        _ line: Int = #line
    ) {
        log(object(), level: .info, fileName, functionName, line)
    }

    public static func debug<T>(
        _ object: @autoclosure () -> T,
        _ fileName: String = #file,
        _ functionName: String = #function,
        _ line: Int = #line
    ) {
        log(object(), level: .debug, fileName, functionName, line)
    }

    public static func verbose<T>(
        _ object: @autoclosure () -> T,
        _ fileName: String = #file,
        _ functionName: String = #function,
        _ line: Int = #line
    ) {
        log(object(), level: .verbose, fileName, functionName, line)
    }
}
