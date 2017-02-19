//
//  DetailViewController.swift
//  Johnify
//
//  Created by Junaid KHALID on 16/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    // Variables to hold values coming from TableViewController function "prepareForSegue"
    var imageName: String!
    var singerName: String!
    var singerCategory: String!
    var singerDescription: String!
    
    @IBOutlet weak var imgDetailSinger: UIImageView!
    @IBOutlet weak var lblDetailName: UILabel!
    @IBOutlet weak var lblDetailCategory: UILabel!
    @IBOutlet weak var txtViewDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgDetailSinger?.image = UIImage(named: "\(imageName)")
        self.lblDetailName?.text = singerName
        self.lblDetailCategory?.text = singerCategory
        self.txtViewDescription?.text = singerDescription

        // Do any additional setup after loading the view.
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Back button implementation
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
