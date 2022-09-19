import UIKit

//MARK: General settings and constants for the application

public var currentFontSize: CGFloat?
public var currentThemeMode: Int?

let userDefaults = UserDefaults.standard
enum KeyForUserDefaults {
    static let fontKey = "fontKey"
    static let themeKey = "themeKey"
    static let sliderKey = "sliderKey"
}

//MARK: Settings

class SettingsVC: UIViewController {
    
    private var currentsSiderValue: Float?
    private var currentTheme:       Float?
    

    
    
    @IBOutlet weak var segmentedControlLabel: UISegmentedControl!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider! {
        didSet {
            sliderOutlet.minimumValue = 16.0
            sliderOutlet.maximumValue = 22.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderOutlet.value = ((userDefaults.object(forKey: KeyForUserDefaults.sliderKey) as? Float) ?? 18.0)
        fontSizeLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? fontSizeLabel.font.pointSize)
        segmentedControlLabel.selectedSegmentIndex = ((userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int) ?? 1)
        
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let senderValue = CGFloat(sender.value)
        fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName, size: senderValue)
        currentFontSize = senderValue
        currentsSiderValue = Float(senderValue)
    }
    
    @IBAction func displayModeSegments(_ sender: UISegmentedControl) {
                let segmentIndex = sender.selectedSegmentIndex
        
        switch segmentIndex {
                case 0:
                    currentTheme = 0
                case 1:
                    currentTheme = 1
                default:
                    return
                }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
                
        if currentFontSize != nil {
            userDefaults.set(currentFontSize, forKey: KeyForUserDefaults.fontKey)
        }
        
        if currentsSiderValue != nil {
            userDefaults.set(currentsSiderValue, forKey: KeyForUserDefaults.sliderKey)
        }
        
        if currentTheme != nil {
            userDefaults.set(currentTheme, forKey: KeyForUserDefaults.themeKey)
        }
        self.dismiss(animated: true)
    }
}

