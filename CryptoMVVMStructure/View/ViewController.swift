//
//  ViewController.swift
//  CryptoMVVMStructure
//
//  Created by Volkan on 26.03.2020.
//  Copyright © 2020 Volkan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    

    @IBOutlet weak var tableView: UITableView!
    
    private var cryptoListViewModel : CryptoListViewModel!
    var colorArray = [UIColor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        self.colorArray = [
        UIColor(red: 74/255, green: 57/225, blue: 204/225, alpha: 1.0),
        UIColor(red: 14/255, green: 147/225, blue: 14/225, alpha: 1.0),
        UIColor(red: 104/255, green: 57/225, blue: 54/225, alpha: 1.0),
        UIColor(red: 104/255, green: 127/225, blue: 64/225, alpha: 1.0),
        UIColor(red: 114/255, green: 57/225, blue: 204/225, alpha: 1.0),
        UIColor(red: 154/255, green: 67/225, blue: 224/225, alpha: 1.0)]
        
        getData()

    }
    
    func getData() {
        let url = URL(string: "https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")!
        WebService().downloadCurrencies(url: url) { (cryptos) in
            if let cryptos = cryptos {
                
                self.cryptoListViewModel = CryptoListViewModel(cryptoCurrencyList: cryptos)
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.cryptoListViewModel == nil ? 0 : self.cryptoListViewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoTableViewCell
        let cryptoViewModel = self.cryptoListViewModel.cryptoAtIndex(indexPath.row)
        cell.priceText.text = cryptoViewModel.price
        cell.currencyText.text = cryptoViewModel.name
        cell.backgroundColor = self.colorArray[indexPath.row % 6]
        return cell
    }

}

