//
//  LetterTile.swift
//  LetterTile
//
//  Created by Devon Winquist on 4/10/24.
//

import SwiftUI

struct LetterTile: View {
    let letter: String
    let color: Color
    @State private var isFlipped = true
    
    var body: some View {
        Text(letter)
            .font(.title)
            .frame(width: 60, height: 60)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(8)
            .rotation3DEffect(
                .degrees(isFlipped ? 0 : 90),
                axis: (x: 0.0, y: 1.0, z: 0.0)
            )
            .opacity(isFlipped ? 1.0 : 0.0)
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 0.5).delay(Double.random(in: 0.1...1.0))) {
                    isFlipped = true
                }
            }
    }
}
