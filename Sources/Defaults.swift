import Foundation

public enum Defaults: String {
    case
    _rated,
    _created,
    _authenticate,
    _tools,
    _spell,
    _correction,
    _sidebar
    
    public static var action: Action {
        if let created = wasCreated {
            let days = Calendar.current.dateComponents([.day], from: created, to: .init()).day!
            if !hasRated && days > 6 {
                hasRated = true
                return .rate
            }
        } else {
            wasCreated = .init()
        }
        return .none
    }

    public static var hasRated: Bool {
        get { self[._rated] as? Bool ?? false }
        set { self[._rated] = newValue }
    }
    
    public static var authenticate: Bool {
        get { self[._authenticate] as? Bool ?? false }
        set { self[._authenticate] = newValue }
    }
    
    public static var tools: Bool {
        get { self[._tools] as? Bool ?? true }
        set { self[._tools] = newValue }
    }
    
    public static var spell: Bool {
        get { self[._spell] as? Bool ?? true }
        set { self[._spell] = newValue }
    }
    
    public static var correction: Bool {
        get { self[._correction] as? Bool ?? false }
        set { self[._correction] = newValue }
    }
    
    public static var sidebar: Bool {
        get { self[._sidebar] as? Bool ?? false }
        set { self[._sidebar] = newValue }
    }
    
    static var wasCreated: Date? {
        get { self[._created] as? Date }
        set { self[._created] = newValue }
    }
    
    private static subscript(_ key: Self) -> Any? {
        get { UserDefaults.standard.object(forKey: key.rawValue) }
        set { UserDefaults.standard.setValue(newValue, forKey: key.rawValue) }
    }
}
