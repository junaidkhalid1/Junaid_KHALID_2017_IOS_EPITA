//
//  TableViewController.swift
//  Johnify
//
//  Created by Junaid KHALID on 16/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    // Declare variable for Default Image
    var imageDefault = "nrj.jpeg"
    
    // Declare constant for Table View Cell
    let cellIdentifiers = "TableViewController"
    
    // Declare variables for Images, Name, Category, Description and assigned values to them
    var img = ["chris.jpeg","soprano.jpeg","kendji.jpeg","gims.jpeg"]
    var singerName = ["Christophe Maé", "Soprano", "Kendji Girac", "Maître Gims"]
    var singerCategory = ["Pop Music", "Rap Music", "Pop Music", "Rock Music"]
    var singerDescription = ["Christophe Maé (born 16 October 1975 in Carpentras, Vaucluse) is a French pop singer.",
                             "Saïd M'Roumbaba (born 14 January 1979 in Marseille, France), better known by his stage name Soprano, is a French rapper of Comorian descent.",
                              "Kendji Girac (born Kendji Jason Maillié, July 3, 1996) is a French singer. He is the winner of the music competition The Voice: la plus belle voix ", "Gandhi Djuna (born 6 May 1986), better known by his stage name Maître Gims, is a French rapper and singer of Congolese descent."]
    
    // Table View decleration
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
    
    
    // This funtion is handling proptotpe cells: TableViewCell
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
    
    // Segue funtion to pass data to Detail View Controller
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == "detailSegue"
        {
            let detailViewController = ((segue.destinationViewController) as! DetailViewController)
            let indexPath = self.tvSingers!.indexPathForSelectedRow!
            let strImageSinger = img[indexPath.row]
            let strSingerName = singerName[indexPath.row]
            let strSingerCategory = singerCategory[indexPath.row]
            let strSingerDescription = singerDescription[indexPath.row]
            
            detailViewController.imageName = strImageSinger
            detailViewController.title = strImageSinger
            detailViewController.singerName = strSingerName
            detailViewController.singerCategory = strSingerCategory
            detailViewController.singerDescription = strSingerDescription
        }
    }
    
    // Unwind Segue funtion for addition of data in Table View coming from AddSingerViewController
    @IBAction func done(segue:UIStoryboardSegue) {
        
        let AddSingerVC = segue.sourceViewController as! AddSingerViewController
        let newSingerName = AddSingerVC.nameAdded
        let newSingerCategory = AddSingerVC.categoryAdded
        let newSingerDesscription = AddSingerVC.descriptionAdded
        
        img.append(imageDefault)
        singerName.append(newSingerName)
        singerCategory.append(newSingerCategory)
        singerDescription.append(newSingerDesscription)
        
        self.tableView.reloadData()
        
    }
    
    
}
