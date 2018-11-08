//
//  ViewController.swift
//  MPModalView
//
//  Created by cyrus86 on 11/06/2018.
//  Copyright (c) 2018 cyrus86. All rights reserved.
//

import UIKit
import MPModalView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtons()
    }

    func setupButtons() {
        let btnOkModal = UIButton(type: .roundedRect)
        btnOkModal.setTitle("with OK button", for: .normal)
        let btnOkCancelModal = UIButton(type: .roundedRect)
        btnOkCancelModal.setTitle("with OK&Cancel buttons", for: .normal)
        let btnNoBtnModal = UIButton(type: .roundedRect)
        btnNoBtnModal.setTitle("without buttons", for: .normal)

        btnOkModal.addTarget(self, action: #selector(showOKBtnModal(sender:)), for: .touchUpInside)
        btnOkCancelModal.addTarget(self, action: #selector(showOKCancelBtnModal(sender:)), for: .touchUpInside)
        btnNoBtnModal.addTarget(self, action: #selector(showNOBtnModal(sender:)), for: .touchUpInside)

        let stackView = UIStackView(frame: CGRect(x: 0, y: 0, width: 120, height: 350))
        stackView.addArrangedSubview(btnOkModal)
        stackView.addArrangedSubview(btnOkCancelModal)
        stackView.addArrangedSubview(btnNoBtnModal)
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 10
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

    @objc func showOKBtnModal(sender: UIButton) {
        let modal = MPModalViewController(actionButtons: [ActionButton(type: .ok)],
                              contentView: .text(title: "Modal", body: "with one OK button"))
        modal.presentOnTop()
    }

    @objc func showOKCancelBtnModal(sender: UIButton) {
        let modal = MPModalViewController(actionButtons: [ActionButton(type: .cancel, { self.dismiss(animated: true) }),
                                              ActionButton(type: .ok)],
                              contentView: .text(title: "Modal", body: "with OK & Cancel button"))
        modal.presentOnTop()
    }

    @objc func showNOBtnModal(sender: UIButton) {
        let modal = MPModalViewController(actionButtons: [],
                              contentView: .text(title: "Modal", body: "without buttons"))
        modal.presentOnTop()
    }
}

