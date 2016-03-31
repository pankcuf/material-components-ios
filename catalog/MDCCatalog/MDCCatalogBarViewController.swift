/*
Copyright 2016-present Google Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import UIKit
import MaterialComponents

class MDCCatalogBarViewController: UIViewController {

  internal let catalogBar = MDCCatalogBar(frame: CGRectZero)
  var contentViewController = UIViewController()

  init(contentViewController: UIViewController, title: String, delegate: MDCCatalogBarDelegate) {
    super.init(nibName: nil, bundle: nil)

    self.contentViewController = contentViewController
    self.addChildViewController(contentViewController)

    catalogBar.title = title
    catalogBar.delegate = delegate
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
  }

  override func viewDidLoad() {
    self.view.addSubview(contentViewController.view)
    self.view.addSubview(catalogBar)
    contentViewController.didMoveToParentViewController(self)

    let catalogBarHeight = CGFloat(52)
    let catalogBarRect = CGRectMake(0,
      self.view.frame.size.height - catalogBarHeight,
      self.view.frame.size.width,
      catalogBarHeight);
    catalogBar.frame = catalogBarRect
    catalogBar.autoresizingMask = [.FlexibleTopMargin, .FlexibleWidth]

    contentViewController.view.frame =
      CGRectMake(0,
        0,
        self.view.bounds.size.width,
        self.view.bounds.size.height - catalogBarHeight);
    contentViewController.view.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
  }

}