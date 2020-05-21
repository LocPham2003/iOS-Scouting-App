//
//  MultiToggle.swift
//  Scouting
//
//  Created by DUC LOC on 4/4/20.
//  Copyright © 2020 Warp7. All rights reserved.
//

import Foundation
import UIKit

public class ToggleButton : UIButton{
    var value = 0
    
    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MultiToggleField : UIView, InputControl{
    func encodeData() {
        let entry = Entry()
        let timer = DataTimer()
        let dataPoint = DataPoint(type_index: self.toggleButton.tag, value: self.defaultValue, time: timer.getTimeStamp())
        entry.data_point.append(dataPoint)
    }
    
    func onTimerStarted() {
        print("Do nothing lol")
    }
    
    func setUpItem() {
        
    }
    
    var title : String?
    var numberOfButtons = 0
    var listOfToggleTitles : [String] = []
    var toggleButton = ToggleButton()
    //We know that the default value is 2, but we need to be able to change this dynamically
    var defaultValue = 2
    override init(frame: CGRect) {
        super.init(frame : frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpToggleField(){
        backgroundColor = UIColor.systemGray5
        
        let label = UILabel()
        let toggleButtons = UIStackView()
        
        addSubview(label)
        addSubview(toggleButtons)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        label.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.3) .isActive = true
        label.topAnchor.constraint(equalTo: topAnchor).isActive = true
        label.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        label.textAlignment = .center
        label.textColor = UIColor.init(red:0.24, green:0.36, blue:0.58, alpha:1.00)
        label.text = self.title
        
        toggleButtons.axis = .horizontal
        toggleButtons.distribution = .fillEqually
        toggleButtons.spacing = 0
        
        toggleButtons.translatesAutoresizingMaskIntoConstraints = false
        toggleButtons.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        toggleButtons.topAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
        toggleButtons.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.7).isActive = true
        toggleButtons.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        
        for i in 0..<numberOfButtons{
            toggleButton = ToggleButton()
            toggleButton.setTitle(self.listOfToggleTitles[i], for: .normal)
            toggleButton.titleLabel?.textAlignment = .center
            toggleButton.addTarget(self, action: #selector(getSelectedToggleButton(sender:)), for: .touchUpInside)
            toggleButton.tag = self.tag
            toggleButton.value = i
            if (i == self.defaultValue){
                toggleButton.backgroundColor = UIColor.init(red:0.24, green:0.36, blue:0.58, alpha:1.00)
                toggleButton.setTitleColor(UIColor.white, for: .normal)
            } else {
                toggleButton.backgroundColor = UIColor.systemGray5
                toggleButton.setTitleColor(UIColor.init(red:0.24, green:0.36, blue:0.58, alpha:1.00), for: .normal)
            }
            
            toggleButtons.addArrangedSubview(toggleButton)
        }
    }
    
    @objc func getSelectedToggleButton(sender : ToggleButton){
        self.defaultValue = sender.value
        self.encodeData()
        setUpToggleField()
    }
    
}
