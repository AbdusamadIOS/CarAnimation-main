//
//  CarAnimationVC.swift
//  mapLearning
//
//  Created by O'ral Nabiyev on 26/02/24.
//

import UIKit

class CarAnimationVC: UIViewController {
    
    @IBOutlet weak var carContainerView: UIView!
    @IBOutlet weak var carImg: UIImageView!
    @IBOutlet var wheelsImg: [UIImageView]!
    @IBOutlet var buttonView: [UIView]! {
        didSet {
            for i in buttonView.enumerated() {
                i.element.layer.cornerRadius = 28
                i.element.layer.borderWidth = 1
                i.element.layer.borderColor = #colorLiteral(red: 0.4123783112, green: 0.7254629731, blue: 0.7203043103, alpha: 1)
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        carAnimation()
    }
    
    func carAnimation() {
        
        carContainerView.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.width, y: 0)
        
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 1.3
        
        
        UIView.animateKeyframes(withDuration: 1.3, delay: 0) { [self] in
            for i in wheelsImg.enumerated() {
                i.element.image = UIImage(named: "wheel")
            }
            
            for i in self.wheelsImg.enumerated() {
                i.element.layer.add(fullRotation, forKey: "720")
            }
            self.carContainerView.transform = CGAffineTransform(translationX: 0, y: 0)
        }
        
    }
    
    @IBAction func leftTapped(_ sender: Any) {
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.toValue = NSNumber(floatLiteral: Double(-CGFloat.pi * 2))
        fullRotation.duration = 1.3
        
        UIView.animateKeyframes(withDuration: 1.3, delay: 0) { [self] in
            for i in wheelsImg.enumerated() {
                i.element.image = UIImage(named: "wheel")
            }
            
            for i in self.wheelsImg.enumerated() {
                i.element.layer.add(fullRotation, forKey: "720")
            }
            carContainerView.transform = CGAffineTransform(translationX: self.carContainerView.frame.minX-UIScreen.main.bounds.width, y: 0)
        }
    }
    
    @IBAction func rightTapped(_ sender: Any) {
        
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 1.3
        
        UIView.animateKeyframes(withDuration: 1.3, delay: 0) { [self] in
            for i in wheelsImg.enumerated() {
                i.element.image = UIImage(named: "wheel")
            }
            
            for i in self.wheelsImg.enumerated() {
                i.element.layer.add(fullRotation, forKey: "720")
            }
            carContainerView.transform = CGAffineTransform(translationX: self.carContainerView.frame.minX+UIScreen.main.bounds.width, y: 0)
        }
        
    }
    

}
