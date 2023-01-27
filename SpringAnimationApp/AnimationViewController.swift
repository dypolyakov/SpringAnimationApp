//
//  ViewController.swift
//  SpringAnimationApp
//
//  Created by Dmitry Polyakov on 25.01.2023.
//

import UIKit
import SpringAnimation

final class AnimationViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet var animationView: SpringView!
    @IBOutlet var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.text = animation.description
        }
    }
    
    // MARK: - Private Properties
    private var animation = Animation.getRandomAnimations()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        animationView.layer.cornerRadius = 10
    }
    
    // MARK: - IB Action
    @IBAction func runButtonAction(_ sender: SpringButton) {
        descriptionLabel.text = animation.description
        
        animationView.animation = animation.preset
        animationView.curve =  animation.curve
        animationView.force = animation.force
        animationView.duration = animation.duration
        animationView.delay = animation.delay
        animationView.animate()
        
        animation = Animation.getRandomAnimations()
        
        sender.setTitle("Run \(animation.preset)", for: .normal)
    }
}
