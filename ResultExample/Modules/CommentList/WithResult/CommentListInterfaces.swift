//
//  CommentListInterfaces.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 27/09/2016.
//  Copyright (c) 2016 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import Foundation
import UIKit
import Result

// MARK: - Navigation -

enum CommentListNavigationAction {
}

// MARK: - CommentList Wireframe Interface -

protocol CommentListWireframeInterface: WireframeInterface {
    func performNavigationAction(action: CommentListNavigationAction)
    func configureModuleWith(viewController: CommentListViewController)
}

// MARK: - CommentList View Interface -

protocol CommentListViewInterface: ViewInterface, Progressable {
    func reloadData()
}

// MARK: - CommentList View Presenter (Delegate) Interface -

protocol CommentListViewDelegateInterface: PresenterInterface {
    func didSelectNavigationAction(action: CommentListNavigationAction)
    func numberOfItems() -> Int
    func itemAtIndexPath(indexPath: NSIndexPath) -> CommentCellItem
}

// MARK: - CommentList Interactor Interface -

protocol CommentListInteractorInterface: InteractorInterface {
    func loadUsers(withResultHandler resultHandler: (Result<[Comment], NetworkError>) -> ())
}