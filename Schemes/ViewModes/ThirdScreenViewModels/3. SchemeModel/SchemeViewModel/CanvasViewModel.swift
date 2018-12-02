//
//  CanvasViewModel.swift
//  Schemes
//
//  Created by Yaroslav Abaturov on 19/07/2018.
//  Copyright © 2018 Yaroslav Abaturov. All rights reserved.
//

import Foundation
import UIKit

class CanvasViewModel {
    private var canvasName: String?
    private var canvasEntity: CanvasEntity?
    private var schemeElementsArray = [SchemeEntity]()
    
    private var canvasView: CanvasView?
    
    private func setCanvasProperties() {
        let _canvasView_ = CanvasView()
        _canvasView_.canvasEntity = canvasEntity
        
        addGestures(toCanvasView: _canvasView_)

        self.canvasView = _canvasView_
    }
    
    private func palceSavedItems() {
        guard let _cEntity = canvasEntity else { return }
        for i in schemeElementsArray {
            let itemModel = ItemViewModel(canvasEntity: _cEntity, schemeEntity: i)
            let newItem = itemModel.getItemView()
            newItem.frame.origin = CGPoint(x: CGFloat(i.xPosition), y: CGFloat(i.yPosition))
            
            addGestures(toItemView: newItem)
            
            canvasView?.addSubview(newItem)
        }
    }
    
    //MARK: Gesture implemetation
    
    private func addGestures(toCanvasView canvasView: CanvasView) {
        let addTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.creationGestureAction(sender:)))
        addTapGesture.numberOfTapsRequired = 1
        
        canvasView.addGestureRecognizer(addTapGesture)
    }
    
    private func addGestures(toItemView itemView: ItemView) {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.tapGestureAction(sender:)))
        let deleteTapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.detetionGestureAction(sender:)))
        deleteTapGesture.numberOfTapsRequired = 2
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(self.panGestureAction(sender:)))
        //            let longPressGestureReecognizer = UILongPressGestureRecognizer(target: self, action: #selector(self.longGestureAction(sender:)))
        //            longPressGestureReecognizer.minimumPressDuration = CFTimeInterval(0.5)
        
        itemView.addGestureRecognizer(tapGesture)
        itemView.addGestureRecognizer(deleteTapGesture)
        itemView.addGestureRecognizer(panGestureRecognizer)
        //            newItem.addGestureRecognizer(longPressGestureReecognizer)
    }
    
    @objc private func creationGestureAction(sender: UIGestureRecognizer) {
        
        let point = sender.location(in: canvasView)
        if sender.view?.tag == 1 {
            guard let _cEntity = canvasEntity else { return }
            let itemModel = ItemViewModel(canvasEntity: _cEntity, schemeEntity: nil)
            
            let newItem = itemModel.getItemView()
            addGestures(toItemView: newItem)
            
            newItem.center = point

            canvasView?.addSubview(newItem)
        } else {
            print("CanvasViewModel msg / 'creationGestureAction' mthd: tap gesture detected, but it is not a canvas")
        }
    }
    
    @objc private func tapGestureAction(sender: UIGestureRecognizer) {
        print("item \(String(describing: sender.view)) tapped")
    }

    @objc private func detetionGestureAction(sender: UIGestureRecognizer) {
        if let view = sender.view as? ItemView {
            guard let viewModel = view.itemModel else { return }
            viewModel.terminateItem()
        }
    }

    @objc private func panGestureAction(sender: UIPanGestureRecognizer) {
        guard let view = sender.view as? ItemView else { return }
        if sender.state == .began {
            view.animateLiftUp()
        }
        let translate = sender.translation(in: canvasView)
        view.center = CGPoint(x: (sender.view?.center.x)! + translate.x, y: (sender.view?.center.y)! + translate.y)
        sender.setTranslation(CGPoint.zero, in: canvasView)
        if sender.state == .ended {
            view.itemModel?.saveItem()
        }
        
    }

    @objc private func longGestureAction(sender: UILongPressGestureRecognizer) {
//        switch sender.state {
//        case .began:
//            let shapeLayer = CAShapeLayer()
//            shapeLayer.lineWidth = 1
//            shapeLayer.lineCap = "round"
//            shapeLayer.fillColor = nil
//            shapeLayer.strokeEnd = 0
//            let baseLineColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//            shapeLayer.strokeColor = baseLineColor.cgColor
//
//            let path = UIBezierPath(arcCenter: sender.location(in: canvasView), radius: 30, startAngle: 0, endAngle: CGFloat.pi * 2, clockwise: true)
//            shapeLayer.path = path.cgPath
//
//            let indicatorView = UIView(frame: CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 30, height: 30)))
//
//            indicatorView.center = sender.location(in: canvasView)
//
//            indicatorView.layer.addSublayer(shapeLayer)
//
//            UIView.transition(with: indicatorView, duration: 2.0, options: .curveLinear, animations: {
//                shapeLayer.strokeEnd = 1
//            })
//
//            canvasView?.addSubview(indicatorView)
//        case .ended:
//            print("gesture ended")
//        default:
//            break
//        }





    }
    
    //MARK: Init
    init(withEntity entity: CanvasEntity, withCanvasName canvasName: String) {
        self.canvasEntity = entity
        self.canvasName = canvasName
        setCanvasProperties()
        
//        self.schemeElementsArray = MainDataBaseManager.shared.getSchemesElementsArray(forCanvas: entity)
        palceSavedItems()
        
    }
}

extension CanvasViewModel: CanvasViewModelType {
    func getCanvasName() -> String {
        guard let _canvasName_ = canvasName else { return "Canvas name is not set"}
        return _canvasName_
    }
    
    func getCanvasSize() -> CGSize {
        guard let canvas = canvasEntity else { return UIScreen.main.bounds.size }
        let size = CGSize(width: CGFloat(canvas.canvasWidh), height: CGFloat(canvas.canvasHeight))
        return size
    }
    
    func getCanvasView() -> UIView {
        guard let _canvasView_ = canvasView else { return UIView() }
        return _canvasView_
    }
}

