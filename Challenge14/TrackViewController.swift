//
//  TrackViewController.swift
//  Challenge14
//
//  Created by Keitiely Silva Viana on 14/05/26.
//

import UIKit

class TrackViewController: UIViewController {
    
    private let trackViwe = TrackView()
    
    override func loadView() {
        self.view = trackViwe
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
