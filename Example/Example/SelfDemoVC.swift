//
//  SwelfDemoVC.swift
//  Example
//
//  Created by dyw on 2023/2/23.
//

import UIKit
import ZLPhotoBrowser

class SelfDemoVC: UIViewController {

    @IBOutlet weak var countTf: UITextField!
    @IBOutlet weak var scaleTf: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()
        title = "自定义"
        
    }

   
    @IBAction func selectBtnClick(_ sender: Any) {
        ZLPhotoConfiguration.default()
            .allowSelectImage(true)
            .allowSelectVideo(false)
            .showClipDirectlyIfOnlyHasClipTool(true)
            .showPreviewButtonInAlbum(false)
            .editImageConfiguration.tools([.clip])
        ZLPhotoConfiguration.default().xdIsForcedClip = true
        
        if let count = Int(countTf.text ?? "") {
            ZLPhotoConfiguration.default().maxSelectCount(count)
        }
        if let scale = Float(scaleTf.text ?? "") {
            let sc = CGFloat(scale)
            ZLPhotoConfiguration.default().editImageConfiguration.clipRatios([.init(title: "自定义", whRatio: sc)])
        }
        let ps = ZLPhotoPreviewSheet()
        ps.selectImageBlock = { [weak self] results, isOriginal in
            // your code
            
        }
        ps.showPhotoLibrary(sender: self)
    }
    
}
