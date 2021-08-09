//
//  ViewControllerHolder.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/10.
//

import SwiftUI

struct ViewControllerHolder {
    weak var value: UIViewController?
}

struct ViewControllerKey: EnvironmentKey {

    static var defaultValue: ViewControllerHolder {
        ViewControllerHolder(value: UIApplication.shared.windows.first?.rootViewController)
    }
}

extension EnvironmentValues {
    var viewController: UIViewController? {
        get {
            self[ViewControllerKey.self].value
        }
        set {
            self[ViewControllerKey.self].value = newValue
        }
    }
}

extension UIViewController {
    func present<Content: View>(backgroundColor: UIColor = UIColor.black.withAlphaComponent(0.5), @ViewBuilder builder: () -> Content) {
        let toPresent = UIHostingController(rootView: AnyView(EmptyView()))
        toPresent.view.backgroundColor = backgroundColor
        toPresent.modalPresentationStyle = .overCurrentContext
        toPresent.modalTransitionStyle = .coverVertical
        toPresent.rootView = AnyView(
            builder()
                .environment(\.viewController, toPresent)
        )
        present(toPresent, animated: true)
    }
}
