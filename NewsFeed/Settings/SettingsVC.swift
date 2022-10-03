import UIKit

public let userDefaults = UserDefaults.standard

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
    private var currentThemeMode:     Bool?
    
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
        
        if sender.selectedSegmentIndex == 0 {
            currentThemeMode = true
        } else if sender.selectedSegmentIndex == 1 {
            currentThemeMode = false
        }
        switch currentThemeMode {
            
        case true:
            settingsLabel.textColor = UIColor.blackCustom
            smallA.textColor        = UIColor.blackCustom
            largeA.textColor        = UIColor.blackCustom
            
            sliderOutlet.minimumTrackTintColor = UIColor.systemGrayCustom
            sliderOutlet.maximumTrackTintColor = UIColor.systemGray6Custom
            segmentedControlLabel.selectedSegmentTintColor = UIColor.whiteCustom
            segmentedControlLabel.backgroundColor = UIColor.systemGrayCustom
            self.view.backgroundColor = UIColor.whiteCustom
            
        case false:
            
            settingsLabel.textColor = UIColor.whiteCustom
            smallA.textColor        = UIColor.whiteCustom
            largeA.textColor        = UIColor.whiteCustom
            
            sliderOutlet.minimumTrackTintColor = UIColor.systemGray6Custom
            sliderOutlet.maximumTrackTintColor = UIColor.darkGrayCustom
            segmentedControlLabel.selectedSegmentTintColor = UIColor.darkGrayCustom
            segmentedControlLabel.backgroundColor = UIColor.systemGray6Custom
            self.view.backgroundColor = UIColor.blackCustom
        case .none:
            break
        case .some(_):
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
        self.dismiss(animated: true)
    }
    
    //MARK: Ui settings before display
    
    private func updateThemeUi() {
        
        fontSizeLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 19.0)
        
        sliderOutlet.value = ((userDefaults.object(forKey: KeyForUserDefaults.sliderKey) as? Float) ?? sliderOutlet.value)
        
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool  ?? true {
        case true:  segmentedControlLabel.selectedSegmentIndex = 0
        case false: segmentedControlLabel.selectedSegmentIndex = 1
        }
        
        currentThemeMode = userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true
        
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Bool ?? true {
            
        case true:
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
        case false:
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
        }
    }
}

