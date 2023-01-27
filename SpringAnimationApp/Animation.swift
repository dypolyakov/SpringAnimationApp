//
//  Animation.swift
//  SpringAnimationApp
//
//  Created by Dmitry Polyakov on 27.01.2023.
//

class Animation {
    let preset: String
    let curve: String
    let force: Double
    let duration: Double
    let delay: Double
    
    var description: String {
        """
        preset: \(preset)
        curve: \(curve)
        force: \(String(format: "%.2f", force))
        duration: \(String(format: "%.2f", duration))
        delay: \(String(format: "%.2f", delay))
        """
    }
    
    init(preset: String,
         curve: String,
         force: Double,
         duration: Double,
         delay: Double
    ) {
        self.preset = preset
        self.curve = curve
        self.force = force
        self.duration = duration
        self.delay = delay
    }
}

extension Animation {
    static func getRandomAnimations() -> Animation {
        Animation(
            preset: DataStore.shared.presets.randomElement()?.rawValue ?? "pop",
            curve: DataStore.shared.curves.randomElement()?.rawValue ?? "easeIn",
            force: Double.random(in: 0.3...1.5),
            duration: Double.random(in: 0.3...1),
            delay: Double.random(in: 0...0.5)
        )
    }
}
