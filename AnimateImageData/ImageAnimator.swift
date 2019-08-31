//
//  ImageAnimator.swift
//  AnimateImageData
//
//  Created by Toomas Vahter on 26.08.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import Combine
import UIKit

final class ImageAnimator: ObservableObject {
    private let scheduler: ImageFrameScheduler
    
    init(imageURL: URL) {
        self.scheduler = ImageFrameScheduler(url: imageURL)
    }
    
    @Published var image: CGImage?
    
    func startAnimating() {
        let isRunning = scheduler.start { [weak self] (index, image) in
            self?.image = image
        }
        if isRunning == false {
            print("Failed animate image at url \(scheduler.imageURL)")
        }
    }
    
    func stopAnimating() {
        scheduler.stop()
    }
}
