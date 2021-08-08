//
//  TabBarViewController.swift
//  SwiftUICustomTransition
//
//  Created by Yuki Okudera on 2021/08/08.
//

import UIKit

final class TabBarViewController: UIViewController, SwiftUICompatible {

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubSwiftUIView(TabBar(), to: view)
    }
}
