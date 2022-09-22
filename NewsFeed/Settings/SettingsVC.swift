import UIKit

let userDefaults = UserDefaults.standard

//MARK: Using this colours

let blackColor       = UIColor.black
let whiteColor       = UIColor.white
let systemGrayColor  = UIColor.systemGray
let systemGray4Color = UIColor.systemGray4
let systemGray6Color = UIColor.systemGray6
let darkGrayColor    = UIColor.darkGray

enum KeyForUserDefaults {
    static let fontKey   = "fontKey"
    static let themeKey  = "themeKey"
    static let sliderKey = "sliderKey"
}

//MARK: Settings and UserDefaults

class SettingsVC: UIViewController {
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
        prepareUi()
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
            
            print("Selected light display mode")
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
            
            print("Selected dark display mode")
            
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

    func prepareUi() {
       
        fontSizeLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.fontKey) as? CGFloat ?? 19.0)
        
        sliderOutlet.value = ((userDefaults.object(forKey: KeyForUserDefaults.sliderKey) as? Float) ?? sliderOutlet.value)
        
        segmentedControlLabel.selectedSegmentIndex = ((userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int) ?? 0)
        
        currentThemeMode = userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int ?? 0
        
        switch userDefaults.object(forKey: KeyForUserDefaults.themeKey) as? Int {
        case 0:
            sliderOutlet.minimumTrackTintColor = systemGrayColor
            sliderOutlet.maximumTrackTintColor = systemGray6Color
            
            self.view.backgroundColor = whiteColor
            segmentedControlLabel.selectedSegmentTintColor = whiteColor
            segmentedControlLabel.backgroundColor          = systemGrayColor
            
            settingsLabel.textColor = blackColor
            smallA.textColor        = blackColor
            largeA.textColor        = blackColor
            
            print("Presented light display mode on SettingsVc")

        case 1:
            sliderOutlet.minimumTrackTintColor = systemGray6Color
            sliderOutlet.maximumTrackTintColor = darkGrayColor
            
            self.view.backgroundColor = blackColor
            segmentedControlLabel.selectedSegmentTintColor = darkGrayColor
            segmentedControlLabel.backgroundColor          = systemGray6Color
            
            settingsLabel.textColor = whiteColor
            smallA.textColor        = whiteColor
            largeA.textColor        = whiteColor
            
            print("Presented dark display mode on SettingsVc")
            
        default:
            sliderOutlet.minimumTrackTintColor = systemGrayColor
            sliderOutlet.maximumTrackTintColor = systemGray6Color
            
            self.view.backgroundColor = whiteColor
            segmentedControlLabel.selectedSegmentTintColor = whiteColor
            segmentedControlLabel.backgroundColor = systemGrayColor
            
            settingsLabel.textColor = blackColor
            smallA.textColor        = blackColor
            largeA.textColor        = blackColor
            
            print("Presented default light display mode")
        }
    }
}

