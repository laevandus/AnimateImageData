//
//  ContentView.swift
//  AnimateImageData
//
//  Created by Toomas Vahter on 26.08.2019.
//  Copyright © 2019 Augmented Code. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var imageAnimator: ImageAnimator
    
    var body: some View {
        ZStack {
            if imageAnimator.image != nil {
                Image(imageAnimator.image!, scale: 1.0, label: Text("Gif"))
            }
            else {
                Text("Paused")
            }
        }.onAppear {
            self.imageAnimator.startAnimating()
        }.onDisappear {
            self.imageAnimator.stopAnimating()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let url = Bundle.main.url(forResource: "Cat", withExtension: "gif")!
    static let animator = ImageAnimator(imageURL: url)
    
    static var previews: some View {
        ContentView(imageAnimator: animator).onAppear {
            animator.startAnimating()
        }
    }
}
