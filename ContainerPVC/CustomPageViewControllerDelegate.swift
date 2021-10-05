//
//  CustomPageViewControllerDelegate.swift
//  ContainerPVC
//
//  Created by Юлия Караневская on 5.10.21.
//

import Foundation

protocol CustomPageViewControllerDelegate: AnyObject {
  func numberOfPage(numberOfPage: Int)
  func pageChangedTo(index: Int)
}
