import UIKit

class SettingsVC: UIViewController {
    
    var currentFontSize:    CGFloat?
    var currentsSiderValue: Float?
    var currentTheme:       ThemeMode?
    
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var sliderOutlet: UISlider! {
        didSet {
            sliderOutlet.minimumValue = 12.0
            sliderOutlet.maximumValue = 20.0
            sliderOutlet.value = 16.0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let senderValue = CGFloat(sender.value)
        fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName, size: senderValue)
        currentFontSize = senderValue
        currentFontSize = senderValue
    }
    
    @IBAction func displayModeSegments(_ sender: UISegmentedControl) {
        let segmentIndex = sender.selectedSegmentIndex
        
        switch segmentIndex {
        case 0:
            currentTheme = ThemeMode.light
        case 1:
            currentTheme = ThemeMode.dark
        default:
            return
        }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        let currentSettings = UserSettingsModel(userFont: currentFontSize!, sliderValue: Float(currentFontSize!), themeMode: currentTheme!)
        print(currentFontSize ?? fontSizeLabel.font.lineHeight)
        setSettings(value: currentSettings, key: KeyForUserDefaults.key)
        
        self.dismiss(animated: true)
    }
    
    
    
    
    
    
    
    
    
    
}
