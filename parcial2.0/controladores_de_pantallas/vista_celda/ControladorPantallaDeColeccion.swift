//
//  ControladorPantallaDeColeccion.swift
//  parcial2.0
//
//  Created by alumno on 07/10/24.
//

import UIKit

//private let identificador_de_celda = "celda_pantalla_principal"

class ControladorPantallaDeColeccion: UICollectionViewController{
    private var lista_de_publicaciones: [Post] = []
    let url_de_publicaciones = "https://jsonplaceholder.typicode.com/posts"

    
    private let identificador_de_celda = "celda_pantalla_principal"


    @IBOutlet weak var outlet_a_la_vista: UICollectionView!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        let ubicacion = URL(string: url_de_publicaciones)!
        URLSession.shared.dataTask(with: ubicacion) {
            (datos, respuesta, error) in do {
                if let publicaciones_recibidas = datos{
                    let prueba_de_interpretacion_de_datos = try JSONDecoder().decode([Post].self, from: publicaciones_recibidas)
                    
                    self.lista_de_publicaciones = prueba_de_interpretacion_de_datos
                    
                    DispatchQueue.main.async {
                        self.collectionView.reloadData()
                    }
                }
                else {
                    print(respuesta)
                }
            } catch {
                print("Error")
            }
        }.resume()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using [segue destinationViewController].
     // Pass the selected object to the new view controller.
     }
     */
    
    // MARK: UICollectionViewDataSource
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return self.lista_de_publicaciones.count
    }

    // Funcion para identificar y crear cada una de las celdas creadas en el Controller
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let celda: VistaDeCelda = collectionView.dequeueReusableCell(withReuseIdentifier: identificador_de_celda, for: indexPath) as! VistaDeCelda
    
        // Configure the cell
        //celda.tintColor = UIColor.green
        
        celda.etiqueta.text = self.lista_de_publicaciones[indexPath.item].title
        celda.cuerpo.text = self.lista_de_publicaciones[indexPath.item].body

        // print(self.lista_de_publicaciones)
        
        return celda
    }
    

    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Se selecciono la celda\(indexPath)")
        
        let pantalla_de_post = storyboard?.instantiateViewController(withIdentifier: "PantallaPublicacion") as! ControladorPantallaDeColeccion
        
        self.navigationController?.pushViewController(pantalla_de_post, animated: true)
        
        print(self.navigationController)

    }
    
    // MARK: UICollectionViewDelegate
    
    /*
     // Uncomment this method to specify if the specified item should be highlighted during tracking
     override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment this method to specify if the specified item should be selected
     override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
     return true
     }
     */
    
    /*
     // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
     return false
     }
     
     override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
     
     }
     */
    
}
