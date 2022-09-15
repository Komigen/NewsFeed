import UIKit

enum KeyForUserDefaults: String {
    case key
}

struct StoreSettingsFontSize: Codable {
    var fontSize: CGFloat!
}

struct StoreSettingsTheme: Codable {
    var theme: ThemeMode!
    
    enum ThemeMode: Codable {
        case light
        case dark
    }
}

class SettingsVC: UIViewController {
    
    
    @IBOutlet weak var fontSizeLabel: UILabel! {
        didSet {
            fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName,
                                        size: CGFloat(sliderOutlet.value))
        }
    }
    
    @IBOutlet weak var sliderOutlet: UISlider! {
        didSet {
            sliderOutlet.minimumValue = 12.0
            sliderOutlet.maximumValue = 22.0
            sliderOutlet.value = 16.0
//            sliderOutlet.value = getSettings(model: StoreSettingsFontSize,
//                                                   key: KeyForUserDefaults.key.rawValue) ?? 16.0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        getSettings(model: StoreSettingsFontSize, key: KeyForUserDefaults.key.rawValue)
        
        
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        
        let senderValue = CGFloat(sender.value)
        let storeValue = StoreSettingsFontSize(fontSize: senderValue)
        setSettings(value: storeValue, key: KeyForUserDefaults.key.rawValue)
        
        fontSizeLabel.font = UIFont(name: (fontSizeLabel.font.fontName), size: senderValue)
    }
    
    @IBAction func displayModeSegments(_ sender: UISegmentedControl) {
        let segmentIndex = sender.selectedSegmentIndex
        
        switch segmentIndex {
        case 0:
            let storeValue = StoreSettingsTheme(theme: .light)
            setSettings(value: storeValue, key: KeyForUserDefaults.key.rawValue)
            /* update ThemeMode some code */
        case 1:
            let storeValue = StoreSettingsTheme(theme: .dark)
            setSettings(value: storeValue, key: KeyForUserDefaults.key.rawValue)
            /* update ThemeMode some code */
        default:
            return
        }
    }
    
    
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
//     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//     // Get the new view controller using segue.destination.
//     // Pass the selected object to the new view controller.
//     }
     
    
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

