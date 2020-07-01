//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by J Thomas Provost on 6/29/20.
//  Copyright © 2020 IAO. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController, UISplitViewControllerDelegate {

//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }
//
	
	override func awakeFromNib() {
		splitViewController?.delegate = self
		
	}
	
	func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
		if let cvc = secondaryViewController as? ConcentratonViewController {
			if cvc.currentTheme == nil {
				return true
			}
		}
		return false
	}
//  TODO:  Find better method for assigning theme based on button other than button title
	
	@IBAction func themeChooser(_ sender: UIButton) {
		// see if a split view of the game exists and just change the theme rather than reset the game
//		if let cvc = splitViewConcentrationViewController {
//			if let themeName = sender.currentTitle {
//				if let theme = possibleGameThemes.first(where: {$0.themeName == themeName}) {
//					cvc.currentTheme = theme
//				}
//			}
//		} else {
			performSegue(withIdentifier: "Choose Theme", sender: sender)
//		}
	}
		
	private var splitViewConcentrationViewController : ConcentratonViewController? {
		return splitViewController?.viewControllers.last as? ConcentratonViewController
	}
	
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "Choose Theme" {
			if let themeName = (sender as? UIButton)?.currentTitle {
				if let theme = possibleGameThemes.first(where: {$0.themeName == themeName}) {
					if let cvc = segue.destination as? ConcentratonViewController {
						cvc.currentTheme = theme
					}
				}
			}
		}
    }

}
