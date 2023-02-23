//
//  MyOwnTable.swift
//  Week2-LearnUITableView
//
//  Created by Alief Ahmad Azies on 22/02/23.
//

import Foundation
import UIKit

// ini supayah si ordercell muncul, gatau gmn alief yang maenin

class MyOwnTableView: UITableView {
override var intrinsicContentSize: CGSize {
   self.layoutIfNeeded()
   return self.contentSize
}

override var contentSize: CGSize {
   didSet{
       self.invalidateIntrinsicContentSize()
   }
}

override func reloadData() {
   super.reloadData()
   self.invalidateIntrinsicContentSize()
}
}
