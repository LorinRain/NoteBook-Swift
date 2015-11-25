//
//  HomeController.swift
//  NoteBook-Swift
//
//  Created by Lorin on 15/11/24.
//  Copyright © 2015年 LorinRain. All rights reserved.
//

import UIKit

class HomeController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // set nav bar
        self.setNavBar()
        // set table
        self.setTables()
        
    }
    
    // MARK: set navigationBar
    func setNavBar() {
        // background image
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "nav_bg"), forBarMetrics: .Default)
        // textcolor
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        // back barbutton
        let barButtonItem = UIBarButtonItem.appearance()
        let backButtonImage = UIImage(named: "back_button.png")?.resizableImageWithCapInsets(UIEdgeInsetsMake(0, 0, 0, 0), resizingMode: .Stretch)
        barButtonItem.setBackButtonBackgroundImage(backButtonImage, forState: .Normal, barMetrics: .Default)
        // do not show back text in navbar
        barButtonItem.setBackButtonTitlePositionAdjustment(UIOffsetMake(CGFloat(NSIntegerMax), CGFloat(NSIntegerMax)), forBarMetrics: .Default)
        // title
        self.title = "便签"
        // add button at right side
        let newNoteBtn = UIButton(type: .Custom)
        newNoteBtn.setBackgroundImage(UIImage(named: "button_bg.png"), forState: .Normal)
        newNoteBtn.setImage(UIImage(named: "new_note_icon.png"), forState: .Normal)
        newNoteBtn.bounds = CGRectMake(0, 0, 48, 40)
        newNoteBtn.addTarget(self, action: "newNoteButtonAction", forControlEvents: .TouchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: newNoteBtn)
    }
    
    // MARK: set Table
    func setTables() {
        // set background image
        let bgImageView = UIImageView(image: UIImage(named: "home_bg.png"))
        bgImageView.frame = UIScreen.mainScreen().bounds
        bgImageView.userInteractionEnabled = true
        
        self.tableView.backgroundView = bgImageView
        self.tableView.backgroundColor = UIColor.clearColor()
        // hide Separator Line
        self.tableView.separatorStyle = .None
        // hide VerticalScrollIndicator
        self.tableView.showsVerticalScrollIndicator = false
    }
    
    // MARK: newNote Button Action
    func newNoteButtonAction() {
        print("hahahah")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableView DataSource & Delegate
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifie = "homeCell"
        
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifie)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: cellIdentifie)
        }
        
        //cell?.setItem(forcastData[indexPath.row])
        
        return cell!
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
