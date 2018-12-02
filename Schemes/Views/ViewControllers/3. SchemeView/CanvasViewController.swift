//
//  SchemeViewController.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 15/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import UIKit

class CanvasViewController: UIViewController, UIScrollViewDelegate {

    var canvasModel: CanvasViewModelType?
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet{
            scrollView.minimumZoomScale = 0.5
            scrollView.maximumZoomScale = 5
            scrollView.delegate = self
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        guard let model = canvasModel else { return UIView() }
        return model.getCanvasView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let model = canvasModel else { return }
        self.navigationItem.title = model.getCanvasName()
        
//        let size = CGSize(width: 1000, height: 1000)
//        scrollView.contentSize = size
        scrollView.contentSize = model.getCanvasSize()
        addCanvasViewToScrollView()

        // Do any additional setup after loading the view.
    }

    private func addCanvasViewToScrollView() {
        guard let model = canvasModel else { return }
        scrollView.addSubview(model.getCanvasView())
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
