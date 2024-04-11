import SwiftUI

struct KeyboardView: View {
    let guessAction: (String) -> Void
    let enterAction: () -> Void
    let deleteAction: () -> Void
    
    let keyboardLayout: [[String]] = [
        ["Q", "W", "E", "R", "T", "Y", "U", "I", "O", "P"],
        ["A", "S", "D", "F", "G", "H", "J", "K", "L"],
        ["ENTER", "Z", "X", "C", "V", "B", "N", "M", "⌫"],
    ]
    
    var body: some View {
        Spacer()
        VStack(spacing: 6) {
            ForEach(keyboardLayout, id: \.self) { row in
                HStack(spacing: 4) {
                    ForEach(row, id: \.self) { letter in
                        Button(action: {
                            if letter == "⌫" {
                                deleteAction()
                            } else if letter == "ENTER" {
                                enterAction()
                            } else {
                                guessAction(letter)
                            }
                        }) {
                            Text(letter)
                                .font(letter == "ENTER" ? .system(size: 12) : .title3.bold()) // Adjust font size
                                .frame(width: letter == "⌫" || letter == "ENTER" ? 50 : 35, height: 50)
                                .background(Color.gray.opacity(0.5))
                                .foregroundColor(.black)
                                .cornerRadius(5)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}
