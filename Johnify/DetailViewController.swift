//
//  DetailViewController.swift
//  Johnify
//
//  Created by Junaid KHALID on 16/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var imageName: String!
    var singerName: String!
    var singerCategory: String!
    @IBOutlet weak var imgDetailSinger: UIImageView!
    @IBOutlet weak var lblDetailName: UILabel!
    @IBOutlet weak var lblDetailCategory: UILabel!
    @IBOutlet weak var lblDetailDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.imgDetailSinger?.image = UIImage(named: "\(imageName)")
        self.lblDetailName?.text = singerName
        self.lblDetailCategory?.text = singerCategory

        // Do any additional setup after loading the view.
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
