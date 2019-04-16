//
//  ViewController.swift
//  RegistroCursos
//
//  Created by Jhonny Rivera on 4/15/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cursos:[Curso] = [ ]
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func obtenerCursos(){
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            cursos = try context.fetch(Curso.fetchRequest()) as! [Curso]
        }catch{
            print("Ha ocurrido un problema")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        obtenerCursos()
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "cursoSeleccionadoSegue"{
            let siguienteVC = segue.destination as! CursoSeleccionadoViewController
            siguienteVC.curso = sender as! Curso 
            
        }
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let curso = cursos[indexPath.row]
        if curso.aprobado{
            cell.backgroundColor = UIColor.green
        }else{
            cell.backgroundColor = UIColor.red
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let curso = cursos[indexPath.row]
        //        print("indice: ",indexSeleccionado)
        print("curso: ", curso)
        performSegue(withIdentifier: "cursoSeleccionadoSegue", sender: curso)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cursos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let curso = cursos[indexPath.row]
        cell.textLabel?.text = curso.nomCurso
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if (editingStyle == UITableViewCell.EditingStyle.delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            let curso = cursos[indexPath.row]
            let delegate = (UIApplication.shared.delegate as! AppDelegate)
            let context = delegate.persistentContainer.viewContext
            context.delete(curso)
            delegate.saveContext()
            viewWillAppear(true)
        }
    }
    
    
   
    
    


}

