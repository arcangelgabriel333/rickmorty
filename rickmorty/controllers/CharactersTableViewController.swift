//
//  CharactersTableViewController.swift
//  rickmorty
//
//  Created by Usuario on 14/08/2019.
//  Copyright © 2019 Antonio. All rights reserved.
//

import UIKit
import FirebaseAuth

class CharactersTableViewController: UITableViewController {
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        return activityIndicator
    }()
    
    var characterController = CharactersController()
    var characterPagedData: PagedInfo<Character>?
    var charactersArray: [Character] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundView = activityIndicator

        fecthCurrentCharacters()
    }
    
    func fecthCurrentCharacters() {
        self.activityIndicator.startAnimating()
        
        characterController.fetchMultipleCharacters(url: characterPagedData?.meta.next) { (characterPagedData) in
            
            self.characterPagedData = characterPagedData
            if let characterArray = characterPagedData?.results {
                
                for character in characterArray {
                    if !self.charactersArray.contains(character) {
                        self.charactersArray.append(character)
                    }
                }
                
                //self.charactersArray = characterPagedData?.results ?? []
                
                DispatchQueue.main.async {
                    
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    func nextPage() {
        fecthCurrentCharacters()
    }
    
    @IBAction func logOutTapped(_ sender: UIBarButtonItem) {
        try? Auth.auth().signOut()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let window = appDelegate.window
        window?.rootViewController = UIStoryboard(name: "LoginPage", bundle: nil).instantiateViewController(withIdentifier: "loginMainController")
    }
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return charactersArray.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == (charactersArray.count - 1) {
            nextPage()
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterViewCell

        let characterInfo = charactersArray[indexPath.row]
        cell.configure(for: characterInfo)

        return cell
    }

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "seeCharacter" {
            let destination = segue.destination as! CharacterDetailTableViewController
            
            if let selectedIndex = tableView.indexPathForSelectedRow {
                destination.characterDetail = charactersArray[selectedIndex.row]
            }
        }
    }

}
