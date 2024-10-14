//
//  ControladorPantallaDelPost.swift
//  parcial2.0
//
//  Created by alumno on 14/10/24.
//

import UIKit

class ControladorPantallaDelPost: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("hola mundo")

        // Do any additional setup after loading the view.
        
        
        let controlador_de_navegacion = self.navigationController as? mod_navegador_principal
        controlador_de_navegacion?.activar_navigation_bar(actviar: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
