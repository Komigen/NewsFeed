import UIKit

let userDefaults = UserDefaults.standard

enum KeyForUserDefaults {
    static let font = "font"
    static let isLightTheme = "theme"
    static let slider = "slider"
}

//MARK: Settings and UserDefaults

final class SettingsVC: UIViewController {
    
    //MARK: General settings and constants for the application
    
    private var currentsSiderValue: Float?
    private var currentFontSize: CGFloat?
    private var isLightTheme: Bool?
    
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var largeA: UILabel!
    @IBOutlet weak var smallA: UILabel!
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateThemeUi()
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let senderValue = CGFloat(sender.value)
        fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName, size: senderValue)
        currentFontSize = senderValue
        currentsSiderValue = Float(senderValue)
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            isLightTheme = true
        } else if sender.selectedSegmentIndex == 1 {
            isLightTheme = false
        }
        if let safeIsLightTheme = isLightTheme {
            if safeIsLightTheme {
                settingsLabel.textColor = UIColor.blackCustom
                smallA.textColor = UIColor.blackCustom
                largeA.textColor = UIColor.blackCustom
                
                sliderOutlet.minimumTrackTintColor = UIColor.systemGrayCustom
                sliderOutlet.maximumTrackTintColor = UIColor.systemGray6Custom
                segmentedControlLabel.selectedSegmentTintColor = UIColor.whiteCustom
                segmentedControlLabel.backgroundColor = UIColor.systemGrayCustom
                self.view.backgroundColor = UIColor.whiteCustom
                
            } else {
                
                settingsLabel.textColor = UIColor.whiteCustom
                smallA.textColor = UIColor.whiteCustom
                largeA.textColor = UIColor.whiteCustom
                
                sliderOutlet.minimumTrackTintColor = UIColor.systemGray6Custom
                sliderOutlet.maximumTrackTintColor = UIColor.darkGrayCustom
                segmentedControlLabel.selectedSegmentTintColor = UIColor.darkGrayCustom
                segmentedControlLabel.backgroundColor = UIColor.systemGray6Custom
                self.view.backgroundColor = UIColor.blackCustom
            }
        }
    }
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        
        if let _ = currentFontSize{
            userDefaults.set(currentFontSize, forKey: KeyForUserDefaults.font)
        }
        
        if let _ = currentsSiderValue {
            userDefaults.set(currentsSiderValue, forKey: KeyForUserDefaults.slider)
        }
        
        if let _ = isLightTheme {
            userDefaults.set(isLightTheme, forKey: KeyForUserDefaults.isLightTheme)
        }
        self.dismiss(animated: true)
    }
    
    //MARK: Ui settings before display
    
    private func updateThemeUi() {
        
        fontSizeLabel.font.withSize(userDefaults.object(forKey: KeyForUserDefaults.font) as? CGFloat ?? 19.0)
        
        sliderOutlet.value = ((userDefaults.object(forKey: KeyForUserDefaults.slider) as? Float) ?? sliderOutlet.value)
        
        isLightTheme = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool ?? true
        
        let savedAnswer = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool
        if let safeAnswer = savedAnswer {
            if safeAnswer {
                segmentedControlLabel.selectedSegmentIndex = 0
                
                sliderOutlet.minimumTrackTintColor = UIColor.systemGrayCustom
                sliderOutlet.maximumTrackTintColor = UIColor.systemGray6Custom
                
                self.view.backgroundColor = UIColor.whiteCustom
                segmentedControlLabel.selectedSegmentTintColor = UIColor.whiteCustom
                segmentedControlLabel.backgroundColor = UIColor.systemGrayCustom
                
                settingsLabel.textColor = UIColor.blackCustom
                smallA.textColor = UIColor.blackCustom
                largeA.textColor = UIColor.blackCustom
                
                self.navigationController?.navigationBar.barTintColor = UIColor.whiteCustom
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blackCustom]
                self.tabBarController?.tabBar.barTintColor = UIColor.whiteCustom
                print("Presented light display mode on SettingsVc")
            } else {
                segmentedControlLabel.selectedSegmentIndex = 1
                
                sliderOutlet.minimumTrackTintColor = UIColor.systemGray6Custom
                sliderOutlet.maximumTrackTintColor = UIColor.darkGrayCustom
                
                self.view.backgroundColor = UIColor.blackCustom
                segmentedControlLabel.selectedSegmentTintColor = UIColor.darkGrayCustom
                segmentedControlLabel.backgroundColor = UIColor.systemGray6Custom
                
                settingsLabel.textColor = UIColor.whiteCustom
                smallA.textColor = UIColor.whiteCustom
                largeA.textColor = UIColor.whiteCustom
                
                self.navigationController?.navigationBar.barTintColor = UIColor.blackCustom
                self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.whiteCustom]
                self.tabBarController?.tabBar.barTintColor = UIColor.blackCustom
                print("Presented dark display mode on SettingsVc")
            }
        }
    }
}


extension NSNotification.Name {
    static let savedSettings = NSNotification.Name.init(rawValue: "savedSettings")
}
