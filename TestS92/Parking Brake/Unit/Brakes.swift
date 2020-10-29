//
//  Brakes.swift
//  TestS92
//
//  Created by Jónas Rafnsson on 29/10/2020.
//

import UIKit

class Brakes: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var copilot_pedals_imageView: UIImageView!
    @IBOutlet weak var pilot_pedals_imageView: UIImageView!
    @IBOutlet weak var left_slave_valve_imageView: UIImageView!
    @IBOutlet weak var right_slave_valve_imageView: UIImageView!
    @IBOutlet weak var parking_brake_valve_imageView: UIImageView!
    @IBOutlet weak var left_brake_imageView: UIImageView!
    @IBOutlet weak var right_brake_imageView: UIImageView!
    
    var linesToDraw: [CGPoint] = []
    // Creating Points form Pedals to Slave Valves
    var copLeftLine = [CGPoint]()
    var copRightLine = [CGPoint]()
    var pilLeftLine = [CGPoint]()
    var pilRightLine = [CGPoint]()
    var slaLeftLine = [CGPoint]()
    var slaRigLine = [CGPoint]()
    var braLefLine = [CGPoint]()
    var braRigLine = [CGPoint]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupview()
    }
    
    override func draw(_ rect: CGRect) {
        let _: Void = createBezPat(color: .lightGray,
                                   routing: Lines.from_copilot_slave_valve_left,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .gray,
                                   routing: Lines.from_copilot_slave_valve_right,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .lightGray,
                                   routing: Lines.from_pilot_slave_valve_left,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .gray,
                                   routing: Lines.from_pilot_slave_valve_right,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .lightGray,
                                   routing: Lines.from_left_slave_valve_barking_unit,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .gray,
                                   routing: Lines.from_right_slave_valve_barking_unit,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .lightGray,
                                   routing: Lines.from_braking_valve_left_brake,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
        let _: Void = createBezPat(color: .gray,
                                   routing: Lines.from_braking_valve_right_brake,
                                   thinkness: 5,
                                   duration: 0).stroke()
        
    }
    
    func setupview() {
        Bundle.main.loadNibNamed("Brakes", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
    
    
    
    func createBezPat(color: UIColor, routing: Lines, thinkness: Double, duration: Int) -> UIBezierPath {
        var bez: UIBezierPath!
        
        // Creating Points form Pedals to Slave Valves
        copLeftLine = [CGPoint(x: copilot_pedals_imageView.center.x - (pilot_pedals_imageView.frame.width * 0.01 * 10), y: copilot_pedals_imageView.center.y),
                           CGPoint(x: copilot_pedals_imageView.center.x - (pilot_pedals_imageView.frame.width * 0.01 * 10), y: left_slave_valve_imageView.center.y),
                           left_slave_valve_imageView.center]
        
        copRightLine = [CGPoint(x: copilot_pedals_imageView.center.x + (pilot_pedals_imageView.frame.width * 0.01 * 10), y: copilot_pedals_imageView.center.y),
                            CGPoint(x: copilot_pedals_imageView.center.x + (pilot_pedals_imageView.frame.width * 0.01 * 10), y: right_slave_valve_imageView.center.y),
                            right_slave_valve_imageView.center]
        
        pilLeftLine = [CGPoint(x: pilot_pedals_imageView.center.x - (pilot_pedals_imageView.frame.width * 0.01 * 10), y: pilot_pedals_imageView.center.y),
                           CGPoint(x: pilot_pedals_imageView.center.x - (pilot_pedals_imageView.frame.width * 0.01 * 10), y: left_slave_valve_imageView.center.y),
                           left_slave_valve_imageView.center]
        
        pilRightLine = [CGPoint(x: pilot_pedals_imageView.center.x + (pilot_pedals_imageView.frame.width * 0.01 * 10), y: pilot_pedals_imageView.center.y),
                            CGPoint(x: pilot_pedals_imageView.center.x + (pilot_pedals_imageView.frame.width * 0.01 * 10), y: right_slave_valve_imageView.center.y),
                            right_slave_valve_imageView.center]
        
        slaLeftLine = [left_slave_valve_imageView.center,
                           CGPoint(x: left_slave_valve_imageView.center.x, y: (left_slave_valve_imageView.frame.maxY + parking_brake_valve_imageView.frame.minY) / 2),
                           CGPoint(x: parking_brake_valve_imageView.center.x - (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: (left_slave_valve_imageView.frame.maxY + parking_brake_valve_imageView.frame.minY) / 2),
                           CGPoint(x: parking_brake_valve_imageView.center.x - (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: parking_brake_valve_imageView.center.y)]
        
        slaRigLine = [right_slave_valve_imageView.center,
                          CGPoint(x: right_slave_valve_imageView.center.x, y: (right_slave_valve_imageView.frame.maxY + left_slave_valve_imageView.frame.minY) / 2),
                          CGPoint(x: parking_brake_valve_imageView.center.x + (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: (right_slave_valve_imageView.frame.maxY + left_slave_valve_imageView.frame.minY) / 2),
                          CGPoint(x: parking_brake_valve_imageView.center.x + (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: parking_brake_valve_imageView.center.y)]
        
        braLefLine = [CGPoint(x: parking_brake_valve_imageView.center.x - (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: parking_brake_valve_imageView.frame.maxY),
                          CGPoint(x: parking_brake_valve_imageView.center.x - (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: left_brake_imageView.center.y),
                          left_brake_imageView.center]
    
        braRigLine = [CGPoint(x: parking_brake_valve_imageView.center.x + (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: parking_brake_valve_imageView.frame.maxY),
                          CGPoint(x: parking_brake_valve_imageView.center.x + (parking_brake_valve_imageView.frame.width * 0.01 * 25), y: right_brake_imageView.center.y),
                          right_brake_imageView.center]
        
        func createPath() -> UIBezierPath? {
            let bez = UIBezierPath()
            bez.move(to: linesToDraw[0])
            for i in 1..<linesToDraw.count {
                bez.addLine(to: linesToDraw[i])
            }
            return bez
        }
        
        switch routing.rawValue {
        case 1:
            linesToDraw = copLeftLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 2:
            linesToDraw = copRightLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 3:
            linesToDraw = pilLeftLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 4:
            linesToDraw = pilRightLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 5:
            linesToDraw = slaLeftLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 6:
            linesToDraw = slaRigLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 7:
            linesToDraw = braLefLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        case 8:
            linesToDraw = braRigLine
            bez = createPath()
            bez.lineWidth = pilot_pedals_imageView.frame.width * 0.01 * CGFloat(thinkness)
            color.setStroke()
            bez.stroke()
        default:
            print("No No NO!!!")
        }
        return bez
    }
}

enum Lines: Int {
    case from_copilot_slave_valve_left = 1
    case from_copilot_slave_valve_right = 2
    case from_pilot_slave_valve_left = 3
    case from_pilot_slave_valve_right = 4
    case from_left_slave_valve_barking_unit = 5
    case from_right_slave_valve_barking_unit = 6
    case from_braking_valve_left_brake = 7
    case from_braking_valve_right_brake = 8
}
