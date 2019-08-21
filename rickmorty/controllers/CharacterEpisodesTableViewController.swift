//
//  CharacterEpisodesTableViewController.swift
//  rickmorty
//
//  Created by Antonio Gabriel Marín on 19/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit

class CharacterEpisodesTableViewController: UITableViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        return activityIndicator
    }()
    
    var episodeController = EpisodesController()
    var episodeArray: [Episode] = []
    var episodeString: [String]!
    var idList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = activityIndicator
        
        calculateIds()

        episodeController.fetchCharacterEpisodes(idList: idList) { (episodeArray) in
            if let episodeArray = episodeArray {
                
                self.activityIndicator.startAnimating()
                
                DispatchQueue.main.async {
                    
                    self.episodeArray = episodeArray
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    //cogemos el id de tipo Int que esta como cuarto elemento de cada string del array de strings de episodios del elemento personaje
    func calculateIds() {
        for line in episodeString {
            let id = line.split(separator: "/")
            idList.append(String(id[4]))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return episodeArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeCell", for: indexPath) as! EpisodeViewCell
        
        let episodeInfo = episodeArray[indexPath.row]
        cell.configureEpisode(for: episodeInfo)
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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

}
