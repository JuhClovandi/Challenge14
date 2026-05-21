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
	@IBOutlet weak var filterStack: UIStackView!
	
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
	
	// constraints created by code
	private var rowImageConstraints: [NSLayoutConstraint] = []
	private var tabIconConstraints: [NSLayoutConstraint] = []
	private var smallIconConstraints: [NSLayoutConstraint] = []
	private var profileImageConstraints: [NSLayoutConstraint] = []
	private var filterStackConstraints: [NSLayoutConstraint] = []
	private var buttonHeightConstraints: [NSLayoutConstraint] = []
	
	private var rowImages: [UIImageView] {
		[rowImg1, rowImg2, rowImg3, rowImg4, rowImg5, rowImg6, rowImg7]
	}
	
	private var tabIcons: [UIImageView] {
		[homeImg, searchImg, libraryImg]
	}
	
	private var smallIcons: [UIImageView] {
		[plusButton, arrowIcon, gridIcon]
	}
	
	private var circularImages: [UIImageView] {
		[profileImage, rowImg3, rowImg4, rowImg6]
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureImages()
		createSizeConstraints()
		applyDeviceSizes()
		
		// Observar mudanças de Dynamic Type
		NotificationCenter.default.addObserver(
			self,
			selector: #selector(contentSizeCategoryDidChange),
			name: UIContentSizeCategory.didChangeNotification,
			object: nil
		)
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
	override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
		super.traitCollectionDidChange(previousTraitCollection)
		
		// Chamado quando muda de dispositivo (orientação, iPad vs iPhone)
		if previousTraitCollection?.userInterfaceIdiom != traitCollection.userInterfaceIdiom {
			applyDeviceSizes()
		}
	}
	
	@objc private func contentSizeCategoryDidChange() {
		// Chamado quando muda o Dynamic Type
		applyDeviceSizes()
	}
	
	// Images
	private func configureImages() {
		
		profileImage.contentMode = .scaleAspectFill
		profileImage.clipsToBounds = true
		rowImages.forEach { imageView in
			imageView.contentMode = .scaleAspectFill
			imageView.clipsToBounds = true
		}
	}
	
	private func configureSymbolImageView(
		_ imageView: UIImageView,
		configuration: UIImage.SymbolConfiguration,
		color: UIColor
		
	) {
		
		imageView.preferredSymbolConfiguration = configuration
		imageView.tintColor = color
		imageView.contentMode = .scaleAspectFit
		imageView.isAccessibilityElement = false
		
	}

	// constraits
	private func createSizeConstraints() {
		
		rowImages.forEach { imageView in
			imageView.translatesAutoresizingMaskIntoConstraints = false
			
			let width = imageView.widthAnchor.constraint(equalToConstant: 64)
			let height = imageView.heightAnchor.constraint(equalToConstant: 64)
			
			NSLayoutConstraint.activate([width, height])
			rowImageConstraints.append(contentsOf: [width, height])
			
		}
		
		tabIcons.forEach { imageView in
			imageView.translatesAutoresizingMaskIntoConstraints = false
			
			let width = imageView.widthAnchor.constraint(equalToConstant: 28)
			let height = imageView.heightAnchor.constraint(equalToConstant: 28)
			
			NSLayoutConstraint.activate([width, height])
			tabIconConstraints.append(contentsOf: [width, height])
		}
		
		
		
		smallIcons.forEach { imageView in
			imageView.translatesAutoresizingMaskIntoConstraints = false

			let width = imageView.widthAnchor.constraint(equalToConstant: 20)
			let height = imageView.heightAnchor.constraint(equalToConstant: 20)
			
			NSLayoutConstraint.activate([width, height])
			smallIconConstraints.append(contentsOf: [width, height])
			
		}
		
		profileImage.translatesAutoresizingMaskIntoConstraints = false
		
		let profileWidth = profileImage.widthAnchor.constraint(equalToConstant: 32)
		let profileHeight = profileImage.heightAnchor.constraint(equalToConstant: 32)
		
		NSLayoutConstraint.activate([profileWidth, profileHeight])
		profileImageConstraints.append(contentsOf: [profileWidth, profileHeight])
		
		filterStack.translatesAutoresizingMaskIntoConstraints = false
		
		let filterStackWidth = filterStack.widthAnchor.constraint(equalToConstant: 40)
		let filterStackHeight = filterStack.heightAnchor.constraint(equalToConstant: 50)
		
		NSLayoutConstraint.activate([filterStackWidth, filterStackHeight])
		filterStackConstraints.append(contentsOf: [filterStackWidth, filterStackHeight])
		
		// Configurar constraints dos buttons
		let buttons = [playlistsButton, artistsButton, albumButton, podcastsButton]
		buttons.forEach { button in
			if let button = button {
				button.translatesAutoresizingMaskIntoConstraints = false
				let heightConstraint = button.heightAnchor.constraint(equalToConstant: 40)
				NSLayoutConstraint.activate([heightConstraint])
				buttonHeightConstraints.append(heightConstraint)
			}
		}
		
	}
	
	// Device Sizes and Dynamic Type
	private func applyDeviceSizes() {
		let isIpad = traitCollection.userInterfaceIdiom == .pad
		
		var rowImageSize: CGFloat = isIpad ? 74 : 64
		var tabIconSize: CGFloat = isIpad ? 38 : 28
		var smallIconSize: CGFloat = isIpad ? 30 : 20
		var profileSize: CGFloat = isIpad ? 42 : 32
		
		let sizeMultiplier = getSizeMultiplier()
		
		rowImageSize *= sizeMultiplier
		tabIconSize *= sizeMultiplier
		smallIconSize *= sizeMultiplier
		profileSize *= sizeMultiplier
		
		// Atualizar constraints
		rowImageConstraints.forEach { $0.constant = rowImageSize }
		tabIconConstraints.forEach { $0.constant = tabIconSize }
		smallIconConstraints.forEach { $0.constant = smallIconSize }
		profileImageConstraints.forEach { $0.constant = profileSize }
		
		if let filterStack = filterStack {
			let spacingValue: CGFloat = isIpad ? 12 : 8
			filterStack.spacing = spacingValue * sizeMultiplier
		}
		
	}
	
	private func getSizeMultiplier() -> CGFloat {
		let category = traitCollection.preferredContentSizeCategory
		
		switch category {
		case .extraSmall:
			return 0.95
		case .small:
			return 0.95
		case .medium:
			return 0.95
		case .large:
			return 1.0
		case .extraLarge:
			return 1.15
		case .extraExtraLarge:
			return 1.30
		case .extraExtraExtraLarge:
			return 1.45
		case .accessibilityMedium:
			return 1.60
		case .accessibilityLarge:
			return 1.70
		case .accessibilityExtraLarge:
			return 1.70
		case .accessibilityExtraExtraLarge:
			return 1.70
		case .accessibilityExtraExtraExtraLarge:
			return 1.70
		default:
			return 1.0
		}
	}
}

