//
//  WeAreBuildersViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 4/2/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit

class WeAreBuildersViewController: UIViewController {
    
    var weekSelected:String = ""

    @IBOutlet weak var weekSelectorDropDown: RoundButton!
    @IBOutlet weak var weekTableView: UITableView!
    
    var weekList = ["1", "2", "3", "4", "5", "6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        weekTableView.isHidden = true
    }
    
    @IBAction func weekDropDownPressed(_ sender: Any) {
        if weekTableView.isHidden {
            animate(toggle: true)
        } else {
            animate(toggle: false)
        }
    }
    
    func animate(toggle:Bool) {
        
        if toggle {
            UIView.animate(withDuration: 0.3) {
                self.weekTableView.isHidden = false
            }
        } else{
            UIView.animate(withDuration: 0.3) {
                self.weekTableView.isHidden = true
            }
        }
    }
    @IBAction func showActivitiesPressed(_ sender: Any) {
        performSegue(withIdentifier: "projectToActivitySegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nav = segue.destination as? UINavigationController
        let popupVC = nav?.topViewController as? WeeklyActivitiesPopUpViewController
        //var popupVC = segue?.destination as! WeeklyActivitiesPopUpViewController
        popupVC?.week = weekSelectorDropDown.title(for: .normal)!
    }
    
}

extension WeAreBuildersViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weekList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = weekList[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        weekSelectorDropDown.setTitle("\(weekList[indexPath.row])", for: .normal)
        animate(toggle: false)
    }
    
    
}
