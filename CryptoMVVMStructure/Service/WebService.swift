//
//  WebService.swift
//  CryptoMVVMStructure
//
//  Created by Volkan on 26.03.2020.
//  Copyright © 2020 Volkan. All rights reserved.
//

import Foundation

class WebService {
    func downloadCurrencies(url : URL, completion: @escaping([CryptoCurrency]?) -> () )  {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            }else if let data = data {
               let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                if let cryptoList = cryptoList {
                    completion(cryptoList)
                }
            }
        }.resume()
    }
}
