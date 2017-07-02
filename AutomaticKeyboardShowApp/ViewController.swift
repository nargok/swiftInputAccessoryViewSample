//
//  ViewController.swift
//  AutomaticKeyboardShowApp
//
//  Created by 後閑諒一 on 2017/07/01.
//  Copyright © 2017年 後閑諒一. All rights reserved.
//

// memo
// ボタンの左隣にTextFeildを追加する
// 背景を透過して表示したい

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var myField1: UITextField! // 入力テキストフィールド
    @IBOutlet weak var myField2: UITextField! // メッセージ表示フィールド
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // ボタンビュー作成
        let myKeyboard = UIView(frame: CGRectMake(0, 0, 320, 40))
        myKeyboard.backgroundColor = UIColor.darkGray
        
        // textField作成
        let myTextField = UITextField(frame: CGRectMake(5, 5, 280, 30))
        myTextField.backgroundColor = UIColor.white
        myTextField.placeholder = "コメントを入力してください"
        myTextField.addTarget(self, action: #selector(ViewController.onMyButton), for: UIControlEvents.touchUpInside)
        // textFieldをViewに追加
        myKeyboard.addSubview(myTextField)
        
        // Doneボタン作成
        let myButton = UIButton(frame: CGRectMake(290, 5, 80, 30))
        myButton.backgroundColor = UIColor.lightGray
        myButton.setTitle("Done", for: UIControlState.normal)
        myButton.addTarget(self, action: #selector(ViewController.onMyButton), for: UIControlEvents.touchUpInside)
        
        // ボタンをViewに追加
        myKeyboard.addSubview(myButton)
        
        // ビューをフィールドに設定
        myField1.inputAccessoryView = myKeyboard
        myField1.delegate = self
        
        //viewControllerが呼ばれたときにキーボードを出力する
        myTextField.becomeFirstResponder()
    }

    // Doneボタンタップ時に実行するメソッド
    func onMyButton() {
        myField2.text = "Success!"
        self.view.endEditing(true)
    }
    
    // リターンキーでのdelegate method
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    // 
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

