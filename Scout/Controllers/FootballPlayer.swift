//
//  AddFootballPlayer.swift
//  Scout
//
//  Created by Stefan Olaru on 10/09/2017.
//  Copyright © 2017 Stefan Olaru. All rights reserved.
//

import Foundation
import UIKit


class FootballPlayer: UIViewController {
    
    @IBOutlet weak var infoView: UIView!
    // MARK: - Lifecycle Methods -
    
    @IBOutlet weak var appearanceView: UIView!
    
    @IBOutlet weak var skillsView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        customizeForFirstAppearance()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    
    func customizeForFirstAppearance() {
        view.backgroundColor = UIColor.FlatColor.Gray.WhiteSmoke
        navigationController?.navigationBar.isHidden = false
        title = "Scout Player"
        navigationController?.navigationBar.transparentNavigationBar()
        infoView.backgroundColor = UIColor.FlatColor.Green.MountainMeadow
        appearanceView.backgroundColor = UIColor.FlatColor.Yellow.Energy
        skillsView.backgroundColor = UIColor.FlatColor.Red.TerraCotta
    }
    
  
}
