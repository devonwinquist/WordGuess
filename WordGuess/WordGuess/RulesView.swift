//
//  RulesView.swift
//  RulesView
//
//  Created by Devon Winquist on 4/10/24.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.presentationMode) var presentationMode
    
    let examples: [(String, String)] = [
        ("SPADE", "The letter **S** is in the word and in the correct spot"),
        ("QUERY", "The letter **E** is in the word but in the wrong spot"),
        ("MIGHT", "The letter **H** is not in the word in any spot")
    ]
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("""
Guess the word in 6 tries or less.

Each guess must be a 5-letter word. Hit the enter button to submit.

After each guess, the color of the tiles will change to show how close your guess was to the word.
""")
                Divider()
                
                Text("**Examples**")
                
                VStack(alignment: .leading) {
                    ForEach(examples, id: \.0) { example in
                        ExampleTile(word: example.0, description: example.1)
                    }
                }
                
                Divider()
            
                Spacer()
            }
            .frame(width: min(UIScreen.main.bounds.width - 40, 350))
            .navigationTitle("HOW TO PLAY")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                    }
                }
            }
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}

struct ExampleTile: View {
    let word: String
    let description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 4) {
                ForEach(word.map { String($0) }, id: \.self) { letter in
                    Text(letter)
                        .font(.title)
                        .frame(width: 50, height: 50)
                        .background(background(for: letter))
                        .foregroundColor(.white)
                        .cornerRadius(6)
                }
            }
            Text(description)
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(.vertical, 8)
    }
    
    func background(for letter: String) -> Color {
        switch (word, letter) {
        case ("SPADE", "S"):
            return .green
        case ("SPADE", _):
            return Color.gray.opacity(1)
        case ("QUERY", "E"):
            return .yellow
        case ("QUERY", _):
            return Color.gray.opacity(1)
        case ("MIGHT", "H"):
            return Color.gray.opacity(1)
        case ("MIGHT", _):
            return Color.gray.opacity(0.5)
        default:
            return Color.gray.opacity(1)
        }
    }
}
