import UIKit

private let apiKey    = "6668744690fd8c840e335ed7d0ca796f"
fileprivate let urlString = "http://api.coinlayer.com/api/list?access_key=\(apiKey)"


class SupportNetworkManager {
    
    var arrayCrypto = Crypto()
    
    func fetchDataCrypto(completion: @escaping(Crypto) -> Void) {
        
        guard let url = URL(string: urlString) else { print("ERROR: URL-address not valid."); return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, _, error) in
            DispatchQueue.main.async {
                
                
                if error != nil {
                    print(error!)
                }
                
                if let safeData = data {
                    self.parseJSON(withData: safeData)
                    completion(self.arrayCrypto)
                }
            }
        }
        task.resume()
    }
    
    
    
    fileprivate func parseJSON(withData data: Data){
        do {
            let currentData = try JSONDecoder().decode(RatesNamesModel.self, from: data)
            self.arrayCrypto = currentData.crypto!
        } catch {
            print("ERROR: parse JSON CoinLayer")
        }
    }
}




//MARK: All titles Coin

//let arrayTitlesCoin = ["CDT", "QUN", "TNB", "BAT", "DRZ", "PIVX", "TESLA", "CRE", "ZCL", "KICK", "BOST", "TKY", "RBIES", "PCS", "PRG", "GBYTE", "LA", "ETH", "WPR", "OMNI", "BNT", "XLM", "GNT", "YOYOW", "MNX", "ORE", "PPY", "UQC", "ARN", "SBC", "ZSC", "ATB", "AION", "QASH", "OST", "MOD", "WAVES", "AST", "WTC", "CRW", "CND", "STX", "BLOCK", "ZRX", "ZIL", "WABI", "ANT", "AIDOC", "LOC", "MTN*", "NEO", "ABC", "LTC", "XTZ", "INT", "BBP", "VEE", "XAUR", "MAID", "FUNC", "STEEM", "NAS", "ACP", "QTUM", "NKC", "SIB", "FUTC", "GNO", "OC", "ATM", "GNX", "KNC", "MLN", "DSH", "DNT", "BCN", "RDN", "VTC", "ILC", "CPC", "ADZ", "NBT", "DIME", "RKC", "BIO", "DTA", "MTX", "OCN", "ENJ", "GXS", "XBP", "VIB", "PLR", "BQ", "DRGN", "ELF", "PRES", "REV", "DOGE", "XMR", "BURST", "KLC", "REP", "SNC", "EDG", "NEBL", "XBY", "XGB", "NMC", "CRAVE", "ODN", "IOST", "BNB", "NDC", "RLC", "ENG", "PLBT", "VRS", "ITC", "NMR", "ORME", "DATA", "XVG", "CMT*", "BCH", "THS", "XRB", "TRST", "RIYA", "CRC", "KIN", "RCN", "CALC", "TAAS", "STORJ", "XZC", "UBQ", "FOTA", "OXY", "EDR", "DCR", "NULS", "TIO", "HSR", "CVC", "KMD", "XTO", "FUN", "CHAT", "OBITS", "TRC", "VOISE", "CJ", "ARDR", "INK", "NLC2", "ADCN", "HST", "BTCS", "BT2", "CESC", "SALT", "FUEL", "WAX", "ETC", "STU", "ARK", "EMGO", "YEE", "REBL", "OTN", "IOP", "REQ", "NXT", "SMLY", "BAY", "AIR", "AVT", "EDO", "PART", "VEN", "HAC", "INS", "BTCZ", "LSK", "DEEP", "STK", "EVX", "LUX", "BTG", "LOG", "CNX", "HVN", "RUFF", "BLC", "ZEN", "RGC", "UTT", "WINGS", "PURA", "BT1", "DAS", "MANA", "ALT", "PRO", "THC", "FLP", "BCPT", "WGR", "SWFTC", "ADL", "DIM", "SHIFT", "BMC", "PUT", "ETN", "GAME", "MCO", "CTO", "REE", "BTX", "AURS", "NGC", "BQX", "VERI", "BASH", "DCN", "STRAT", "BAR", "DBC", "DGB", "USDT", "TKN", "GRS", "MONA", "NAV", "TRUMP", "KCS", "UNRC", "AIB", "ASAFE2", "XDN", "UTK", "KRB", "POWR", "XHI", "MCAP", "ADX", "LINDA", "POE", "XCP", "GRWI", "XNC", "XID", "THETA", "PPT", "ACT*", "APPC", "ZEC", "ARC", "EVR", "NVC", "CL", "FRST", "MTL", "RPX", "PAY", "SNT", "SUR", "NEU", "BTM*", "EOS", "YOC", "MKR", "DGD", "BTS", "RHOC", "LEO", "HNC", "ELA", "SMART", "POLY", "ETP", "OTX", "SUB", "EC", "DMD", "ZNY", "VIBE", "LUN", "BTLC", "ARCT", "MDA", "DBET", "SNGLS", "AE", "AMB", "GTO", "FCT", "611", "OMG", "VUC", "ZBC", "XRP", "BRIT", "PBT", "XEM", "RDD", "BRD", "WC", "CAS", "SNM", "WLK", "VIA", "NEWB", "DASH", "ICX", "LINK", "GMX", "PIZZA", "ACT", "TNT", "SENT", "MIOTA", "CLD", "BLZ", "XUC", "EKO", "SRN", "SC", "BCD", "WRC", "SPK", "LEND", "PRC", "OK", "EMC", "CAT", "TOA", "SAN", "IGNIS", "BLU", "CCRB", "MOIN", "PPC", "ICN", "DENT", "SMT*", "CTR", "BTQ", "DAT", "R", "PRL", "ICOS", "ADA", "GUP", "GRC", "RDN*", "MDS", "SYS", "BTM", "APC", "ERT", "GTC", "ETT", "GVT", "BTCA", "DCT", "UNO", "XCXT", "OAX", "VOX", "LRC", "QSP", "INSN", "TRX", "QAU", "AMM", "CLOAK", "WOP", "BTC", "AGI", "GAS", "POSW", "TRIG", "BEE"]
