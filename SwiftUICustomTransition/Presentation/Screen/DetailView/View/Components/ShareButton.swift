//
//  ShareButton.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/10.
//

import SwiftUI

struct ShareButton: View {

    private let action: (() -> Void)

    init(action: @escaping () -> Void) {
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            Label(title: {
                Text("Share")
                    .foregroundColor(.primary)
            }) {
                Image(systemName: "square.and.arrow.up.fill")
                    .font(.title2)
                    .foregroundColor(.primary)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 25)
            .background(Color.primary.opacity(0.1))
            .cornerRadius(10)
        }
    }
}

struct ShareButton_Previews: PreviewProvider {
    static var previews: some View {
        ShareButton(action: {})
    }
}
