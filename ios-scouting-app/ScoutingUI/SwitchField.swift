//
//  SwitchField.swift
//  Scouting
//
//  Created by DUC LOC on 4/16/20.
//  Copyright © 2020 Warp7. All rights reserved.
//

import Foundation
import UIKit
public class SwitchField : UIView, InputControl {
    func encodeData() {
        let entry = Entry()
        let timer = DataTimer()
        let dataPoint = DataPoint(type_index: self.switchButton.tag, value: self.value, time: timer.getTimeStamp())
        entry.data_point.append(dataPoint)
    }
    
    func onTimerStarted() {
        self.switchButton.isEnabled = true
        self.switchButton.setTitleColor(UIColor(red: 0.35, green: 0.76, blue: 0.00, alpha: 1.00), for: .normal)
    }
    
    func setUpItem() {
        
    }
    
    var switchButton = UIButton()
    var title : String?
    var value = 0
    var lite : Bool?
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setUpSwitchField(){
        addSubview(switchButton)
        switchButton.setTitle(self.title, for: .normal)
        switchButton.titleLabel?.numberOfLines = 0
        switchButton.contentHorizontalAlignment = .center
        switchButton.titleLabel?.textAlignment = .center
        switchButton.titleLabel?.lineBreakMode = .byWordWrapping
        switchButton.tag = self.tag
        switchButton.addTarget(self, action: #selector(activateSwitch(sender:)), for: .touchUpInside)
        
        if (self.lite ?? false){
            switchButton.setTitleColor(UIColor(red: 0.12, green: 0.67, blue: 0.19, alpha: 1.00), for: .normal)
            backgroundColor = UIColor.systemGray5
            switchButton.isEnabled = true
        } else {
            switchButton.setTitleColor(UIColor.systemGray, for: .normal)
            backgroundColor = UIColor.systemGray5
            switchButton.isEnabled = false
        }
        
        
        
        switchButton.translatesAutoresizingMaskIntoConstraints = false
        switchButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        switchButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        switchButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        switchButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func activateSwitch(sender : UIButton){
        if(self.value == 0){
            //Turn on
            sender.backgroundColor = UIColor.red
            sender.setTitleColor(UIColor.white, for: .normal)
            
            if (self.lite ?? false){
                sender.backgroundColor = UIColor.init(red:0.24, green:0.36, blue:0.58, alpha:1.00)
                sender.setTitleColor(UIColor.systemGray5, for: .normal)
            }
            
            self.value = 1
        } else if (self.value == 1){
            //Turn off
            sender.backgroundColor = UIColor.systemGray5
            sender.setTitleColor(UIColor(red: 0.12, green: 0.67, blue: 0.19, alpha: 1.00), for: .normal)
            self.value = 0
        }
        
        self.encodeData()
        setUpSwitchField()
    }
}
