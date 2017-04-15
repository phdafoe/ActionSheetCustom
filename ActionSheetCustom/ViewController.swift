//
//  ViewController.swift
//  ActionSheetCustom
//
//  Created by Andres on 14/4/17.
//  Copyright © 2017 icologic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Variables locales
    var arrayNombres = ["Andres", "Felipe", "Ocampo"]
    var arrayIconos = ["img_icono_amigos", "img_icono_amor", "img_icono_amigos" ]
    var imageGroup = 3
    
    //MARK: - IBOutlets
    @IBOutlet weak var myBackgroudBlack: UIView!
    @IBOutlet weak var myViewActionSheet: UIView!
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var myBtnCerrar: UIButton!
    
    //MARK: IBActions
    @IBAction func showActionSheet(_ sender: Any) {
        iniciaAnimacion()
    }

    @IBAction func ocultarActionSheet(_ sender: Any) {
        ocultarVistasTap()
    }
    
    //MARK: - LIFE VC
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegado de Tabla
        myTableView.delegate = self
        myTableView.dataSource = self
        
        //Gestion de grupos de toque
        myViewActionSheet.tag = imageGroup
        myBackgroudBlack.tag = imageGroup
        
        //Añado gesto de toque en el background
        let tapGR = UITapGestureRecognizer(target: self,
                                           action: #selector(ocultarVistas(_:)))
        myBackgroudBlack.addGestureRecognizer(tapGR)
        
        //Personalizacion del boton
        myBtnCerrar.layer.cornerRadius = 5
        myBtnCerrar.backgroundColor = #colorLiteral(red: 0.9162238261, green: 0.6956997995, blue: 0.352871388, alpha: 1)
        myBtnCerrar.layer.borderColor = UIColor.brown.cgColor
        myBtnCerrar.layer.borderWidth = 0.5
        myViewActionSheet.layer.cornerRadius = 10
        
        //Quito los elementos de la vista
        objetosDesplazados()
        
        //Registro Nib
        myTableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "CustomCell")
    }

    func objetosDesplazados(){
        myViewActionSheet.transform = CGAffineTransform(translationX: 0, y: myViewActionSheet.frame.size.height)
        myBackgroudBlack.layer.opacity = 0
    }
    
    func iniciaAnimacion(){
        muestraAnimacion(0.5, myView: myViewActionSheet, opacidad: 1)
        muestraAnimacion(0.1, myView: myBackgroudBlack, opacidad: 0.4)
    }
    
    func ocultarVistasTap(){
        ocultoAnimacion(0.5, myView: myViewActionSheet, opacidad: 1)
        ocultoAnimacion(0.1, myView: myBackgroudBlack, opacidad: 0)
    }
    
    func ocultarVistas(_ gesRec : UITapGestureRecognizer){
        for c_vista in self.view.subviews{
            if c_vista.tag == self.imageGroup{
                self.ocultarVistasTap()
            }
        }
    }
    
    


}//TODO: - Fin de la clase


extension ViewController : UITableViewDelegate, UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNombres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let customCell = myTableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        let model = arrayNombres[indexPath.row]
        let modelIconos = UIImage(named: arrayIconos[indexPath.row])
        
        customCell.myNombreOpcion.text = model
        customCell.myImagenIcono.image = modelIconos
        
        return customCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            //Instancio otro Storyboard
            let sbData = UIStoryboard(name: "OtheStoryboard", bundle: nil)
            let detalleUno = sbData.instantiateInitialViewController()
            show(detalleUno as! UINavigationController, sender: self)
        case 1:
            let detalleUno = storyboard?.instantiateViewController(withIdentifier: "DetalleUnoViewController") as! DetalleUnoViewController
            present(detalleUno,
                    animated: true,
                    completion: nil)
        default:
            let detalleDos = storyboard?.instantiateViewController(withIdentifier: "DetalleDosViewController") as! DetalleDosViewController
            present(detalleDos,
                    animated: true,
                    completion: nil)
        }
        
    }
    
}



