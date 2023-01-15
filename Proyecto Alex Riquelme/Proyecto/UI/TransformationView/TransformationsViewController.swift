//
//  TransformationsViewController.swift
//  Proyecto
//
//  Created by Alex Riquelme on 08-01-23.
//

import UIKit



class TransformationsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    

    var transformations: [Transformation]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        navigationItem.title = "Transformations"
        
        let xib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(xib, forCellReuseIdentifier: "customTableCell")

        sortTable()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transformations.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) conecta el tableview con el identificador de la celda y se le pasa la lista
        //let weekDayName = singleRows[indexPath.row]  //Recorre el listado singleRows
        //cell.textLabel?.text = weekDayName   //Lo mostramos por pantalla
        
        //return cell
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "customTableCell", for: indexPath) as! TableCell
        let heroe = transformations[indexPath.row]
        cell.iconImageView.setImage(url: heroe.photo)
        cell.titleLabel.text = heroe.name
        
        cell.descLabel.text = heroe.description
        
        cell.accessoryType = .disclosureIndicator
        
        cell.selectionStyle = .none  
        
        return cell
        
    }
    //Para ajustar la distancia entre las celdas de la TableView
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
   
    //Se agrega función para ordenar las transformaciones
    func sortTable() {
        transformations = transformations.sorted (by: {$1.name > $0.name })
        tableView.reloadData()
    }

}
