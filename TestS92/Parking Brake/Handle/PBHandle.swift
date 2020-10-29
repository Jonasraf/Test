//
//  PBHandle.swift
//  TestS92
//
//  Created by Jónas Rafnsson on 27/10/2020.
//

import UIKit

class PBHandle: UIView {
    
    static let shared = PBHandle()
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var parking_break_handle_button: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupview()
    }
    
    func setupview() {
        Bundle.main.loadNibNamed("PBHandle", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    @IBAction func parking_break_on_off() {
        
        if parking_break_handle_is_pulled {
            parking_break_handle_is_pulled = false
            parking_break_handle_switch_is_on = false
            parking_break_handle_button.setTitle("Off", for: .normal)
            let time = Double.random(in: 15...20) / 10
            Timer.scheduledTimer(timeInterval: time, target: self, selector: #selector(restoff), userInfo: nil, repeats: false)
        }else {
            parking_break_handle_is_pulled = true
            parking_break_handle_switch_is_on = true
            left_gear_praking_break_pressure_sensor = true
            right_gear_praking_break_pressure_sensor = true
            parking_break_advisory_is_on = true
            parking_break_is_on = true
            parking_break_handle_button.setTitle("On", for: .normal)
            
            NotificationCenter.default.post(name: Notification.Name("parking_break_on_off"), object: nil)
        }
    }
    
    @objc func restoff() {
        left_gear_praking_break_pressure_sensor = false
        right_gear_praking_break_pressure_sensor = false
        parking_break_advisory_is_on = false
        parking_break_is_on = false
        NotificationCenter.default.post(name: Notification.Name("parking_break_on_off"), object: nil)
    }
    
}
