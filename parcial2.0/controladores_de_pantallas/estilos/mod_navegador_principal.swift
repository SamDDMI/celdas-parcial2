//
//  mod_navegador_principal.swift
//  parcial2.0
//
//  Created by alumno on 14/10/24.
import UIKit

class mod_navegador_principal: UINavigationController {
    override func viewDidLoad() {
        // self.navigationBar.isTranslucent = true
        // self.navigationBar.backgroundColor = .black
        //self.hidesBarsOnSwipe = true
        activar_navigation_bar(actviar: false)
    }
    
    func activar_navigation_bar(actviar: Bool){
        self.navigationBar.isHidden = !actviar
    }

}
