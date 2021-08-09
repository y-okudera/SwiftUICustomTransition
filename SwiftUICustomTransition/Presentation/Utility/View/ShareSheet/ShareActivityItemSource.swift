//
//  ShareActivityItemSource.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/10.
//

import LinkPresentation

final class ShareActivityItemSource: NSObject, UIActivityItemSource {

    var shareText: String
    var shareImage: UIImage
    var linkMetaData = LPLinkMetadata()

    init(shareText: String, shareImage: UIImage) {
        self.shareText = shareText
        self.shareImage = shareImage
        linkMetaData.title = shareText
        super.init()
    }

    func activityViewControllerPlaceholderItem(_ activityViewController: UIActivityViewController) -> Any {
        return UIImage(named: "AppIcon") as Any
    }

    func activityViewController(_ activityViewController: UIActivityViewController, itemForActivityType activityType: UIActivity.ActivityType?) -> Any? {
        guard let activityType = activityType else {
            return nil
        }
        switch activityType {
        case .postToFacebook, .saveToCameraRoll:
            return shareImage
        default:
            return shareText
        }
    }

    func activityViewControllerLinkMetadata(_ activityViewController: UIActivityViewController) -> LPLinkMetadata? {
        return linkMetaData
    }
}
