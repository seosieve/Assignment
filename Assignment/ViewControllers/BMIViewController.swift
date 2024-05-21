//
//  BMIViewController.swift
//  Assignment
//
//  Created by 서충원 on 5/21/24.
//

import UIKit

class BMIViewController: UIViewController {

    @IBOutlet var containerView: [UIView]!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    func setViews() {
        containerView.forEach { view in
            view.layer.cornerRadius = 15
            view.layer.borderWidth = 2
            view.layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
    func alert(title: String, message: String = "") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirm = UIAlertAction(title: "확인", style: .default)
        alert.addAction(confirm)
        present(alert, animated: true)
    }
    
    @IBAction func confirmButtonAction(_ sender: UIButton) {
        guard let height = heightTextField.text else { return }
        guard let weight = weightTextField.text else { return }
        //Input Empty
        guard !height.isEmpty else {alert(title: "키를 입력해주세요!"); return }
        guard !weight.isEmpty else {alert(title: "몸무게를 입력해주세요!"); return }
        //Input String
        guard let intHeight = Int(height) else { alert(title: "문자가 포함되지 않은 키를 입력해주세요."); return }
        guard let intWeight = Int(weight) else { alert(title: "문자가 포함되지 않은 몸무게를 입력해주세요."); return }
        //Input Out Of Range
        guard (20...200) ~= intHeight else { alert(title: "정확한 키를 입력해주세요."); return }
        guard (20...300) ~= intWeight else { alert(title: "정확한 몸무게를 입력해주세요."); return }
        //Correct Input
        let intResult = Double(intWeight) / (Double(intHeight * intHeight) / 10000)
        let stringResult = String(format: "%.2f", intResult)
        
        var BMIResult = "비만입니다."
        switch intResult {
        case 0..<18.5:
            BMIResult = "저체중입니다."
        case 18.5..<23:
            BMIResult = "정상입니다."
        case 23..<25:
            BMIResult = "과체중입니다."
        default:
            break
        }

        alert(title: "BMI결과입니다.", message: "\(stringResult) \(BMIResult)")
    }
    
    //Blank Ignore
    @IBAction func textFieldChanged(_ sender: UITextField) {
        if let text = sender.text {
            sender.text = text.replacingOccurrences(of: " ", with: "")
        }
    }
    
    //Secure Button Action
    @IBAction func secureButtonPressed(_ sender: UIButton) {
        let current = weightTextField.isSecureTextEntry
        current ? (weightTextField.isSecureTextEntry = false) : (weightTextField.isSecureTextEntry = true)
    }
    
    @IBAction func randomButtonPressed(_ sender: UIButton) {
        heightTextField.text = String(Int.random(in: 20...200))
        weightTextField.text = String(Int.random(in: 20...300))
    }
}
