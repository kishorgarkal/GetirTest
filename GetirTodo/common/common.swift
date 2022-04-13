//
//  common.swift
//  GetirTodo
//
//  Created by kishor garkal on 04/04/22.
//

import Foundation
import UIKit

//func alertView (title: String,message:String){
//    let alertController = UIAlertController(title: "Add List Item", message: "Add an item that you need to do.", preferredStyle: .alert)
//
//    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
//
//    let okAction = UIAlertAction(title: "OK", style: .default) { [weak] _ in
//        guard let textField = alertController.textFields?.first, let text = textField.text  else {
//            // execute code if textField doesn't exist
//            return
//        }
//
//      //  viewModel.addListItem(with: text)
//      //  tableView.reloadData()
//    }
//
//    alertController.addTextField { textField in
//        textField.placeholder = "List item..."
//    }
//
//    alertController.addAction(cancelAction)
//    alertController.addAction(okAction)
//
//    present(alertController, animated: true)
//}

public func showAlertMessage(vc: UIViewController, titleStr:String, messageStr:String) -> Void {
    let alert = UIAlertController(title: titleStr, message: messageStr, preferredStyle: UIAlertController.Style.alert);
    vc.present(alert, animated: true, completion: nil)
}
