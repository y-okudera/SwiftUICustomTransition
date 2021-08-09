//
//  TabBarView.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct TabBarView: View {

    @Namespace var animation
    @StateObject private var detailObject = DetailViewModel()
    @State private var selectedIndex: Int = 0

    var body: some View {
        ZStack {

            TabView(selection: $selectedIndex) {
                TodayView(animation: animation)
                    .environmentObject(detailObject)
                    .tabItem("Today", image: UIImage(named: "today"))
                Text("Games")
                    .tabItem("Games", image: UIImage(named: "games"))
                Text("Apps")
                    .tabItem("Apps", image: UIImage(named: "apps"))
                Text("Search")
                    .tabItem("Search", image: UIImage(named: "search"))
            }
            .opacity(detailObject.isShown ? 0 : 1) // detailObject表示時はタブを非表示にする

            if detailObject.isShown {
                DetailView(viewModel: detailObject, animation: animation)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
