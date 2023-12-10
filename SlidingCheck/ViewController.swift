//
//  ViewController.swift
//  SlidingCheck
//
//  Created by Gokul Gopalakrishnan on 09/12/23.
//

import UIKit

class ViewController: UIViewController {
    
    var SliderBox: UIView!
    var SliderBall: UIView!
    var SliderLabel: UILabel!
    
    var panGesture = UIPanGestureRecognizer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        setupDemoView()
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.panGestureAction(_:)))
        
        SliderBall.addGestureRecognizer(panGesture)
        
    }

    func setupDemoView() {
        SliderBox = UIView(frame: .zero)
        SliderBox.backgroundColor = UIColor(red: 0, green: 0, blue: 255, alpha: 0.25)
        SliderBox.layer.borderWidth = 1
        SliderBox.layer.borderColor = UIColor.blue.cgColor
        SliderBox.layer.cornerRadius = 35
        SliderBox.layer.masksToBounds = false
        view.addSubview(SliderBox)
        SliderBox.translatesAutoresizingMaskIntoConstraints = false
        SliderBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        SliderBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        SliderBox.widthAnchor.constraint(equalToConstant: 300).isActive = true
        SliderBox.heightAnchor.constraint(equalToConstant: 70).isActive = true
      

        // shadow
        SliderBox.layer.shadowColor = UIColor.black.cgColor
        SliderBox.layer.shadowOffset = CGSize(width: 3, height: 3)
        SliderBox.layer.shadowOpacity = 0.7
        SliderBox.layer.shadowRadius = 6.0
        
        
        SliderBall = UIView(frame: .zero)
        SliderBall.backgroundColor = .brown
        SliderBall.layer.cornerRadius = 35
        SliderBox.addSubview(SliderBall)
        
        SliderBall.translatesAutoresizingMaskIntoConstraints = false
        SliderBall.widthAnchor.constraint(equalToConstant: 70).isActive = true
        SliderBall.heightAnchor.constraint(equalToConstant: 70).isActive = true
        SliderBall.isUserInteractionEnabled = true
      
        SliderLabel = UILabel(frame: .zero)
        SliderBox.addSubview(SliderLabel)
        SliderLabel.text = ">> Slide to Pay the price"
        SliderLabel.textAlignment = .right
        SliderLabel.translatesAutoresizingMaskIntoConstraints = false
        SliderLabel.leftAnchor.constraint(equalTo: SliderBox.leftAnchor, constant: -10).isActive = true
        SliderLabel.widthAnchor.constraint(equalToConstant: 300).isActive = true
        SliderLabel.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        
    }
    
    
    @objc func panGestureAction(_ sender: UIPanGestureRecognizer) {
            self.SliderBox.bringSubviewToFront(SliderBall)
            let translation = sender.translation(in: self.SliderBox)
        
        if (round(SliderBall.center.x + translation.x)) >= 34.0 && (round(SliderBall.center.x + translation.x)) <= 265.0 {
            sender.view?.center = CGPoint(x: SliderBall.center.x + translation.x, y: SliderBall.center.y)
        } else if (round(SliderBall.center.x + translation.x)) <= 34.0  {
            SliderBall.center.x = 35.0
        } else if (round(SliderBall.center.x + translation.x)) >= 265.0 {
            SliderBall.center.x = 265.0
        }
        
        if ( (round(SliderBall.center.x + translation.x)) >= 60.0) {
            SliderLabel.isHidden = true
        } else {
            SliderLabel.isHidden = false
        }
        
        if ( (round(SliderBall.center.x + translation.x)) > 200.0) {
            SliderBall.center.x = 265.0
            setAlert()
        }
        
        
            sender.setTranslation(CGPoint.zero, in: self.SliderBox)
        }
     
    
    func setAlert() {
        // Instantiating UIAlertController
           let alertController = UIAlertController(
                                   title: "Simple Alert",
                                   message: "This is an example of a simple alert message.",
                                   preferredStyle: .alert)

           // Handling OK action
           let okAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
               self.SliderBall.center.x = 34.0
               self.SliderLabel.isHidden = false
           }

           // Handling Cancel action
           let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action:UIAlertAction!) in
               self.SliderBall.center.x = 34.0
               self.SliderLabel.isHidden = false
           }

        
           // Adding action buttons to the alert controller
           alertController.addAction(okAction)
           alertController.addAction(cancelAction)

           // Presenting alert controller
           self.present(alertController, animated: true, completion:nil)
    }
    
    
}

