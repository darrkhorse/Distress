//
//  DistressCore.swift
//  Distress_JohannHinck
//
//  Created by Hinck, Johann A on 12/6/15.
//  Copyright © 2015 Hinck, Johann A. All rights reserved.
//

import UIKit

class DistressCore: NSObject
{
    static func showAlert(title: String, message: String, presentingViewController: UIViewController, onScreenDelay: Double)
    {
        let av = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        presentingViewController.presentViewController(av, animated: true, completion: { () -> Void in
            let delay = onScreenDelay * Double(NSEC_PER_SEC)
            let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
            dispatch_after(time, dispatch_get_main_queue(), { () -> Void in
                presentingViewController.dismissViewControllerAnimated(true, completion: nil)
            })
        })
        
    }
}
