import UIKit

public let userDefaults = UserDefaults.standard

//MARK: Using this colours. if you have to change the colors, you only need to do this here (Refactor -> Rename)

public let blackColor       = UIColor.black
public let whiteColor       = UIColor.white
public let systemGrayColor  = UIColor.systemGray
public let systemGray4Color = UIColor.systemGray4
public let systemGray6Color = UIColor.systemGray6
public let darkGrayColor    = UIColor.darkGray
public let pinkLight        = UIColor(red: 247, green: 247, blue: 247, alpha: 1.0)

public enum KeyForUserDefaults {
    static let fontKey   = "fontKey"
    static let themeKey  = "themeKey"
    static let sliderKey = "sliderKey"
}

//MARK: Settings and UserDefaults

final class SettingsVC: UIViewController {
    lazy var firstVc = FirstVC()
    
    //MARK: General settings and constants for the application
    
    private var currentsSiderValue:   Float?
    private var currentFontSize:      CGFloat?
    private var currentThemeMode:     Int?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var largeA:        UILabel!
    @IBOutlet weak var smallA:        UILabel!
    
    @IBOutlet weak var segmentedControlLabel: UISegmentedControl!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var sliderOutlet:  UISlider! {
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
            
            settingsLabel.textColor = blackColor
            smallA.textColor        = blackColor
            largeA.textColor        = blackColor
            
            sliderOutlet.minimumTrackTintColor = systemGrayColor
            sliderOutlet.maximumTrackTintColor = systemGray6Color
            segmentedControlLabel.selectedSegmentTintColor = whiteColor
            segmentedControlLabel.backgroundColor = systemGrayColor
            self.view.backgroundColor = whiteColor
            
        case 1:
            currentThemeMode = 1
            
            settingsLabel.textColor = whiteColor
            smallA.textColor        = whiteColor
            largeA.textColor        = whiteColor
            
            sliderOutlet.minimumTrackTintColor = systemGray6Color
            sliderOutlet.maximumTrackTintColor = darkGrayColor
            segmentedControlLabel.selectedSegmentTintColor = darkGrayColor
            segmentedControlLabel.backgroundColor = systemGray6Color
            self.view.backgroundColor = blackColor
            
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
            sliderOutlet.minimumTrackTintColor = systemGrayColor
            sliderOutlet.maximumTrackTintColor = systemGray6Color
            
            self.view.backgroundColor = whiteColor
            segmentedControlLabel.selectedSegmentTintColor = whiteColor
            segmentedControlLabel.backgroundColor          = systemGrayColor
            
            settingsLabel.textColor = blackColor
            smallA.textColor        = blackColor
            largeA.textColor        = blackColor
            
            self.navigationController?.navigationBar.barTintColor = whiteColor
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: blackColor]
            self.tabBarController?.tabBar.barTintColor = whiteColor
            //            print("Presented light display mode on SettingsVc")
        case 1:
            sliderOutlet.minimumTrackTintColor = systemGray6Color
            sliderOutlet.maximumTrackTintColor = darkGrayColor
            
            self.view.backgroundColor = blackColor
            segmentedControlLabel.selectedSegmentTintColor = darkGrayColor
            segmentedControlLabel.backgroundColor          = systemGray6Color
            
            settingsLabel.textColor = whiteColor
            smallA.textColor        = whiteColor
            largeA.textColor        = whiteColor
            
            self.navigationController?.navigationBar.barTintColor = blackColor
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: whiteColor]
            self.tabBarController?.tabBar.barTintColor = blackColor
            //            print("Presented dark display mode on SettingsVc")
        default:
            break
        }
    }
}

