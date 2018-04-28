//
//  ViewController.swift
//  UITextField
//
//  Created by home on 2018/04/26.
//  Copyright © 2018年 Swift-beginners. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // テキストフィールドのプロパティ宣言
    @IBOutlet weak var myTextField: UITextField!
    // ラベルのプロパティ宣言
    @IBOutlet weak var myLabel: UILabel!
    
    @IBAction func tapView(_ sender: UITapGestureRecognizer) {
    // 編集終了でキーボードを下げる
    view.endEditing(true)
    }

    // テキストフィールドの値が変化した時に呼ばれるデリゲートメソッド
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // 変更後の内容を作成する
        let tempStr = textField.text! as NSString
        let replacedString = tempStr.replacingCharacters(in: range, with: string)
        if replacedString == "" {
            // 変更後が空ならばラベルに0を表示する
            myLabel.text = "0"
        } else {
            // 変更後の値を計算してラベルに表示する（25を掛けた値）
            if let num = Int(replacedString) {
                myLabel.text = String(num + 25)
            }
        }
        // テキストフィールドを更新する
        return true
    }
    
    // クリアボタンで実行されるデリゲートメソッド
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        myLabel.text = "0"
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // myTextFieldのデリゲートになる
        myTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

