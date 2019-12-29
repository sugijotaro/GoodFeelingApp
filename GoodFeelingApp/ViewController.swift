//
//  ViewController.swift
//  GoodFeelingApp
//
//  Created by JotaroSugiyama on 2019/12/29.
//  Copyright © 2019 JotaroSugiyama. All rights reserved.
//

//ca-app-pub-6018673196408347~3811768607    アプリID
//ca-app-pub-6018673196408347/9039016886    広告ユニットID
//ca-app-pub-3940256099942544/4411468910    テスト用広告ユニットID

import UIKit
import AudioToolbox
//import GoogleMobileAds

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

//    var interstitial: GADInterstitial!
    
    @IBOutlet var pickerView: UIPickerView!
    @IBOutlet var buttonArray: [UIButton] = []
    @IBOutlet var miniViewArray: [UIView] = []
    var count : Int = 0
    
    let dataList = ["","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","","",""]
    
    //しゅぽん
    let refreshControl = UIRefreshControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        for button in buttonArray {
            button.layer.cornerRadius = 20
        }
        pickerView.layer.cornerRadius = 15
        for view in miniViewArray{
            view.layer.cornerRadius = 20
        }
        
        //UIScrollViewのインスタンス作成
        let scrollView = UIScrollView()

        //scrollViewの大きさを設定。
        scrollView.frame = self.view.frame

        //スクロール領域の設定
        scrollView.contentSize = CGSize(width:self.view.frame.width, height:self.view.frame.height)
        
        scrollView.backgroundColor = UIColor(hex: "E5E5E5")
        
//        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        scrollView.refreshControl = refreshControl
        
        //バー消す
        scrollView.showsVerticalScrollIndicator = false

        //scrollViewをviewのSubViewとして追加
        self.view.addSubview(scrollView)
        self.view.sendSubviewToBack(scrollView)
        
//        interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
//        let request = GADRequest()
//        interstitial.load(request)
    }
    
    // UIPickerViewの列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // UIPickerViewの行数、リストの数
    func pickerView(_ pickerView: UIPickerView,
                    numberOfRowsInComponent component: Int) -> Int {
        return dataList.count
    }
    
    // UIPickerViewの最初の表示
    func pickerView(_ pickerView: UIPickerView,
                    titleForRow row: Int,
                    forComponent component: Int) -> String? {
        
        return dataList[row]
    }
    
    // UIPickerViewのRowが選択された時の挙動
    func pickerView(_ pickerView: UIPickerView,
                    didSelectRow row: Int,
                    inComponent component: Int) {
    }
    
    @IBAction func button(_ sender: UIButton){
        if sender.tag == 2{
            AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
        }else if sender.tag == 3{
            AudioServicesPlaySystemSound(1011)
        }else if sender.tag == 4{
            AudioServicesPlaySystemSound(1102)
        }else if sender.tag == 5{
            AudioServicesPlaySystemSound(1519)
        }else if sender.tag == 6{
            AudioServicesPlaySystemSound(1520)
        }else if sender.tag == 7{
            AudioServicesPlaySystemSound(1521)
        }
        count = count + 1
        print(count)
        if count == 30{
//            if interstitial.isReady {
//              interstitial.present(fromRootViewController: self)
//            } else {
//              print("Ad wasn't ready")
//            }
            count = 0
        }
    }
    
    @objc func handleRefresh(sender : UIRefreshControl) {
        // ここが引っ張られるたびに呼び出される
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            sender.endRefreshing()
        }
    }
}

