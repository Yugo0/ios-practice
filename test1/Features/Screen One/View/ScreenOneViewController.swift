//
//  ScreenOneViewController.swift
//  test1
//
//  Created by Letnja Praksa 5 on 19.7.21..
//

import UIKit

class ScreenOneViewController: UIViewController {
    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var infoTextField: UITextField!
    
    private var nameObserver: NSKeyValueObservation!
    private let viewModel: ScreenOneViewModel = ScreenOneViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helloWorldLabel.textColor = UIColor.systemRed
        
        observeLiveData();
        viewModel.onViewDidLoad()
    }
    
    private func observeLiveData() {
        nameObserver = viewModel.observe(\.name, options: .new) { _, name  in
            if let name = name.newValue {
                self.helloWorldLabel.text = name
            }
        }
    }
    
    @IBAction func onTextChangeAction(_ sender: UITextField) {
        helloWorldLabel.text = sender.text
    }
    
    @IBAction func onButtonTapped(_ sender: UIButton) {
        navigationController!.show(ScreenTwoViewController(), sender: nil)
    }
}
