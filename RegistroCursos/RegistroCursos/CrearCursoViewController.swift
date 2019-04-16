//
//  CrearCursoViewController.swift
//  RegistroCursos
//
//  Created by Jhonny Rivera on 4/15/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class CrearCursoViewController: UIViewController {

    @IBOutlet weak var txtNombreCurso: UITextField!
    @IBOutlet weak var txtPracticas: UITextField!
    @IBOutlet weak var txtLaboratorios: UITextField!
    @IBOutlet weak var txtExamenFinal: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func agregar(_ sender: Any) {
        
        //Se referencia al appDelegate
        let delegate = (UIApplication.shared.delegate as! AppDelegate)
        //Se referencia al contexto actual
        let context = delegate.persistentContainer.viewContext
        var notaFinal = 0.0
        let curso = Curso(context: context)
        curso.nomCurso = txtNombreCurso.text!
        curso.practicas = Double(txtPracticas.text!)!
        curso.laboratorios = Double(txtLaboratorios.text!)!
        curso.final = Double(txtExamenFinal.text!)!
        
        notaFinal = (curso.final + curso.practicas + curso.laboratorios)/3
        
        curso.promFinal = notaFinal
        
        if notaFinal>=13{
            curso.aprobado = true
        }else{
            curso.aprobado = false
        }
        
        
        delegate.saveContext()
        navigationController!.popViewController(animated: true)
    }
    
}
