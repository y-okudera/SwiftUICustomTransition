//
//  TodayItem.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import SwiftUI

struct TodayItem: Identifiable {

    var id = UUID().uuidString
    var title: String
    var category: String
    var overlay: String
    var text: String
    var contentImage: String
    var logo: String
}

// MARK: - Dummy items
extension TodayItem {
    static var items = [
        TodayItem(
            title: "Mg Money",
            category: "お金の管理を始めよう",
            overlay: "MANAGE YOUR MONEY",
            text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
            contentImage: "back1",
            logo: "logo1"
        ),
        TodayItem(
            title: "Stst",
            category: "Street Car Racing Game",
            overlay: "GAME OF THE DAY",
            text: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\nUt enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.",
            contentImage: "back2",
            logo: "logo2"
        ),
    ]
}
