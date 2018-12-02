//
//  SchemeSettingsViewController.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 09/08/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class SchemeSettingsViewController: UIViewController {

    var viewModel: SchemeSettingsModelType?

    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var titleTF: UITextField!
    
    @IBAction func titleColorBtnAction(_ sender: UIButton) {
        titleTF.textColor = sender.backgroundColor
    }
    
    @IBAction func borderColorBtnAction(_ sender: UIButton) {
        titleTF.layer.borderColor = sender.backgroundColor?.cgColor
    }
    
    @IBAction func doneAction(_ sender: UIButton) {
        guard let model = viewModel else { return }
        var _paramsTitle_ = ""
        if titleTF.text == "" {
            _paramsTitle_ = "<Untitled box>"
        } else {
            _paramsTitle_ = titleTF.text!
        }
        let _paramsTitleColor_ = getComponetsFromColor(color: titleTF.textColor!)
        let _paramsBorderColor_ = getComponetsFromColor(color: titleTF.textColor!)
//        print(titleTF.layer.borderColor)
        
        
        let boxDemands = BoxDemands(forBox: model.getScheme(),
                                    withTitle: _paramsTitle_,
                                    titleColor: _paramsTitleColor_,
                                    borderColor: _paramsBorderColor_,
                                    order: model.getOrder())
        
        model.saveChanges(toBoxWithDemands: boxDemands)
        dismiss(animated: true, completion: nil)
    }
    
    private func getComponetsFromColor(color: UIColor) -> [Float] {
        var arrayOfComponents = [Float]()
        guard let components = color.cgColor.components else { return arrayOfComponents }
        for i in components {
            print(i)
            arrayOfComponents.append(Float(i))
        }
        return arrayOfComponents
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleTF.textColor = UIColor.black
        guard let model = viewModel else { return }
        titleTF.text = model.getSchemeName()
        
        titleTF.layer.borderWidth = 2
        guard let scheme = model.getScheme() else { return }
        let schemeBorderColorValues = model.getScheme()?.borderColor as! Array<Float>
//        print(titleTF.textColor! as UIColor)
//        for i in schemeBorderColorValues {
//            print(i)
//        }
//        titleTF.layer.borderColor = UIColor(red: CGFloat(schemeBorderColorValues[0]), green: CGFloat(schemeBorderColorValues[1]), blue: CGFloat(schemeBorderColorValues[2]), alpha: CGFloat(schemeBorderColorValues[3])).cgColor

        // Do any additional setup after loading the view.
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
