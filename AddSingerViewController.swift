//
//  AddSingerViewController.swift
//  Johnify
//
//  Created by Junaid KHALID on 18/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import UIKit

class AddSingerViewController: UIViewController {
    
    var nameAdded:String! = ""
    var categoryAdded:String! = ""
    var descriptionAdded:String! = ""

    @IBOutlet weak var tbSingerName: UITextField!
    @IBOutlet weak var tbSingerCategory: UITextField!
    @IBOutlet weak var tvSingerDescription: UITextView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvSingerDescription.layer.borderColor = UIColor( red: 0, green: 0, blue: 153/255, alpha: 1.0 ).CGColor
        tvSingerDescription.layer.borderWidth = 2.0

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
    
    override func shouldPerformSegueWithIdentifier(identifier: String,sender: AnyObject?) -> Bool {
        
        if tbSingerName.text?.isEmpty ?? true || tbSingerCategory.text?.isEmpty ?? true || tvSingerDescription.text?.isEmpty ?? true {

            return false
            
        } else{
            return true
        }
    }
    
    internal func formValidator () ->Void {
        
        if let text = tbSingerName.text where !text.isEmpty
        {
            tbSingerName.layer.borderColor = UIColor( red: 0, green: 153/255, blue: 0, alpha: 1.0 ).CGColor
            tbSingerName.layer.borderWidth = 2.0
        } else {
            tbSingerName.layer.borderColor = UIColor( red: 153/255, green: 0, blue: 0, alpha: 1.0 ).CGColor
            tbSingerName.layer.borderWidth = 2.0
        }
        
        if let text = tbSingerCategory.text where !text.isEmpty
        {
            tbSingerCategory.layer.borderColor = UIColor( red: 0, green: 153/255, blue: 0, alpha: 1.0 ).CGColor
            tbSingerCategory.layer.borderWidth = 2.0
        } else {
            tbSingerCategory.layer.borderColor = UIColor( red: 153/255, green: 0, blue: 0, alpha: 1.0 ).CGColor
            tbSingerCategory.layer.borderWidth = 2.0
        }
        
        if let text = tvSingerDescription.text where !text.isEmpty
        {
            tvSingerDescription.layer.borderColor = UIColor( red: 0, green: 153/255, blue: 0, alpha: 1.0 ).CGColor
            tvSingerDescription.layer.borderWidth = 2.0
        } else {
            tvSingerDescription.layer.borderColor = UIColor( red: 153/255, green: 0, blue: 0, alpha: 1.0 ).CGColor
            tvSingerDescription.layer.borderWidth = 2.0
        }
    }
    
    @IBAction func btnSaveSinger(sender: AnyObject) {
        
        formValidator()
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueDone") {
            nameAdded = tbSingerName.text
            categoryAdded = tbSingerCategory.text
            descriptionAdded = tvSingerDescription.text
        }
    }

    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
