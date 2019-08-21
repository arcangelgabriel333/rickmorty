//
//  CharacterDetailTableViewController.swift
//  rickmorty
//
//  Created by Antonio Gabriel Marín on 16/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

class CharacterDetailTableViewController: UITableViewController {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterSpecie: UILabel!
    @IBOutlet weak var characterGender: UILabel!
    @IBOutlet weak var characterStatus: UILabel!
    
    var characterDetail: Character!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //al hacer el prepare en el controlador de personajes, y el segue directamente desde el storyboard, arrastrando de la charactercell a viewcontroller de detalles (como show, y poniendole el identificador del prepare, ya esta cargada la variable cuando esta ventana se abre, por asi decirlo, de modo que podemos hacer la asignacion directamente en el view did load
        characterName.text = characterDetail.name
        characterSpecie.text = characterDetail.especies
        characterGender.text = characterDetail.gender
        characterStatus.text = characterDetail.status
        self.characterImage.loadImage(fromURL: characterDetail.image)
        
        if characterStatus.text == "Alive" {
            characterStatus.backgroundColor = .green
        } else if characterStatus.text == "Dead" {
            characterStatus.backgroundColor = .red
        } else {
            characterStatus.backgroundColor = .gray
        }
    }

    // MARK: - Table view data source

    //EL NUMERO DE SECCIONES Y ROWS NO ES NECESARIO AL SER LA TABLA DE CELDAS ESTATICAS ("SOLO UNA CELDA")

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
//    @IBAction func unwindToCharacterDetail(_ sender: UIStoryboardSegue) {
//        guard let source = sender.source as? CharactersTableViewController,
//            let characterInfo = source.characterArray else {return}
//
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "episodesFromCharacter" {
            let destination = segue.destination as! CharacterEpisodesTableViewController
                destination.episodeString = characterDetail.episodes
        }
    }

}
