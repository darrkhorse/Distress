//
//  CreateDistressVC.swift
//  Distress_JohannHinck
//
//  Created by Hinck, Johann A on 12/6/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import UIKit
import Parse

class CreateDistressVC: UIViewController
{

    @IBOutlet weak var theSpinner: UIActivityIndicatorView!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var phoneTF: UITextField!
    @IBOutlet weak var messageTF: UITextField!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.nameTF.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }

    @IBAction func createButtonPressed(sender: AnyObject)
    {
        var message = ""
        
        if(self.nameTF.text!.characters.count == 0)
        {
            message = "You must enter a username"
        }
        else if(self.phoneTF.text!.characters.count == 0)
        {
            message = "You must enter a password"
        }
        else if(self.messageTF.text!.characters.count == 0)
        {
            message = "You must confirm the password"
        }
       
        if(message.characters.count != 0)
        {
            //there was a problem
            DistressCore.showAlert("Register Error", message: message, presentingViewController: self, onScreenDelay: 2)
        }
        
        else
        {
            //upload message to Pase
            let mssg = PFObject(className:"messageData")
            mssg["name"] = self.nameTF.text
            mssg["phone"] = self.phoneTF.text
            mssg["message"] = self.messageTF.text
            self.theSpinner.startAnimating()
            mssg.saveInBackgroundWithBlock
            {
                (success: Bool, error: NSError?) -> Void in
                if (success)
                {
                    self.theSpinner.stopAnimating()
                    self.dismissViewControllerAnimated(true, completion: nil)
                }
                else
                {
                    // There was a problem, check error.description
                }
            }
        }
    }
    
    
    @IBAction func cancelButtonPressed(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    override func didReceiveMemoryWarning()
    {
        
        
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
