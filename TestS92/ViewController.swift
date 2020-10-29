//
//  ViewController.swift
//  TestS92
//
//  Created by Jónas Rafnsson on 27/10/2020.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var handleView: PBHandle!
    @IBOutlet weak var advisoriesView: Advisories!
    @IBOutlet weak var brake: Brakes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupNotifications()
        brake.layer.masksToBounds = true
        brake.sizeToFit()
        brake.layoutSubviews()
    }

    func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(parkingBreakOnOf), name: Notification.Name("parking_break_on_off"), object: nil)
    }
    
    @objc func parkingBreakOnOf() {
        if parking_break_is_on {
            advisoriesView.advisories.append(AdvisoriesStruct(text: "PARKING BREAK", type: AdvisoryTypes.advisory.rawValue, number: Advisories.shared.advisories.count + 1))
            advisoriesView.addAdvisories()
            print(brake.frame)
        }else {
            advisoriesView.removeAdvisory(text: "PARKING BREAK")
        }
    }
}

