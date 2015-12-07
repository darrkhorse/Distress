//
//  ViewController.swift
//  Distress
//
//  Created by Michael Litman on 12/4/15.
//  Copyright © 2015 awesomefat. All rights reserved.
//

import UIKit
import Parse


class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate
{
    
    var count = 0
    
    @IBAction func NextScreen(sender: AnyObject)
    {
    }
    @IBOutlet weak var theCV: UICollectionView!
    @IBAction func addButtenPressed(sender: AnyObject)  {
        count++
        print(count)
        self.theCV.reloadData()
    }
   
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let testObject = PFObject(className: "TestObject")
        testObject["foo"] = "bar"
        testObject["name"] = "Johann"
        testObject.saveInBackgroundWithBlock { (success: Bool, error: NSError?) -> Void in
            print("Object has been saved.")
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of items
        return count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCVCell
        
        // Configure the cell
        cell.backgroundColor = UIColor.redColor()
        cell.theLabel.text = "blah"
        return cell
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}