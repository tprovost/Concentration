//
//  ThemeChooseController.swift
//  Concentration
//
//  Created by J Thomas Provost on 7/5/20.
//  Copyright © 2020 IAO. All rights reserved.
//

import UIKit

class ThemeChooseController: UITableViewController, UISplitViewControllerDelegate {

	
	private var selectedTheme:gameTheme? = nil
	
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
	
   private struct tableValues {
		   static let sectionSize = 10
	   }

	   override func numberOfSections(in tableView: UITableView) -> Int {
		   // #warning Incomplete implementation, return the number of sections
		   let sections: Int = possibleGameThemes.count / tableValues.sectionSize + 1
		   
		   return sections
	   }

	   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		   // #warning Incomplete implementation, return the number of rows
		   return possibleGameThemes.count
	   }

	  
	   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		   let cell = tableView.dequeueReusableCell(withIdentifier: "BasicChooseTheme", for: indexPath)

		   let theme = possibleGameThemes[indexPath.row]
	   
		   cell.textLabel!.text = " \(theme.emojiChoices.first!)  \(theme.themeName)"
   //        cell.textLabel!.textColor = theme.cardTextColor
   //        cell.backgroundView!.backgroundColor = theme.cardBackColor
		   return cell
	   }

   override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedTheme = possibleGameThemes[indexPath.row]
		performSegue(withIdentifier: "Choose Theme", sender: selectedTheme)
	
   }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "Choose Theme" {
			if let theme = sender as? gameTheme {
				if let cvc = segue.destination as? ConcentratonViewController {
					cvc.currentTheme = theme
				}
			}
		}
    }

}
