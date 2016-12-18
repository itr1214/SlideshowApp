//
//  ImageViewController.swift
//  SlideshowApp
//
//  Created by 岡田 一郎 on 2016/12/15.
//  Copyright © 2016年 Ichirou Okada. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    // 受け取るための変数定義
    var faileName: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        print(faileName)
        
        var image:UIImage = UIImage(named: faileName)!
        imageView.image = image
        //imageView.image = imageNumber + ".jpg"
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
