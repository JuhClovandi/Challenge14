//
//  ViewController.swift
//  Challenge14
//
//  Created by Júlia Clovandi Vasconcelos  on 13/05/26.
//

import UIKit

class YourLibraryViewController: UIViewController {
	
	// main
	@IBOutlet weak var scrollView: UIScrollView!
	@IBOutlet weak var tabStack: UIStackView!
	@IBOutlet weak var contentView: UIView!
	@IBOutlet weak var stackView: UIStackView!
	
	//images
	@IBOutlet weak var profileImage: UIImageView!
	@IBOutlet weak var plusButton: UIImageView!
	
	@IBOutlet weak var arrowIcon: UIImageView!
	@IBOutlet weak var gridIcon: UIImageView!
	
	@IBOutlet weak var rowImg1: UIImageView!
	@IBOutlet weak var rowImg2: UIImageView!
	@IBOutlet weak var rowImg3: UIImageView!
	@IBOutlet weak var rowImg4: UIImageView!
	@IBOutlet weak var rowImg5: UIImageView!
	@IBOutlet weak var rowImg6: UIImageView!
	@IBOutlet weak var rowImg7: UIImageView!
	
	@IBOutlet weak var homeImg: UIImageView!
	@IBOutlet weak var searchImg: UIImageView!
	@IBOutlet weak var libraryImg: UIImageView!
	
	// buttons
	@IBOutlet weak var playlistsButton: UIButton!
	@IBOutlet weak var artistsButton: UIButton!
	@IBOutlet weak var albumButton: UIButton!
	@IBOutlet weak var podcastsButton: UIButton!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
}
