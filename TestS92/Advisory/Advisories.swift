//
//  Advisories.swift
//  TestS92
//
//  Created by Jónas Rafnsson on 27/10/2020.
//

import UIKit

class Advisories: UIView {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var advisoriesView: UIView!
    
    @IBOutlet weak var line1: UILabel!
    @IBOutlet weak var line2: UILabel!
    @IBOutlet weak var line3: UILabel!
    @IBOutlet weak var line4: UILabel!
    @IBOutlet weak var line5: UILabel!
    
    static let shared = Advisories()
    
    var advisories = [AdvisoriesStruct]()
    
    var index = 0 // this is if there are more than 5 advisories. it will change with page up and page down buttons.
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        Bundle.main.loadNibNamed("Advisories", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        advisoriesView.layer.borderWidth = 2
        advisoriesView.layer.borderColor = UIColor.white.cgColor
    }
    
    func removeAdvisory(text: String) {
        var index = 0
        for i in advisories {
            if text == i.text {
                advisories.remove(at: index)
                break
            }
            index += 1
        }
        addAdvisories()
    }
    
    func addAdvisories() {
        guard advisories.count > 0 else {
            line1.text = ""
            line2.text = ""
            line3.text = ""
            line4.text = ""
            line5.text = ""
            return
        }
        
        func lineline(a: UILabel, i: Int) {
            a.text = advisories[i + index].text
            switch advisories[i + index].type {
            case AdvisoryTypes.advisory.rawValue:
                a.backgroundColor = .black
                a.textColor = .white
            case AdvisoryTypes.caution.rawValue:
                a.backgroundColor = .yellow
                a.textColor = .black
            case AdvisoryTypes.warning.rawValue:
                a.backgroundColor = .red
                a.textColor = .black
            default:
                print("Should not happen")
            }
        }
        
        for i in 0...0 {
            switch i {
            case 0:
                lineline(a: line1, i: i)
            case 1:
                lineline(a: line2, i: i)
            case 2:
                lineline(a: line3, i: i)
            case 3:
                lineline(a: line4, i: i)
            case 4:
                lineline(a: line5, i: i)
            default:
                print("Should not happen")
            }
        }
    }
}
