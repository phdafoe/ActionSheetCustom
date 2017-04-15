//
//  APIUTILS.swift
//  ActionSheetCustom
//
//  Created by Andres on 15/4/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import Foundation
import UIKit

var cabeceraAnimacion : UIViewPropertyAnimator!

func muestraAnimacion(_ myFloat : Float, myView : UIView, opacidad : Float ){
    cabeceraAnimacion = UIViewPropertyAnimator(duration: TimeInterval(myFloat),
                                               curve: .easeInOut,
                                               animations: {
                                                myView.layer.opacity = opacidad
                                                myView.transform = CGAffineTransform.identity
    })
    cabeceraAnimacion.startAnimation()
}

func ocultoAnimacion(_ myFloat : Float, myView : UIView, opacidad : Float ){
    cabeceraAnimacion = UIViewPropertyAnimator(duration: TimeInterval(myFloat),
                                               curve: .easeInOut,
                                               animations: {
                                                myView.transform = CGAffineTransform(translationX: 0, y: +myView.frame.size.height)
    })
    cabeceraAnimacion.startAnimation()
}
