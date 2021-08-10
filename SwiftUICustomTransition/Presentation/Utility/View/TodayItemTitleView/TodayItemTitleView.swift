//
//  TodayItemTitleView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/09.
//

import SwiftUI

struct TodayItemTitleView: View {

    private var item: TodayItem
    private var animation: Namespace.ID
    private var isSource: Bool

    init(item: TodayItem, animation: Namespace.ID, isSource: Bool = true) {
        self.item = item
        self.animation = animation
        self.isSource = isSource
    }
    
    var body: some View {
        HStack {
            Image(item.logo)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(15)

            VStack(alignment: .leading, spacing: 6) {
                Text(item.title)
                    .fontWeight(.bold)

                Text(item.category)
                    .font(.caption)
                    .foregroundColor(.gray)
            }

            Spacer(minLength: 0)

            VStack {
                Button(action: {}) {
                    Text("GET")
                        .fontWeight(.bold)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 25)
                        .background(Color.primary.opacity(0.1))
                        .clipShape(Capsule())
                }

                Text("In App Purchases")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .matchedGeometryEffect(id: "content" + item.id, in: animation, isSource: isSource)
        .padding()
    }
}

struct TodayItemTitleView_Previews: PreviewProvider {
    @Namespace static var animation

    static var previews: some View {
        TodayItemTitleView(
            item: TodayItem(
                title: "Mg Money",
                category: "お金の管理を始めよう",
                overlay: "",
                text: "",
                contentImage: "",
                logo: "logo1"
            ),
            animation: animation
        )
    }
}
