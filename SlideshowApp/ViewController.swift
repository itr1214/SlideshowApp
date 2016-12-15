//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岡田 一郎 on 2016/12/12.
//  Copyright © 2016年 Ichirou Okada. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // 画像表示番号
    var imageNumber: Int = 0
    // 自動再生フラグ
    var stopFlag:Bool = false
    // Timer
    var timer:Timer?
    @IBOutlet weak var auto: UIButton!
    @IBOutlet weak var back: UIButton!
    @IBOutlet weak var go: UIButton!
    
    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    //自動スライド
    @IBAction func autPlay(_ sender: Any) {
        repeatView()

    }
    /*
     *戻るボタン
     */
    @IBAction func backImage(_ sender: Any) {
        // 画像を一つ前に戻す
        imageNumber -= 1
        // 一番最初に戻ったら最後の画像までも取る
        if(imageNumber < 0) {
            imageNumber = 2
        }
        // 画像を表示する
        imageShow(imageNumber)
    }
    /*
     *進むボタン
     */
    @IBAction func goImage(_ sender: Any) {
        // 画像を一つ前に進める
        imageNumber += 1
        // 一番最初に戻ったら最後の画像までも取る
        if imageNumber > 2 {
            imageNumber = 0
        }
    
        imageShow(imageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func repeatView() {
        // 再生されていない状態
        if !stopFlag {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.goImage), userInfo: nil, repeats: true)
            stopFlag = true
            auto.setTitle("停止", for: .normal)
            // ボタンの無効化
            go.isEnabled = false
            back.isEnabled = false
            return
        }
        // タイマーがすでに動いていて、stopFlagがtrueだったら
        if stopFlag && (timer?.isValid)! {
            timer?.invalidate()
            stopFlag = false
            auto.setTitle("再生", for: .normal)
            // ボタンの有効化
            go.isEnabled = true
            back.isEnabled = true
        }
        
    }
   /* func PlsView(_ flag:Bool) {
       
        
    }*/
    /*
     *画像を表示する
     */
    func imageShow(_ imageNumber:Int) {
        var fileName: String = String(imageNumber) + ".jpg"
        var image:UIImage = UIImage(named: fileName)!
        imageView.image = image
    }
    
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        // 他の画面から戻ってきたときに呼び出される処理を記述
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のImageViewControllerを取得する
        let imageViewController:ImageViewController = segue.destination as! ImageViewController
        // 遷移先のImageViewContrllerで宣言しているプロパティに値を設定
        var filename:String = String(imageNumber) + ".jpg"
        imageViewController.fileName = filename
        
    }
}

