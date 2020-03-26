//
//  CryptoViewModel.swift
//  CryptoMVVMStructure
//
//  Created by Volkan on 26.03.2020.
//  Copyright © 2020 Volkan. All rights reserved.
//

import Foundation

struct CryptoListViewModel {
    let cryptoCurrencyList : [CryptoCurrency]
    
    func numberOfRowsInSection() -> Int {
        return self.cryptoCurrencyList.count
    }
    func cryptoAtIndex(_ index : Int) -> CryptoViewModel {
        let crypto = self.cryptoCurrencyList[index]
        return CryptoViewModel(cryptoCurreny: crypto)
    }
}

struct CryptoViewModel {
    let cryptoCurreny : CryptoCurrency
    
    var name : String {
        return self.cryptoCurreny.currency
    }
    var price : String {
        return self.cryptoCurreny.price
    }
}
