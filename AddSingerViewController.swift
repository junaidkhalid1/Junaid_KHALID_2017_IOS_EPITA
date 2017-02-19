//
//  AddSingerViewController.swift
//  Johnify
//
//  Created by Junaid KHALID on 18/02/17.
//  Copyright © 2017 Epita. All rights reserved.
//

import UIKit

class AddSingerViewController: UIViewController {
    
    // Variables to hold new singer name, category and description
    var nameAdded:String! = ""
    var categoryAdded:String! = ""
    var descriptionAdded:String! = ""

    @IBOutlet weak var tbSingerName: UITextField!
    @IBOutlet weak var tbSingerCategory: UITextField!
    @IBOutlet weak var tvSingerDescription: UITextView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Drawing borderline for multiline textbox which is textView
        tvSingerDescription.layer.borderColor = UIColor( red: 197/255, green: 198/255, blue: 201/255, alpha: 1.0 ).CGColor
        tvSingerDescription.layer.borderWidth = 2.0

        // Do any additional setup after loading the view.  	197, 198, 201
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
    
    // This function triggers segue only and only if form fields are not empty and does not contain any special characters
    override func shouldPerformSegueWithIdentifier(identifier: String,sender: AnyObject?) -> Bool {
        
        if tbSingerName.text?.isEmpty ?? true || tbSingerCategory.text?.isEmpty ?? true || tvSingerDescription.text?.isEmpty ?? true  {
            print("false")
            return false
        } else{
            if speacialChars() ?? true {
                print("true")
                return true
            } else {
                print("false")
                return false
            }
        }
    }
    
    // This funtion is handling specail characters
    internal func speacialChars () -> Bool {
        
        let name = tbSingerName.text ?? ""
        let cat = tbSingerCategory.text ?? ""
        let desc = tvSingerDescription.text ?? ""
        
        let characterset = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        if name.rangeOfCharacterFromSet(characterset.invertedSet) == nil && cat.rangeOfCharacterFromSet(characterset.invertedSet) == nil && desc.rangeOfCharacterFromSet(characterset.invertedSet) == nil {
            return true
        } else {
            return false
        }
    }
    
    /*
    // This function is changing fields border colors
    // If fields are empty and contain any special characters fields border color will turn into red
    // If fields are not empty and does not contain any special character fields boreder color will turn into green
    */
    internal func formValidator () ->Void {
        
        let characterset = NSCharacterSet(charactersInString: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ0123456789")
        
        if let text = tbSingerName.text where !text.isEmpty && text.rangeOfCharacterFromSet(characterset.invertedSet) == nil
        {
            tbSingerName.layer.borderColor = UIColor( red: 0, green: 153/255, blue: 0, alpha: 1.0 ).CGColor
            tbSingerName.layer.borderWidth = 2.0
        } else {
            tbSingerName.layer.borderColor = UIColor( red: 153/255, green: 0, blue: 0, alpha: 1.0 ).CGColor
            tbSingerName.layer.borderWidth = 2.0
        }
        
        if let text = tbSingerCategory.text where !text.isEmpty && text.rangeOfCharacterFromSet(characterset.invertedSet) == nil
        {
            tbSingerCategory.layer.borderColor = UIColor( red: 0, green: 153/255, blue: 0, alpha: 1.0 ).CGColor
            tbSingerCategory.layer.borderWidth = 2.0
        } else {
            tbSingerCategory.layer.borderColor = UIColor( red: 153/255, green: 0, blue: 0, alpha: 1.0 ).CGColor
            tbSingerCategory.layer.borderWidth = 2.0
        }
        
        if let text = tvSingerDescription.text where !text.isEmpty && text.rangeOfCharacterFromSet(characterset.invertedSet) == nil
        {
            tvSingerDescription.layer.borderColor = UIColor( red: 0, green: 153/255, blue: 0, alpha: 1.0 ).CGColor
            tvSingerDescription.layer.borderWidth = 2.0
        } else {
            tvSingerDescription.layer.borderColor = UIColor( red: 153/255, green: 0, blue: 0, alpha: 1.0 ).CGColor
            tvSingerDescription.layer.borderWidth = 2.0
        }
    }
    
    // Save button action is invloking fuction "formValidator"
    @IBAction func btnSaveSinger(sender: AnyObject) {
        
        formValidator()
        
    }
    
    // This function is passing new data to table view using segue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "segueDone") {
            nameAdded = tbSingerName.text
            categoryAdded = tbSingerCategory.text
            descriptionAdded = tvSingerDescription.text
        }
    }

    // Back button implementation
    @IBAction func btnBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
