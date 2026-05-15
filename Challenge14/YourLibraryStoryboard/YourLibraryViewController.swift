//
//  ViewController.swift
//  Challenge14
//
//  Created by Júlia Clovandi Vasconcelos  on 13/05/26.
//

import UIKit

class YourLibraryViewController: UIViewController {
	private let header = UIStackView()
	private let content = UIStackView()
	private let tabBar = UIStackView()

	@IBOutlet weak var profile: UIImageView!
	@IBOutlet weak var yourLibrary: UILabel!
	@IBOutlet weak var plus: UIImageView!
	
	@IBOutlet weak var playlistsFilter: UIButton!
	@IBOutlet weak var artistsFilter: UIButton!
	@IBOutlet weak var albumFilter: UIButton!
	@IBOutlet weak var podcastFilter: UIButton!
	
	@IBOutlet weak var arrow: UIImageView!
	@IBOutlet weak var recently: UILabel!
	@IBOutlet weak var twoTwo: UIImageView!
	
	@IBOutlet weak var image1: UIImageView!
	@IBOutlet weak var likedSongs: UILabel!
	@IBOutlet weak var likedSongs2: UILabel!
	
	@IBOutlet weak var image2: UIImageView!
	@IBOutlet weak var newEpisodes: UILabel!
	@IBOutlet weak var newEpisodes2: UILabel!
	
	@IBOutlet weak var image3: UIImageView!
	@IBOutlet weak var loloZ: UILabel!
	@IBOutlet weak var loloZ2: UILabel!
	
	@IBOutlet weak var image4: UIImageView!
	@IBOutlet weak var lanaD: UILabel!
	@IBOutlet weak var lanaD2: UILabel!
	
	@IBOutlet weak var image5: UIImageView!
	@IBOutlet weak var front: UILabel!
	@IBOutlet weak var front2: UILabel!
	
	@IBOutlet weak var image6: UIImageView!
	@IBOutlet weak var marvin: UILabel!
	@IBOutlet weak var marvin2: UILabel!
	
	@IBOutlet weak var image7: UIImageView!
	@IBOutlet weak var les: UILabel!
	@IBOutlet weak var les2: UILabel!
	
	@IBOutlet weak var home: UIImageView!
	@IBOutlet weak var homeLabel: UILabel!
	@IBOutlet weak var search: UIImageView!
	@IBOutlet weak var searchLabel: UILabel!
	@IBOutlet weak var library: UIImageView!
	@IBOutlet weak var libraryLabel: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

