//
//  ViewController.swift
//  AsyncBug
//
//  Created by fawad on 10/02/2017.
//
//

import Foundation
import UIKit
import AsyncDisplayKit

class ViewController: UIViewController {
  
  var collectionNode: ASCollectionNode!
  let flowLayout = UICollectionViewFlowLayout()
  var scrollIndex = 0 // 
  
  override func loadView() {
    
    view = UIView(frame: UIScreen.main.bounds)
    view.backgroundColor = .white
    
    flowLayout.scrollDirection = .horizontal
    flowLayout.minimumInteritemSpacing = 0.0
    flowLayout.minimumLineSpacing = 0.0
    flowLayout.sectionInset = .zero
    flowLayout.headerReferenceSize = .zero
    flowLayout.footerReferenceSize = .zero
    
    collectionNode = ASCollectionNode(collectionViewLayout: flowLayout)
    collectionNode.frame = view.frame
    collectionNode.view.isPagingEnabled = true
    collectionNode.dataSource = self
    collectionNode.delegate = self
    collectionNode.layer.borderWidth = 1.0
    collectionNode.layer.borderColor = UIColor.red.cgColor
    view.addSubnode(collectionNode)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    automaticallyAdjustsScrollViewInsets = false
    
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    collectionNode.frame = view.bounds
    let indexPath = IndexPath(row: scrollIndex, section: 0)
    collectionNode.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
  }
  
}

extension ViewController: ASCollectionDataSource {
  
  func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
    return 1
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
    
    return  {
      let cell = HomeCellNode()
      cell.titleText = "\(indexPath.row)"
      return cell
    }
  }
  
  func collectionNode(_ collectionNode: ASCollectionNode, constrainedSizeForItemAt indexPath: IndexPath) -> ASSizeRange {
    return ASSizeRangeMake(view.bounds.size)
  }
}

extension ViewController: ASCollectionDelegate {
  
  func calculateScrollIndex(scrollView: UIScrollView) {
    scrollIndex = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
  }
  
  func scrollViewWillBeginDecelerating(_ scrollView: UIScrollView) {
    calculateScrollIndex(scrollView: scrollView)
  }
  
  func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    calculateScrollIndex(scrollView: scrollView)
  }
}

