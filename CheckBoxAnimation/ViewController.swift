//
//  ViewController.swift
//  CheckBoxAnimation
//
//  Created by Sneha Harke on 09/08/19.
//  Copyright © 2019 Sneha Harke. All rights reserved.
//  NOTE : To see result tap on screen.

import UIKit

class ViewController: UIViewController {
    let shapeCircle = CAShapeLayer()
    let shapeLine = CAShapeLayer()
    
    @IBOutlet weak var checkBoxView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Circle drawing
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: checkBoxView.frame.width/2, y: checkBoxView.frame.height/2), radius: 80, startAngle: -(CGFloat.pi/2), endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeCircle.path = circularPath.cgPath
        shapeCircle.lineWidth = 10
        shapeCircle.strokeColor = UIColor.green.cgColor
        shapeCircle.fillColor = UIColor.clear.cgColor
        shapeCircle.strokeEnd = 0
        shapeCircle.lineCap = .round
        checkBoxView.layer.addSublayer(shapeCircle)
        
        // Line drawing
        let checkMarkPath = UIBezierPath()
        checkMarkPath.move(to: CGPoint(x: 55, y: 88))
        checkMarkPath.addLine(to:CGPoint(x: 84, y: 120))
        checkMarkPath.addLine(to: CGPoint(x: 140, y: 75))
        
        shapeLine.path = checkMarkPath.cgPath
        shapeLine.lineWidth = 10
        shapeLine.strokeEnd = 0
        shapeLine.fillColor = UIColor.clear.cgColor
        shapeLine.strokeColor = UIColor.green.cgColor
        shapeLine.lineCap = .round
        checkBoxView.layer.addSublayer(shapeLine)
        
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(animate)))
        
    }
    @objc func animate() {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.toValue = 1
        animation.fromValue = 0
        animation.duration = 2
        animation.fillMode = .forwards
        animation.isRemovedOnCompletion = false
        shapeCircle.add(animation, forKey: "circleAnimation")
        
        let animateLine = CABasicAnimation(keyPath: "strokeEnd")
        animateLine.toValue = 1
        animateLine.fromValue = 0
        animateLine.duration = 1.6
        animateLine.fillMode = .forwards
        animateLine.isRemovedOnCompletion = false
        shapeLine.add(animateLine, forKey: "lineAnimation")
    }
    
}
