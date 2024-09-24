//
//  ViewController.swift
//  3rd_hw_Kimminjun
//
//  Created by 김민준 on 9/21/24.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        view.backgroundColor = .black
    }

    func setTabbar(){
        let vc1 = UINavigationController(rootViewController: FirstViewController())
        let vc2 = UINavigationController(rootViewController: SecondViewController())
        let vc3 = UINavigationController(rootViewController: ThirdViewController())
        let vc4 = UINavigationController(rootViewController: ForthViewController())
        let vc5 = UINavigationController(rootViewController: FifthViewController())
        
        self.viewControllers = [vc1, vc2, vc3, vc4, vc5]
        self.tabBar.tintColor = .white
        self.tabBar.backgroundColor = #colorLiteral(red: 0.07058823854, green: 0.07058823854, blue: 0.07058823854, alpha: 1)
        
        
        guard let tabBarItems = self.tabBar.items else {return}
                tabBarItems[0].image = UIImage(named: "home")
                tabBarItems[1].image = UIImage(named: "search")
                tabBarItems[2].image = UIImage(named: "commingsoon")
                tabBarItems[3].image = UIImage(named: "download")
                tabBarItems[4].image = UIImage(named: "more")
                
                tabBarItems[0].title = "Home"
                tabBarItems[1].title = "Search"
                tabBarItems[2].title = "Comming Soon"
                tabBarItems[3].title = "Downloads"
                tabBarItems[4].title = "More"
        
        
        
    }
}

