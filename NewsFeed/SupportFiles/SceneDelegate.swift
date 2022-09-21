//
//  SceneDelegate.swift
//  NewsFeed
//
//  Created by Konstantin on 01.09.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let _ = (scene as? UIWindowScene) else { return }
//        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
//        window?.windowScene = windowScene
//
//        window?.rootViewController = createTabBar()
//        window?.makeKeyAndVisible()
    }

    
//    func createTabBar() -> UITabBarController {
//        let tabBar = UITabBarController()
//        UITabBar.appearance().tintColor = .darkGray
//        UITabBar.setTransparentTabBar()
//        tabBar.viewControllers = [createFirstVc(), createReadVc(), createReadLaterVc(), createRateVc()]
//
//        return tabBar
//    }
//
//    func createFirstVc() -> FirstVC {
//        let viewController = FirstVC()
//        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 0)
//
//        return viewController
//    }
//
//    func createReadVc() -> ReadVC {
//        let viewController = ReadVC()
//        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 1)
//
//        return viewController
//    }
//
//    func createReadLaterVc() -> ReadLaterVC {
//        let viewController = ReadLaterVC()
//        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 2)
//
//        return viewController
//    }
//
//    func createRateVc() -> RateVC {
//        let viewController = RateVC()
//        viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .featured, tag: 3)
//
//        return viewController
//    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

extension UITabBar {

    static func setTransparentTabBar() {
        UITabBar.appearance().backgroundImage = UIImage()
        UITabBar.appearance().shadowImage = UIImage()
        UITabBar.appearance().clipsToBounds = true
    }
}
