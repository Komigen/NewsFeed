import UIKit


enum KeyForUserDefaults {
    static let key = "key"
}

//MARK: Model Font

class UserSettingsModel: Codable {
    
    var sliderValue: Float?
    var userFont:    CGFloat?
    var themeMode:   ThemeMode?
    
    init?(userFont: CGFloat, sliderValue: Float, themeMode: ThemeMode) {
        self.userFont    = userFont
        self.sliderValue = sliderValue
        self.themeMode   = themeMode
    }
}
    
    
    
    


    enum ThemeMode: Codable {
        case light
        case dark
    }


//MARK: UserDefaults SET

func setSettings<T: Encodable>(value: T, key: String) {
    
    let encoder = JSONEncoder()
    let jsonData = try? encoder.encode(value)
    UserDefaults.standard.set(jsonData, forKey: key)
}

//MARK: UserDefaults GET

func getSettings<T: Decodable>(model: T, key: String) -> T? {
    
    if let userSettingsData = UserDefaults.standard.object(forKey: key) as? Data {
        
        let decoder = JSONDecoder()
        guard let userSettings = try? decoder.decode(T.self, from: userSettingsData) else { return  nil}
        return userSettings
    }
    return nil
}


