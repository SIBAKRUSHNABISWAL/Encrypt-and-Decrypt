//
//  DecryptionViewController.swift
//  String Encrypt and Decrypt
//
//  Created by SIBA KRUSHNA BISWAL on 05/02/20.
//  Copyright © 2020 SIBA KRUSHNA BISWAL. All rights reserved.
//

import UIKit

class DecryptionViewController: UIViewController {

    @IBOutlet weak var decryptionTextField: UITextField!
    
    @IBOutlet weak var decryptionLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.decryptionTextField.addTarget(decryptionLabel, action: #selector(UILabel.input(textField:)), for: .editingChanged)
    }
    
// Submit Button
    @IBAction func decryptionSubmitButton(_ sender: Any) {
        let encryptText = decryptionTextField.text
        let containArr = Array(encryptText ?? "")
        var resultArr = ""
        for element in stride(from: 1, to: containArr.count, by: 2) {
            let elementCount = Int(String(containArr[element])) ?? 0
            var tempStoreEle = ""
            for _ in 1...elementCount {
                tempStoreEle.append(containArr[element - 1])
            }
            resultArr.append(contentsOf: tempStoreEle)
        }
        decryptionLabel.text = resultArr
    }
    
}
extension UILabel {
    @objc
    func inputText(textField: UITextField) {
        if textField.text == "" {
        self.text = textField.text
        }
    }
}
