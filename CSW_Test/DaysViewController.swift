//
//  DaysViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 4/16/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit

class DaysViewController: UIViewController {

    var day1Button = dropDownBtn()
    var day2Button = dropDownBtn()
    var day3Button = dropDownBtn()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        day1Button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        day1Button.setTitle("Day 1", for: .normal)
        day1Button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(day1Button)
        day1Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //day1Button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        day1Button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 385.0).isActive = true
        day1Button.widthAnchor.constraint(equalToConstant: 290).isActive = true
        day1Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        day1Button.dropView.dropDownOptions = ["Monday", "Tuesday"]
        
        day2Button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        day2Button.setTitle("Day 2", for: .normal)
        day2Button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(day2Button)
        day2Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //day1Button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        day2Button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 440.0).isActive = true
        day2Button.widthAnchor.constraint(equalToConstant: 290).isActive = true
        day2Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        day2Button.dropView.dropDownOptions = ["Wednesday", "Thursday"]
        
        day3Button = dropDownBtn.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        day3Button.setTitle("Day 3", for: .normal)
        day3Button.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(day3Button)
        day3Button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //day1Button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        day3Button.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 495.0).isActive = true
        day3Button.widthAnchor.constraint(equalToConstant: 290).isActive = true
        day3Button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        day3Button.dropView.dropDownOptions = ["Friday", "Saturday"]
    }

}

protocol dropDownProtocol {
    func dropDownPressed(string: String)
}

class dropDownBtn: UIButton, dropDownProtocol {
    func dropDownPressed(string : String) {
        self.setTitle(string, for: .normal)
        self.dismissDropDown()
    }
    
    var dropView = dropDownView()
    
    var height = NSLayoutConstraint()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
        //(displayP3Red: 21/255, green: 172/255, blue: 152/255, alpha: 1)
        
        dropView = dropDownView.init(frame: CGRect.init(x: 0, y: 0, width: 0, height: 0))
        dropView.delegate = self
        dropView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    override func didMoveToSuperview() {
        self.superview?.addSubview(dropView)
        self.superview?.bringSubviewToFront(dropView)
        
        dropView.topAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        dropView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        dropView.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        height = dropView.heightAnchor.constraint(equalToConstant: 0)
    }
    
    var isOpen = false
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isOpen == false {
            
            isOpen = true
            
            NSLayoutConstraint.deactivate([self.height])
            if self.dropView.tableView.contentSize.height > 150 {
                self.height.constant = 150
            } else {
                self.height.constant = self.dropView.tableView.contentSize.height
            }
            
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.dropView.layoutIfNeeded()
                self.dropView.center.y += self.dropView.frame.height / 2
            }, completion: nil)
            
            
        } else {
            isOpen = false
            
            NSLayoutConstraint.deactivate([self.height])
            self.height.constant = 0
            NSLayoutConstraint.activate([self.height])
            
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
                self.dropView.center.y -= self.dropView.frame.height / 2
                self.dropView.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    func dismissDropDown() {
        isOpen = false
        
        NSLayoutConstraint.deactivate([self.height])
        self.height.constant = 0
        NSLayoutConstraint.activate([self.height])
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.dropView.center.y -= self.dropView.frame.height / 2
            self.dropView.layoutIfNeeded()
        }, completion: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}




class dropDownView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var dropDownOptions = [String]()
    
    var tableView = UITableView()
    
    var delegate: dropDownProtocol!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tableView.backgroundColor = UIColor.darkGray
        self.backgroundColor = UIColor.darkGray
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row ]
        cell.backgroundColor = UIColor.darkGray
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate.dropDownPressed(string: dropDownOptions[indexPath.row])
        self.tableView.deselectRow(at: indexPath, animated: true)
        //print(dropDownOptions[indexPath.row])
    }
}
