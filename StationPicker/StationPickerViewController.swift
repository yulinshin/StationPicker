//
//  StationPickerViewController.swift
//  StationPicker
//
//  Created by yulin on 2021/2/1.
//

import UIKit

class StationPickerViewController: UIViewController {

    
    
    
    var stations = [
        Station(name: "南港"),
        Station(name: "台北"),
        Station(name: "板橋"),
        Station(name: "桃園"),
        Station(name: "新竹"),
        Station(name: "苗栗"),
        Station(name: "台中"),
        Station(name: "彰化"),
        Station(name: "雲林"),
        Station(name: "嘉義"),
        Station(name: "台南"),
        Station(name: "左營"),
    ]
    var stationsA = [Station]()
    var stationsB = [Station]()
    override func viewDidLoad() {
        super.viewDidLoad()
    
        stationsA = stations
        stationsB = stations
    
        
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension StationPickerViewController: UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var number = stationsA.count - 1
        return number
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
        var compontA = stationsA[row].name
        var compontB = stationsB[row].name
        if component == 0{
            return compontA
        }else{
            return compontB
        }
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            stationsB = stations
            stationsB = stationsB.filter{$0.name != stationsA[row].name}
            pickerView.reloadComponent(1)
        }else{
            stationsA = stations
            stationsA = stationsA.filter{$0.name != stationsB[row].name}
            pickerView.reloadComponent(0)

        }
    }

}

