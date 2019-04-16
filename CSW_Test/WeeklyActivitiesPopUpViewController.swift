//
//  WeeklyActivitiesPopUpViewController.swift
//  CSW_Test
//
//  Created by Mayanka Jha on 4/2/19.
//  Copyright © 2019 Mayanka Jha. All rights reserved.
//

import UIKit


var weeklyContentDict: [String : [String]] = ["1" : ["Check out 1-2 library books this week about what builders do and how they make houses and other buildings. As you read, ask questions that invite your child to share what he/she has learned.", "Take a walk around your home with your child and encourage him/her to find and draw its structural parts: door, window, wall, ceiling and floor.", "This weekend, walk around your neighborhood with your child. Talk about the different kinds of buildings you see and how they are the same and different."], "2": ["Go on a tool hunt around your home and show your child how each tool can be used: hammer pushes in a nail; screwdriver inserts a screw.", "Today, ask your child about the tool safety rules and why they're important.", "Take some time this weekend to visit a local hardware store with your child to find the different kinds of building tools."], "3" : ["Talk with your child today about where their class will be going on the field trip.", "Stand outside of a building with your child and look for familiar shapes: Can you find the square in the window? Or the rectangle in the door?", "This weekend, go on a walk around your neighborhood with your child to look for buildings under construction. What kinds of buildings are people building? What are they used for?"], "4": [ "Ask your child’s teacher for more information about simple machines or use this online resource to find some ideas or activities to do with your child: https://inventorsoftomorrow.com/2016/10/26/simple-machines-engineering-for-kids/.", "Go on a scavenger hunt for simple machines around your home. ", "Let's take the learning outside and go on a simple machine scavenger hunt! Thanks for helping your child learn about simple machines this week!"], "5": ["The class will be building a bird house to help birds who need shelter. Talk to your child about where birds live and where they can find shelter when it rains or snows. ", "Today, ask your child about building a birdhouse. Compare a familiar building to a birdhouse: What's the same? What's different?", "Today, ask your child about building a birdhouse. Compare a familiar building to a birdhouse: What's the same? What's different?"], "6": ["Check out some books about simple machines this week at the library and start reading them today.", "Talk with your child about what he/she has learned about planning and building. Use questions like: What do you remember about the We Are Builders project? What are buildings made of? How can we use tools safely?", "This weekend, build with your child using blocks, playdough, or other construction toys and take pictures as it's being made. We hope you enjoyed exploring all about building with your child. Next month, our study topic is...Spiders!"]]


class WeeklyActivitiesPopUpViewController: UIViewController {

    var week = String()
    //var access = WeAreBuildersViewController.self()
    //let week = access.weekSelected
    
    
    @IBOutlet weak var activity1Label: UILabel!
    @IBOutlet weak var activity2Label: UILabel!
    @IBOutlet weak var activity3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        //print("The week in this VC is")
        //print(week)
        
        //activity1Label.frame = CGRect(x: 10, y: 40, width: 100, height: 21)
        self.activity1Label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.activity1Label.numberOfLines = 0
        //print(weeklyContentDict[week]?[0] ?? "couldn't find the content")
        self.activity1Label.text = weeklyContentDict[week]?[0]
        
    
        self.activity2Label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.activity2Label.numberOfLines = 0
        self.activity2Label.text = weeklyContentDict[week]?[1]
        
        self.activity3Label.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.activity3Label.numberOfLines = 0
        self.activity3Label.text = weeklyContentDict[week]?[2]
        
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}

