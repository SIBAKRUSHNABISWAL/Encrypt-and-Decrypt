//
//  EncryptionViewController.swift
//  String Encrypt and Decrypt
//
//  Created by SIBA KRUSHNA BISWAL on 05/02/20.
//  Copyright © 2020 SIBA KRUSHNA BISWAL. All rights reserved.
//

import UIKit

class EncryptionViewController: UIViewController {

    @IBOutlet weak var encryptionTextField: UITextField!
    
    @IBOutlet weak var encryptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.encryptionTextField.addTarget(encryptionLabel, action: #selector(UILabel.input(textField:)), for: .editingChanged)
    }
    
//Submit Button
    @IBAction func encryptionSubmitButton(_ sender: Any) {
        let plainText = encryptionTextField.text
        let stringArr = Array(plainText ?? "")
        var resultArr = ""
        var countEle = 1
        for (index, element) in stringArr.enumerated(){
            if (index < stringArr.count - 1) && (element != stringArr[index + 1]) {
                resultArr.append(element)
                resultArr.append(String(countEle))
                countEle = 1
            } else if (index < stringArr.count - 1) && (element == stringArr[index + 1]) {
                countEle += 1
            } else {
                resultArr.append(element)
                resultArr.append(String(countEle))
            }
        }
        encryptionLabel.text = resultArr
    }

}
extension UILabel {
    @objc
    func input(textField: UITextField) {
        if textField.text == "" {
        self.text = textField.text
        }
    }
}
