//
//  ViewController.swift
//  blankswiftapp
//
//  Created by BananaCoder on 16/11/2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var sample_btn: UIButton!
    let gradientLayer = CAGradientLayer()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector: #selector(AppBecomeActive), name: UIApplication.didBecomeActiveNotification, object: nil)
        
        SetUpUI()
        sample_btn.addTarget(self, action: #selector(ButtonTapped), for: .touchUpInside)
    }
    
    private func SetUpUI() {
        sample_btn.layer.cornerRadius = sample_btn.frame.height/2.2
        sample_btn.layer.borderWidth = 2
        sample_btn.setTitle("  hello  ", for: .normal)
        sample_btn.setTitleColor(UIColor.blue, for: .highlighted)

        gradientLayer.frame = view.bounds
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.gray.cgColor, UIColor.black.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1 )
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func animatedGradientBackground() {
        let firstColor = UIColor.random().cgColor
        let secondColor = UIColor.random().cgColor
        let thirdColor = UIColor.random().cgColor
        
        
        let colorAnimation = CABasicAnimation(keyPath: "colors")
        colorAnimation.fromValue = [firstColor, secondColor, thirdColor]
        colorAnimation.toValue = [secondColor, thirdColor, firstColor]
        colorAnimation.duration = 3.0
        colorAnimation.autoreverses = true
        colorAnimation.repeatCount = .infinity
        
        gradientLayer.add(colorAnimation, forKey: "gradientColorChange")
    }
    
    @objc func AppBecomeActive() {
        animatedGradientBackground()
    }
    
    @objc func ButtonTapped() {
        print("button tapped")
        // button animated
        UIView.animate(withDuration: 0.2, animations: {
            self.sample_btn.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
        }) { (_) in
            UIView.animate(withDuration: 0.1) {
                self.sample_btn.transform = CGAffineTransform.identity
            }
        }
    }
    
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}
