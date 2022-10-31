import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let _ = (scene as? UIWindowScene) else { return }
        
        let theme = userDefaults.object(forKey: KeyForUserDefaults.isLightTheme) as? Bool ?? true
        if theme {
            self.window?.overrideUserInterfaceStyle = .light
        } else {
            self.window?.overrideUserInterfaceStyle = .dark
        }
    }
}

