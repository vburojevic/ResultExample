//
//  MainPresenter.swift
//  ResultExample
//
//  Created by Vedran Burojevic on 26/09/2016.
//  Copyright (c) 2016 Infinum. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class MainPresenter: NSObject {
    
    // MARK: - Private properties -

    private weak var _view: MainViewInterface?
    private var _wireframe: MainWireframeInterface
    
    // MARK: - Lifecycle -
    
    init (wireframe: MainWireframeInterface, view: MainViewInterface) {
        _wireframe = wireframe
        _view = view
    }

    // MARK: - Private functions -
    
}

// MARK: - Extensions -

extension MainPresenter: MainViewDelegateInterface {
    
    func didSelectNavigationAction(action: MainNavigationAction) {
        _wireframe.performNavigationAction(action)
    }
    
}
