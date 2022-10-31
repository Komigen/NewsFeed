import UIKit

let userDefaults = UserDefaults.standard

enum KeyForUserDefaults {
    static let slider = "slider"
    static let isLightTheme = "isLightTheme"
}

//MARK: Settings and UserDefaults

final class SettingsVC: UIViewController {
    
    //MARK: General settings and constants for the application
    
    private var currentsSiderValue: Float?
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateThemeUi()
    }
    
    @IBAction func fontSizeSlider(_ sender: UISlider) {
        let senderValue = CGFloat(sender.value)
        fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName, size: senderValue)
        currentsSiderValue = Float(senderValue)
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }?.overrideUserInterfaceStyle = .light

            isLightTheme = true
            
        } else {
            
            UIApplication
                .shared
                .connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }?.overrideUserInterfaceStyle = .dark
            
            isLightTheme = false
        }
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        
        if let _ = currentsSiderValue {
            userDefaults.set(currentsSiderValue, forKey: KeyForUserDefaults.slider)
        }
        
        if let _ = isLightTheme {
            userDefaults.set(isLightTheme, forKey: KeyForUserDefaults.isLightTheme)
        }
        navigationController?.popViewController(animated: true)
        self.dismiss(animated: true)
    }
    
    //MARK: Ui settings before display
    
    private func updateThemeUi() {
        
        sliderOutlet.value = ((userDefaults.object(forKey: KeyForUserDefaults.slider) as? Float) ?? sliderOutlet.value)
        fontSizeLabel.font = UIFont(name: fontSizeLabel.font.fontName, size: CGFloat(sliderOutlet.value))
        
        segmentedControlLabel.selectedSegmentIndex = {
            let theme = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool ?? true
            if theme {
                return 0
            } else {
                return 1
            }
        }()
    }
}
