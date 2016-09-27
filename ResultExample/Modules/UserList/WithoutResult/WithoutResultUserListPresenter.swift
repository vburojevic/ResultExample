//
//  WithoutResultUserListPresenter.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright (c) 2016 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class WithoutResultUserListPresenter: NSObject {
    
    // MARK: - Private properties -

    private weak var _view: UserListViewInterface?
    private var _interactor: WithoutResultUserListInteractor
    private var _wireframe: UserListWireframeInterface
    
    private var _items = [UserCellItem]()
    
    // MARK: - Lifecycle -
    
    init (wireframe: UserListWireframeInterface, view: UserListViewInterface, interactor: WithoutResultUserListInteractor) {
        _wireframe = wireframe
        _view = view
        _interactor = interactor
    }

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension WithoutResultUserListPresenter: UserListViewDelegateInterface {
    
    func viewDidLoad() {
        _view?.showLoading()
        _interactor.loadUsers(withSuccess: { [weak self] users in
            let userCellItems = users.map { UserCellItem(user: $0) }
            self?._items.appendContentsOf(userCellItems)
            self?._view?.reloadData()
            self?._view?.hideLoading()
        }, failure: { [weak self] networkError in
            self?._view?.hideWithError(message: networkError.message)
        })
    }
    
    func didSelectNavigationAction(action: UserListNavigationAction) {
        _wireframe.performNavigationAction(action)
    }
    
    func numberOfItems() -> Int {
        return _items.count
    }
    
    func itemAtIndexPath(indexPath: NSIndexPath) -> UserCellItem {
        return _items[indexPath.row]
    }
    
}
