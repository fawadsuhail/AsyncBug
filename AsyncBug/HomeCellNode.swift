//
//  HomeCellNode.swift
//  AsyncBug
//
//  Created by fawad on 10/02/2017.
//
//

import Foundation
import AsyncDisplayKit

class HomeCellNode: ASCellNode {
  
  private let titleNode = ASTextNode()
  
  public var titleText: String? {
    didSet {
      guard let titleText = titleText else {
        return
      }
      
      let params = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 24.0),
                    NSForegroundColorAttributeName : UIColor.black]
      
      let attributedString = NSAttributedString(string: titleText, attributes: params)
      titleNode.attributedText = attributedString
      
    }
  }
  
  override init() {
    super.init()
    addSubnode(titleNode)
  }
  
  override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
    let centerSpec = ASCenterLayoutSpec()
    centerSpec.child = titleNode
    centerSpec.centeringOptions = .XY
    return centerSpec
  }
  
}
