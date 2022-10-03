import UIKit

public let userDefaults = UserDefaults.standard
public let notificationCenter = NotificationCenter.default

public enum KeyForUserDefaults {
    static let fontKey   = "fontKey"
    static let themeKey  = "themeKey"
    static let sliderKey = "sliderKey"
}

//MARK: Settings and UserDefaults

final class SettingsVC: UIViewController {
    
    //MARK: General settings and constants for the application
    
    private var currentsSiderValue:   Float?
    private var currentFontSize:      CGFloat?
    private var currentThemeMode:     Int?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var largeA:        UILabel!
    @IBOutlet weak var smallA:        UILabel!
    
    @IBOutlet weak var segmentedControlLabel: UISegmentedControl!
    @IBOutlet weak var fontSizeLabel:         UILabel!
    @IBOutlet weak var sliderOutlet:          UISlider! {
        didSet {
            sliderOutlet.minimumValue = 16.0
            sliderOutlet.maximumValue = 22.0
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateThemeUi()
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let senderValue    = CGFloat(sender.value)
        fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName, size: senderValue)
        currentFontSize    = senderValue
        currentsSiderValue = Float(senderValue)
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            currentThemeMode = 0
            
            settingsLabel.textColor = UIColor.blackCustom
            smallA.textColor        = UIColor.blackCustom
            largeA.textColor        = UIColor.blackCustom
            
            sliderOutlet.minimumTrackTintColor = UIColor.systemGrayCustom
            sliderOutlet.maximumTrackTintColor = UIColor.systemGray6Custom
            segmentedControlLabel.selectedSegmentTintColor = UIColor.whiteCustom
            segmentedControlLabel.backgroundColor = UIColor.systemGrayCustom
            self.view.backgroundColor = UIColor.whiteCustom
            
        case 1:
            currentThemeMode = 1
            
            settingsLabel.textColor = UIColor.whiteCustom
            smallA.textColor        = UIColor.whiteCustom
            largeA.textColor        = UIColor.whiteCustom
            
            sliderOutlet.minimumTrackTintColor = UIColor.systemGray6Custom
            sliderOutlet.maximumTrackTintColor = UIColor.darkGrayCustom
            segmentedControlLabel.selectedSegmentTintColor = UIColor.darkGrayCustom
            segmentedControlLabel.backgroundColor = UIColor.systemGray6Custom
            self.view.backgroundColor = UIColor.blackCustom
            
        default:
            break
        }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        if currentFontSize != nil {
            userDefaults.set(currentFontSize, forKey: KeyForUserDefaults.fontKey)
        }
        
        if currentsSiderValue != nil {
            userDefaults.set(currentsSiderValue, forKey: KeyForUserDefaults.sliderKey)
        }
        
        if currentThemeMode != nil {
            userDefaults.set(currentThemeMode, forKey: KeyForUserDefaults.themeKey)
        }
        
        /* Post Notification */
        let dict = ["currentThemeMode": userDefaults.set(currentThemeMode, forKey: KeyForUserDefaults.themeKey)]
        notificationCenter.post(name: .savedSettings, object: self, userInfo: dict)

        self.dismiss(animated: true)
    }
    
    //MARK: Ui settings before display
    
    private func updateThemeUi() {
        
        fontSizeLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 19.0)
        
        sliderOutlet.value = ((userDefaults.object(forKey: KeyForUserDefaults.sliderKey) as? Float) ?? sliderOutlet.value)
        
        segmentedControlLabel.selectedSegmentIndex = ((userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int) ?? 0)
        
        currentThemeMode = userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0
        
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0 {
            
        case 0:
            sliderOutlet.minimumTrackTintColor = UIColor.systemGrayCustom
            sliderOutlet.maximumTrackTintColor = UIColor.systemGray6Custom
            
            self.view.backgroundColor = UIColor.whiteCustom
            segmentedControlLabel.selectedSegmentTintColor = UIColor.whiteCustom
            segmentedControlLabel.backgroundColor          = UIColor.systemGrayCustom
            
            settingsLabel.textColor = UIColor.blackCustom
            smallA.textColor        = UIColor.blackCustom
            largeA.textColor        = UIColor.blackCustom
            
            self.navigationController?.navigationBar.barTintColor = UIColor.whiteCustom
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blackCustom]
            self.tabBarController?.tabBar.barTintColor = UIColor.whiteCustom
            //            print("Presented light display mode on SettingsVc")
        case 1:
            sliderOutlet.minimumTrackTintColor = UIColor.systemGray6Custom
            sliderOutlet.maximumTrackTintColor = UIColor.darkGrayCustom
            
            self.view.backgroundColor = UIColor.blackCustom
            segmentedControlLabel.selectedSegmentTintColor = UIColor.darkGrayCustom
            segmentedControlLabel.backgroundColor          = UIColor.systemGray6Custom
            
            settingsLabel.textColor = UIColor.whiteCustom
            smallA.textColor        = UIColor.whiteCustom
            largeA.textColor        = UIColor.whiteCustom
            
            self.navigationController?.navigationBar.barTintColor = UIColor.blackCustom
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.whiteCustom]
            self.tabBarController?.tabBar.barTintColor = UIColor.blackCustom
            //            print("Presented dark display mode on SettingsVc")
        default:
            break
        }
    }
}

