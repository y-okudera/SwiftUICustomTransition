//
//  CloseButton.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/10.
//

import SwiftUI

struct CloseButton: View {
    
    private let action: (() -> Void)
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        Button(action: action) {
            Image(systemName: "xmark")
                .foregroundColor(.black.opacity(0.7))
                .padding()
                .background(Color.white.opacity(0.8))
                .frame(width: 35, height: 35)
                .clipShape(Circle())
        }
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton(action: {})
    }
}
