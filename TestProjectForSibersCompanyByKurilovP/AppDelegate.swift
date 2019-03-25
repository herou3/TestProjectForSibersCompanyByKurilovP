//
//  AppDelegate.swift
//  TestProjectForSibersCompanyByKurilovP
//
//  Created by Pavel Kurilov on 22.03.2019.
//  Copyright © 2019 Pavel Kurilov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coordinator: CharactersListCoordinator!

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        self.window?.rootViewController = UINavigationController(nibName: nil, bundle: nil)
        guard let navigationController = window?.rootViewController as? UINavigationController else { return true }
        coordinator = CharactersListCoordinator(navigationController: navigationController)
        coordinator.start()
//        let charactersListViewModel: CharactersListViewModel = CharactersListViewModel()
//        charactersListViewModel.filterContentBySearchText("Rick")
        
//        let char = CharacterDetailViewModel(character: Character(id: 12, name: "test", status: "dgsd", species: "gdsg", type: "gdsdg", gender: "zgsdg", origin: Origin(name: "gdsg", url: "sdg"), location: Location(name: "gsd", url: "gdsg"), image: "gsdg", episodes: ["sdf"], url: "sdgsdg", created: "sgsdg"))
//        char.loadInformationCharacter(use: 12)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {    }

    func applicationDidEnterBackground(_ application: UIApplication) {  }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) {

    }
}
