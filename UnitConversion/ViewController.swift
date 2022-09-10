//
//  ViewController.swift
//  UnitConversion
//
//  Created by mac on 05/09/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var outputLabel: UILabel!
    @IBOutlet weak var valTextField: UITextField!
    @IBOutlet weak var quantityMenu: UIButton!
    @IBOutlet weak var fromMenuPop: UIButton!
    @IBOutlet weak var toMenuPop: UIButton!
    
    var selectedQuantity = "Volume"
    var fromUnit = "Gallons"
    var toUnit = "Litres"
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpForQuantityMenu()
        fromMenuPopButton()
        toMenuPopButton()
    }

    func popUpForQuantityMenu() {
        let optionClosure = { (action : UIAction) in
            self.selectedQuantity = action.title
            print(self.selectedQuantity)
            self.fromMenuPopButton()
            self.toMenuPopButton()
            if self.selectedQuantity == "Volume" {
                self.fromUnit = "Gallons"
                self.toUnit = "Litres"
            }
            else if self.selectedQuantity == "Length" {
                self.fromUnit = "Centimeters"
                self.toUnit = "Meters"
            }
            else if self.selectedQuantity == "Temperature" {
                self.fromUnit = "Celsius"
                self.toUnit = "Fahrenheit"
            }
        }
            
            self.quantityMenu.menu = UIMenu(children: [
                UIAction(title: "Volume", state: .on, handler: optionClosure),
                UIAction(title: "Length", handler: optionClosure),
                UIAction(title: "Temperature", handler: optionClosure)])
        quantityMenu.showsMenuAsPrimaryAction = true
        quantityMenu.changesSelectionAsPrimaryAction = true
        
    }
    
    func fromMenuPopButton() {
        switch selectedQuantity {
        case "Temperature" :
            let optionClosure = { (action : UIAction) in
                self.fromUnit = action.title
                print(self.fromUnit) }
            
                self.fromMenuPop.menu = UIMenu(children: [
                    UIAction(title: "Celsius", state: .on, handler: optionClosure),
                    UIAction(title: "Fahrenheit", handler: optionClosure)])
            fromMenuPop.showsMenuAsPrimaryAction = true
            fromMenuPop.changesSelectionAsPrimaryAction = true
        
        case "Length":
            let optionClosure = { (action : UIAction) in
                self.fromUnit = action.title
                print(self.fromUnit) }
            
                self.fromMenuPop.menu = UIMenu(children: [
                    UIAction(title: "Centimeters", state: .on, handler: optionClosure),
                    UIAction(title: "Meters", handler: optionClosure)])
            fromMenuPop.showsMenuAsPrimaryAction = true
            fromMenuPop.changesSelectionAsPrimaryAction = true
        
        default :
            let optionClosure = { (action : UIAction) in
                self.fromUnit = action.title
                print(self.fromUnit) }
            
                self.fromMenuPop.menu = UIMenu(children: [
                    UIAction(title: "Gallons", state: .on, handler: optionClosure),
                    UIAction(title: "Litres", handler: optionClosure)])
            fromMenuPop.showsMenuAsPrimaryAction = true
            fromMenuPop.changesSelectionAsPrimaryAction = true
        }
    }
    
    func toMenuPopButton() {
        let optionClosure = { (action : UIAction) in
            self.toUnit = action.title
            print(self.toUnit) }
        switch selectedQuantity {
        case "Temperature" :
                self.toMenuPop.menu = UIMenu(children: [
                    UIAction(title: "Celsius", handler: optionClosure),
                    UIAction(title: "Fahrenheit", state: .on, handler: optionClosure)])
            toMenuPop.showsMenuAsPrimaryAction = true
            toMenuPop.changesSelectionAsPrimaryAction = true
        
        case "Length":
                self.toMenuPop.menu = UIMenu(children: [
                    UIAction(title: "Centimeters", handler: optionClosure),
                    UIAction(title: "Meters", state: .on, handler: optionClosure)])
            toMenuPop.showsMenuAsPrimaryAction = true
            toMenuPop.changesSelectionAsPrimaryAction = true
        
        default :
                self.toMenuPop.menu = UIMenu(children: [
                    UIAction(title: "Gallons", handler: optionClosure),
                    UIAction(title: "Litres", state: .on, handler: optionClosure)])
            toMenuPop.showsMenuAsPrimaryAction = true
            toMenuPop.changesSelectionAsPrimaryAction = true
        }
    }
    @IBAction func convertButton(_ sender: Any) {
        if valTextField.text == "" {
            outputLabel.text = "Enter value"
        }
        else {
            if isDouble(inputVal: valTextField.text) {
                let answer = calculation(unitFrom: fromUnit, unitTo: toUnit, val:      Double(valTextField.text!)!)
                    outputLabel.text = answer
            }
            else {
                outputLabel.text = "Enter valid value"
                
            }
        }
    }
}

func isDouble(inputVal : String?) -> Bool {
    if let _ = Double(inputVal!) {
        return true
    }
    return false
}

func calculation(unitFrom: String, unitTo: String, val: Double) -> String {
    print("-===========-")
    print(unitFrom)
    print(unitTo)
    print(val)
    print("-===========-")
    if unitFrom == unitTo {
        return "Invalid Converstion"
    }
    else if unitFrom == "Celsius" && unitTo == "Fahrenheit" {
        let result = (val * (9/5)) + 32
        return String(result)
    }
    else if unitTo == "Celsius" && unitFrom == "Fahrenheit" {
        let result = (val - 32)*5/9
        return String(result)
    }
    else if unitFrom == "Centimeters" && unitTo == "Meters" {
        let result = val/100
        return String(result)
    }
    else if unitTo == "Centimeters" && unitFrom == "Meters" {
        let result = round(val*100)
        return String(result)
    }
    else if unitFrom == "Gallons" && unitTo == "Litres" {
        let result = round(val*3.78541)
        return String(result)
    }
    else if unitTo == "Gallons" && unitFrom == "Litres" {
        let result = round(val/3.78541)
        return String(result)
    }
    else{
        return "Wrong !"
    }
}
