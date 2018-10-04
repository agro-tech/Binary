//
//  ViewController.swift
//  Binary
//
//  Created by Alan Ramos on 8/26/18.
//  Copyright © 2018 Alan Ramos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueEntryTxtFld: UITextField!
    @IBOutlet weak var binaryBtn: UIButton!
    @IBOutlet weak var decimalBtn: UIButton!
    
    let placeholder = NSAttributedString(string: "Enter a value...", attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1), NSAttributedStringKey.font: UIFont.init(name: "Menlo", size: 36.0)!])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        valueEntryTxtFld.attributedPlaceholder = placeholder
        
        valueEntryTxtFld.addTarget(self, action: #selector(textFiledTextDidChange), for: .editingChanged)
        disableBtns()
            }

    @objc func textFiledTextDidChange () {
        if valueEntryTxtFld.text == "" {
            disableBtns()
        } else {
            enableBtns()
        }
    }
    
    func disableBtns() {
        binaryBtn.isEnabled = false
        binaryBtn.alpha = 0.5
        decimalBtn.isEnabled = false
        decimalBtn.alpha = 0.5

    }
    
    func enableBtns() {
        binaryBtn.isEnabled = true
        binaryBtn.alpha = 1.0
        decimalBtn.isEnabled = true
        decimalBtn.alpha = 1.0

    }
    
    @IBAction func binaryBtnPressed(_ sender: Any) {
        if valueEntryTxtFld.text != "" {
            binaryBtn.alpha = 1.0
            decimalBtn.alpha = 0.5
            
            guard let string = valueEntryTxtFld.text, let intFromString = Int(string) else { return }
            let binaryDigit = BinaryDecimal(intFromString)
            valueEntryTxtFld.text = "\(binaryDigit.calculateBinaryValueForInt())"
        }
        
    }
    
    @IBAction func decimalBtnPressed(_ sender: Any) {
        if valueEntryTxtFld.text != "" {
            binaryBtn.alpha = 0.5
            decimalBtn.alpha = 1.0
            
            guard let string = valueEntryTxtFld.text else { return }
            let bitsFromString = string.map { Int(String($0))! }
            let binaryDigit = BinaryDecimal(bitsFromString)
            valueEntryTxtFld.text = "\(binaryDigit.calculateIntValueForBinary())"
        }
        
    }
    @IBAction func asciiBtnPressed(_ sender: Any) {
    }
    
}

