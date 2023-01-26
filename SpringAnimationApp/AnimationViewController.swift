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
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: UILabel!
    @IBOutlet var delayLabel: UILabel!
    
    // MARK: - Private Properties
    private var preset: String = "pop"
    private var curve: String = "easeIn"
    private var force: CGFloat = 1
    private var duration: CGFloat = 1
    private var delay: CGFloat = 0
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        getRandomAnimationValues()
        updateLabels()
        setAnimationView()
    }
    
    // MARK: - IB Action
    @IBAction func runButtonAction(_ sender: SpringButton) {
        updateLabels()
        
        setupAnimation(for: animationView)
        
        getRandomAnimationValues()
        
        changeButtonTitle(button: sender)
    }
    
    // MARK: - Private Methods
    private func getRandomAnimationValues() {
        preset = AnimationPreset.allCases.randomElement()?.rawValue ?? "pop"
        curve = AnimationCurve.allCases.randomElement()?.rawValue ?? "easeIn"
        force = CGFloat.random(in: 0...1.5)
        duration = CGFloat.random(in: 0...1.5)
        delay = CGFloat.random(in: 0...0.5)
    }
    
    private func updateLabels() {
        presetLabel.text = preset
        curveLabel.text = curve
        forceLabel.text = String(format: "%.2f", force)
        durationLabel.text = String(format: "%.2f", duration)
        delayLabel.text = String(format: "%.2f", delay)
    }
    
    private func setupAnimation(for view: SpringView) {
        view.animation = preset
        view.curve =  curve
        view.force = force
        view.duration = duration
        view.delay = delay
        view.animate()
    }
    
    private func setAnimationView() {
        animationView.layer.cornerRadius = 10
    }
    
    private func changeButtonTitle(button: SpringButton) {
        button.setTitle("Run \(preset)", for: .normal)
    }
    
}
