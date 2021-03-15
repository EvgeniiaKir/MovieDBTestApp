//
//  CircularProgressView.swift
//  MovieDBTestApp
//
//  Created by Евгения Колдышева on 14.03.2021.
//

import UIKit

class CircularProgressView: UIView {
    
    private var progressLayer = CAShapeLayer()
    var progress: CGFloat = 0 {
        didSet { createCircularPath() }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCircularPath()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        createCircularPath()
    }
    
    func createCircularPath() {
        let circularPath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: 17, startAngle: -.pi / 2, endAngle: 3 * .pi / 2, clockwise: true)
        progressLayer.path = circularPath.cgPath
        progressLayer.fillColor = UIColor.clear.cgColor
        progressLayer.lineCap = .round
        progressLayer.lineWidth = 3.0
        progressLayer.strokeStart = 0
        progressLayer.strokeEnd = progress
        switch progress {
        case 0...0.25:
            progressLayer.strokeColor = #colorLiteral(red: 0.847597003, green: 0.3725363612, blue: 0.260553211, alpha: 1)
        case 0.25...0.5:
            progressLayer.strokeColor = #colorLiteral(red: 0.8117647059, green: 0.6745098039, blue: 0.1921568627, alpha: 1)
        case 0.5...0.75:
            progressLayer.strokeColor = #colorLiteral(red: 0.537254902, green: 0.6901960784, blue: 0.3411764706, alpha: 1)
        case 0.75...1:
            progressLayer.strokeColor = #colorLiteral(red: 0.2156862745, green: 0.5803921569, blue: 0.2078431373, alpha: 1)
        default:
            progressLayer.strokeColor = #colorLiteral(red: 0.2156862745, green: 0.5803921569, blue: 0.2078431373, alpha: 1)
        }

        layer.addSublayer(progressLayer)
    }
}
