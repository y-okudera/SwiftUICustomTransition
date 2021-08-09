//
//  ShareSheet.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/10.
//

import SwiftUI

struct ShareSheet: UIViewControllerRepresentable {

    typealias Callback = (_ activityType: UIActivity.ActivityType?, _ completed: Bool, _ returnedItems: [Any]?, _ error: Error?) -> Void

    let activityItems: [Any]
    let applicationActivities: [UIActivity]? = nil
    let excludedActivityTypes: [UIActivity.ActivityType]?
    let callback: Callback? = nil

    init(activityItems: [Any],
         excludedActivityTypes: [UIActivity.ActivityType]? = [.message, .mail, .print, .assignToContact, .addToReadingList, .postToVimeo, .openInIBooks, .markupAsPDF]
    ) {
        self.activityItems = activityItems
        self.excludedActivityTypes = excludedActivityTypes
    }

    func makeUIViewController(context: Context) -> UIActivityViewController {
        let controller = UIActivityViewController(
            activityItems: activityItems,
            applicationActivities: applicationActivities)
        controller.excludedActivityTypes = excludedActivityTypes
        controller.completionWithItemsHandler = callback
        return controller
    }

    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {

    }
}
