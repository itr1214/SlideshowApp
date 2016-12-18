//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岡田 一郎 on 2016/12/12.
//  Copyright © 2016年 Ichirou Okada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   //変数定義
    var ImageNumber: Int = 0
    var timer:Timer?
    var flag:Bool = true
    var faileName:String?
    
    @IBOutlet weak var susumu: UIButton! // 進むボタン
    @IBOutlet weak var modoru: UIButton! // 戻るボタン
    @IBOutlet weak var tomeru: UIButton! // 再生/停止ボタン
    @IBOutlet weak var imageView: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // 画像を進める
    @IBAction func goBtn(_ sender: Any) {
        imageShowPlus()
    }
    @IBAction func backBtn(_ sender: Any) {
        if ImageNumber < 0 {
            ImageNumber = 2
        }else if ImageNumber > 2 {
            ImageNumber = 0
        }
        print("backBtn\(ImageNumber)")
        imageShow()
        ImageNumber -= 1
    }
   
    @IBAction func autoBtn(_ sender: Any) {
        if (flag) {
            timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(imageShowPlus), userInfo: nil, repeats: true)
            susumu.isEnabled = false
            modoru.isEnabled = false
            tomeru.setTitle("止める", for: .normal)
        }
        // タイマーを止める
        if !flag && (timer?.isValid)! {
            print("止める")
            timer?.invalidate()
            susumu.isEnabled = true
            modoru.isEnabled = true
            tomeru.setTitle("再生", for: .normal)
        }
        if flag {
            flag = false
        } else {
            flag = true
        }
    }
    
    // 画像表示メソッド
    func imageShow() {
        faileName = String(ImageNumber) + ".jpg"
        
        imageView.setImage(UIImage(named: faileName!), for: .normal)
        
    }
    // 画像を1つ前に進める
    func imageShowPlus() {
        
        if ImageNumber > 2 {
            ImageNumber = 0
        } else if ImageNumber < 0 {
            ImageNumber = 0
        }
        imageShow()
        ImageNumber += 1
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segeから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        
        imageViewController.faileName = faileName!
        //タイマーをストップ
        timer?.invalidate()
    }
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から戻った時の処理
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(imageShowPlus), userInfo: nil, repeats: true)
    }
}

