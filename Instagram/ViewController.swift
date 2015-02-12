//
//  ViewController.swift
//  Instagram
//
//  Created by Marco F.A. Corzani on 06.02.15.
//  Copyright (c) 2015 Alphaweb. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var pickedImage: UIImageView!
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("Image selected")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        pickedImage.image = image
        
    }
    
   
    
    @IBAction func pickImage(sender: AnyObject) {
    
        var image = UIImagePickerController()
        image.delegate = self
        image.sourceType = UIImagePickerControllerSourceType.Camera  //e.g. Camera
        image.allowsEditing = false
        self.presentViewController(image, animated: true, completion: nil)
        
        }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
       /*
        
        Parse.setApplicationId("m6VGUG72vVQhT7Mcciqr8fMJctZLec7YeA839MBK", clientKey: "bNjEM72JpunlL9mQW5ZuDuMM8tmWJikNqfqtW9kn")
    
        var score = PFObject(className: "score")
        score.setObject("Marco", forKey: "name")
        score.setObject(5085, forKey: "number")
        //Speichern nach Parse
        //Immer das verwenden, checkt ob Connection besteht
        score.saveInBackgroundWithBlock {
            (success: Bool!, error: NSError!) -> Void in
            if success == true {
                
                println("Score created with ID: (\(score.objectId)")
            
            }   else {
            
                println(error)
            }
        }
        
        // Daten von Parse abfragen
        
        var query = PFQuery(className: "score")
        query.getObjectInBackgroundWithId("R424OWZMm2") {
            (score: PFObject!, error: NSError!) -> Void in
            
            if error == nil {
                
                //println(score.objectForKey("name"),score.objectForKey("number"))
                
                //Update Parse Eintrag:
                
                score["name"] = "Flavio"
                score["number"] = 6002
                score.save()
                
            }   else {
                
                println(error)
            }
       
   
        }
    */
    
    
        
        
        
        
        
    
    }

 }
















