//
//  UploadProfilePhotoTableViewController.swift
//  eatClub
//
//  Created by 駿逸 陳 on 2015/4/19.
//  Copyright (c) 2015年 miiitech. All rights reserved.
//

import UIKit
import MobileCoreServices

class UploadProfilePhotoTableViewController: UITableViewController, UIImagePickerControllerDelegate, UIActionSheetDelegate, UINavigationControllerDelegate, UIAlertViewDelegate {
    
    @IBOutlet var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        nextButton.hidden = true
        
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = false
        let label = UILabel()
        label.backgroundColor = UIColor.clearColor()
        label.font = UIFont.boldSystemFontOfSize(20.0)
        label.shadowColor = UIColor(white: 0.0, alpha: 0.5)
        label.textAlignment = NSTextAlignment.Center
        label.textColor = UIColor.whiteColor()
        self.navigationItem.titleView = label
        label.text = "上傳個人照片"
        label.sizeToFit()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return 3
    }

    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell!
        
        if indexPath.row == 0 {
            var cell: uploadPhotoCell! = tableView.dequeueReusableCellWithIdentifier("photoCell", forIndexPath: indexPath) as! uploadPhotoCell
            
            let cellImageLayer:CALayer = cell.uploadPhotoView.layer
            cellImageLayer.cornerRadius = 8.0
            cellImageLayer.masksToBounds = true
            
            return cell
        }else if indexPath.row == 1{
            cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = "外表的形容"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }else if indexPath.row == 2{
            cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
            cell.textLabel?.text = "最滿意的部位"
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        // Configure the cell...

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let row = indexPath.row
        if row == 0 {
            return 202.0
        }else{
            return 60.0
        }
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let row = indexPath.row
        if row == 0 {
            //上傳大頭照
        }else if row == 1 {
            //外表的形容
        }else if row == 2 {
            //最滿意的部位
        }else{
            
        }
    }
    
    @IBAction func uploadButtonPressed(sender: AnyObject) {
        let cameraDeviceAvailable: Bool = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)
        let photoLibraryAvailable: Bool = UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary)
        
        if cameraDeviceAvailable && photoLibraryAvailable {
            let actionSheet = UIActionSheet(title: nil, delegate: self, cancelButtonTitle: "取消", destructiveButtonTitle: nil, otherButtonTitles: "拍張照片", "從相簿選擇")
            actionSheet.showInView(self.view)
        }else{
            
        }
    }
    
    func shouldPresentPhotoCaptureController () -> Bool {
        var presentedPhotoCaptureController = self.shouldStartCameraController()
        
        if presentedPhotoCaptureController {
            
        }else{
            presentedPhotoCaptureController = self.shouldStartPhotoLibraryPickerController()
        }
        
        return presentedPhotoCaptureController
    }

    
    func shouldStartCameraController () -> Bool {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) == false {
            return false
        }
        
        let cameraUI = UIImagePickerController()
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) && UIImagePickerController.availableMediaTypesForSourceType(UIImagePickerControllerSourceType.Camera) != nil {
            
            cameraUI.mediaTypes = [kUTTypeImage]
            cameraUI.sourceType = UIImagePickerControllerSourceType.Camera
            
            if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Rear) {
                cameraUI.cameraDevice = UIImagePickerControllerCameraDevice.Rear
            }else if UIImagePickerController.isCameraDeviceAvailable(UIImagePickerControllerCameraDevice.Front) {
                cameraUI.cameraDevice = UIImagePickerControllerCameraDevice.Front
            }
        }else{
            return false
        }
        
        cameraUI.allowsEditing = true
        cameraUI.showsCameraControls = true
        cameraUI.delegate = self
        
        #if TARGET_OS_IPHONE &&  (__IPHONE_OS_VERSION_MIN_REQUIRED < __IPHONE_7_0)
            self.presentViewController(cameraUI, animated: true, completion: nil)
        #else
//            [self, presentModalViewController:cameraUI animated:YES];
        #endif
        
        return true
    }
    
    
    func shouldStartPhotoLibraryPickerController () -> Bool {
        return true
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
