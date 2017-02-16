//
//  TableViewController.swift
//  Johnify
//
//  Created by Junaid KHALID on 16/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellIdentifiers = "TableViewController"
    
    var img = ["chris.jpeg","soprano.jpeg","kendji.jpeg","gims.jpeg"]
    var singerName = ["Christophe Maé", "Soprano", "Kendji Girac", "Maître Gims"]
    var singerCategory = ["Pop", "Rap", "Pop", "Rock"]
    
    @IBOutlet var tvSingers: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.mainScreen().bounds.size.height>768
        {
            tvSingers?.rowHeight=100;
        }
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return img.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        var cell : TableViewCell! = tableView.dequeueReusableCellWithIdentifier("cell") as! TableViewCell
        if(cell == nil)
        {
            cell = NSBundle.mainBundle().loadNibNamed("cell", owner: self, options: nil)[0] as! TableViewCell;
        }
        let ivSinger = img[indexPath.row] as String
        let stringName = singerName[indexPath.row] as String //NOT NSString
        let strCategory = singerCategory[indexPath.row] as String
        
        cell.imgSinger.image = UIImage(named: ivSinger)
        cell.lblName.text=stringName
        cell.lblCategory.text=strCategory
        return cell as TableViewCell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "detailSegue"
        {
            let detailViewController = ((segue.destinationViewController) as! DetailViewController)
            let indexPath = self.tvSingers!.indexPathForSelectedRow!
            let strImageSinger = img[indexPath.row]
            let strSingerName = singerName[indexPath.row]
            let strSingerCategory = singerCategory[indexPath.row]
            detailViewController.imageName = strImageSinger
            detailViewController.title = strImageSinger
            detailViewController.singerName = strSingerName
            detailViewController.singerCategory = strSingerCategory
            
        }
    }
    
    
}
