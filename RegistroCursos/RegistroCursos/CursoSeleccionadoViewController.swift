//
//  CursoSeleccionadoViewController.swift
//  RegistroCursos
//
//  Created by Jhonny Rivera on 4/15/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class CursoSeleccionadoViewController: UIViewController {

    var curso: Curso? = nil
    
    
    @IBOutlet weak var textCurso: UILabel!
    @IBOutlet weak var textPromedio: UILabel!
    @IBOutlet weak var textAprobado: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        textCurso.text = curso!.nomCurso
        textPromedio.text = "Promedio Final: \(String(curso!.promFinal))"
        
        if curso!.aprobado{
            textAprobado.text = "Aprobado ✅"
        }else{
            textAprobado.text = "Desaprobrado ❌"
        }
        
    }
    

    @IBAction func eliminarCurso(_ sender: Any) {
        
        
        let delegate = (UIApplication.shared.delegate as! AppDelegate)
        let context = delegate.persistentContainer.viewContext
        context.delete(curso!)
        delegate.saveContext()
        navigationController?.popViewController(animated: true)
        
    }
    

}
