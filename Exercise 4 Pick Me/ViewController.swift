//
//  ViewController.swift
//  itwit
//
//  Created by Tomas Gonzalez Ortega Langara College@ on 2018-01-18.
//  Copyright © 2018 Tom Nuss. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var theTextView: UITextView!
    @IBOutlet var message: UILabel!
    @IBOutlet var thePicker: UIPickerView!
    var list = Extractor() // this is to be able to call the Extractor constructor

    override func viewDidLoad() {
        super.viewDidLoad()
        theTextView.backgroundColor = UIColor.black
        theTextView.textColor = UIColor(red: 0/255, green: 255/255, blue: 51/255, alpha: 1)
        theTextView.font = UIFont.systemFont(ofSize: 27)
        theTextView.font = UIFont.boldSystemFont(ofSize: 28)
        theTextView.font = UIFont(name: "Menlo-Bold", size: 27)
        theTextView.isEditable = false
        theTextView.layer.cornerRadius = 10.0;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Button Actions -
    @IBAction func buttonHit (sender: AnyObject) {
        let theMessage = "I \(list.getVerb(index: thePicker.selectedRow(inComponent:0))) \(list.getNumber(index: thePicker.selectedRow(inComponent:1))) \(list.getNoun(index: thePicker.selectedRow(inComponent:2)))"
        //let output = UIAlertController(title: "Pick Me!", message: theMessage, preferredStyle: .alert)
        //output.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        //present(output, animated: true, completion: nil)
        print(theMessage);
        theTextView.text! += theMessage + "\n"
    }
    
    @IBAction func Clear (sender: AnyObject) {
    theTextView.text = ""
    }
    // MARK: - Protocols -
    // MARK: Datasource
    // THIS IS THE NUMBER OF ROWS
    func numberOfComponents(in: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component:
        Int) -> Int {
        if component == 0 {
            return list.verbCount()
        }
        if component == 1 {
            return list.numberCount()
        } else {
            return list.nounCount()
        }
    }
    
    // MARK: Delegate
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return list.verbs[row]
        }
        if component == 1 {
            return list.numbers[row]
        } else {
            return list.nouns[row]
        }
    }
}
