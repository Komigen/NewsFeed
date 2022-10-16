import Foundation

//MARK: Model for parse Rates

struct RatesModel: Codable {
    var rates: [String: Double]
}

/* Model for parse all data, not used */

//struct RatesNamesModel: Codable {
//    var crypto: Crypto?
//}
//
//struct Crypto: Codable {
//    var the611, abc, acp, act: The611?
//    var cryptoACT, ada, adcn, adl: The611?
//    var adx, adz, ae, agi: The611?
//    var aib, aidoc, aion, air: The611?
//    var alt, amb, amm, ant: The611?
//    var apc: Apc?
//    var appc, arc, arct, ardr: The611?
//    var ark, arn, asafe2, ast: The611?
//    var atb: Apc?
//    var atm, aurs, avt, bar: The611?
//    var bash, bat: The611?
//    var bay: Apc?
//    var bbp, bcd, bch, bcn: The611?
//    var bcpt, bee, bio, blc: The611?
//    var block: Apc?
//    var blu, blz, bmc, bnb: The611?
//    var bnt: The611?
//    var bost: Apc?
//    var bq, bqx, brd, brit: The611?
//    var bt1, bt2: Apc?
//    var btc, btca, btcs, btcz: The611?
//    var btg, btlc, btm, cryptoBTM: The611?
//    var btq, bts, btx, burst: The611?
//    var calc, cas, cat, ccrb: The611?
//    var cdt, cesc, chat, cj: The611?
//    var cl, cld: The611?
//    var cloak: Apc?
//    var cmt, cnd, cnx, cpc: The611?
//    var crave, crc: Apc?
//    var cre, crw, cto, ctr: The611?
//    var cvc, das, dash, dat: The611?
//    var data, dbc, dbet, dcn: The611?
//    var dcr, dct, deep, dent: The611?
//    var dgb, dgd, dim: The611?
//    var dime: Apc?
//    var dmd, dnt: The611?
//    var doge: Apc?
//    var drgn, drz, dsh, dta: The611?
//    var ec: Apc?
//    var edg, edo, edr, eko: The611?
//    var ela, elf, emc, emgo: The611?
//    var eng, enj, eos, ert: The611?
//    var etc: Apc?
//    var eth, etn, etp, ett: The611?
//    var evr, evx, fct, flp: The611?
//    var fota, frst, fuel, fun: The611?
//    var cryptoFUNC, futc, game, gas: The611?
//    var gbyte, gmx, gno, gnt: The611?
//    var gnx: The611?
//    var grc: Apc?
//    var grs, grwi, gtc, gto: The611?
//    var gup, gvt, gxs, hac: The611?
//    var hnc, hsr, hst, hvn: The611?
//    var icn, icos, icx: The611?
//    var ignis: Apc?
//    var ilc, ink, ins, insn: The611?
//    var int, iop, iost, itc: The611?
//    var kcs, kick, kin, klc: The611?
//    var kmd, knc, krb, la: The611?
//    var lend, leo, linda, link: The611?
//    var loc: Apc?
//    var log, lrc, lsk, ltc: The611?
//    var lun, lux, maid, mana: The611?
//    var mcap, mco, mda, mds: The611?
//    var miota, mkr, mln, mnx: The611?
//    var mod, moin, mona, mtl: The611?
//    var mtn: The611?
//    var mtx: Apc?
//    var nas, nav: The611?
//    var nbt: Apc?
//    var ndc: The611?
//    var nebl: Apc?
//    var neo, neu, newb, ngc: The611?
//    var nkc, nlc2: Apc?
//    var nmc, nmr, nuls: The611?
//    var nvc: Apc?
//    var nxt, oax, obits, oc: The611?
//    var ocn, odn, ok, omg: The611?
//    var omni, ore, orme, ost: The611?
//    var otn, otx: The611?
//    var oxy: Apc?
//    var part, pay, pbt, pcs: The611?
//    var pivx: Apc?
//    var pizza, plbt, plr, poe: The611?
//    var poly, posw, powr: The611?
//    var ppc: Apc?
//    var ppt, ppy, prc, pres: The611?
//    var prg, prl, pro, pura: The611?
//    var put, qash, qau, qsp: The611?
//    var qtum, qun, r, rbies: The611?
//    var rcn, rdd, rdn, cryptoRDN: The611?
//    var rebl, ree, rep, req: The611?
//    var rev, rgc, rhoc, riya: The611?
//    var rkc, rlc, rpx, ruff: The611?
//    var salt, san, sbc, sc: The611?
//    var sent: The611?
//    var shift: Apc?
//    var sib, smart, smly, smt: The611?
//    var snc, sngls, snm, snt: The611?
//    var spk: Apc?
//    var srn, steem, stk, storj: The611?
//    var strat: Apc?
//    var stu, stx, sub: The611?
//    var sur: Apc?
//    var swftc, sys, taas, tesla: The611?
//    var thc, theta, ths, tio: The611?
//    var tkn, tky, tnb, tnt: The611?
//    var toa: Apc?
//    var trc, trig, trst, trump: The611?
//    var trx: The611?
//    var ubq: Apc?
//    var uno: The611?
//    var unrc: Apc?
//    var uqc: The611?
//    var usdt: Apc?
//    var utk, utt, vee, ven: The611?
//    var veri, via, vib, vibe: The611?
//    var voise, vox, vrs, vtc: The611?
//    var vuc, wabi, waves, wax: The611?
//    var wc, wgr, wings, wlk: The611?
//    var wop, wpr, wrc, wtc: The611?
//    var xaur, xbp, xby, xcp: The611?
//    var xcxt, xdn, xem, xgb: The611?
//    var xhi, xid, xlm, xmr: The611?
//    var xnc, xrb, xrp: The611?
//    var xto, xtz: Apc?
//    var xuc, xvg, xzc, yee: The611?
//    var yoc, yoyow, zbc, zcl: The611?
//    var zec, zen, zil, zny: The611?
//    var zrx, zsc: The611?
//
//    enum CodingKeys: String, CodingKey {
//        case the611 = "611"
//        case abc = "ABC"
//        case acp = "ACP"
//        case act = "ACT"
//        case cryptoACT = "ACT*"
//        case ada = "ADA"
//        case adcn = "ADCN"
//        case adl = "ADL"
//        case adx = "ADX"
//        case adz = "ADZ"
//        case ae = "AE"
//        case agi = "AGI"
//        case aib = "AIB"
//        case aidoc = "AIDOC"
//        case aion = "AION"
//        case air = "AIR"
//        case alt = "ALT"
//        case amb = "AMB"
//        case amm = "AMM"
//        case ant = "ANT"
//        case apc = "APC"
//        case appc = "APPC"
//        case arc = "ARC"
//        case arct = "ARCT"
//        case ardr = "ARDR"
//        case ark = "ARK"
//        case arn = "ARN"
//        case asafe2 = "ASAFE2"
//        case ast = "AST"
//        case atb = "ATB"
//        case atm = "ATM"
//        case aurs = "AURS"
//        case avt = "AVT"
//        case bar = "BAR"
//        case bash = "BASH"
//        case bat = "BAT"
//        case bay = "BAY"
//        case bbp = "BBP"
//        case bcd = "BCD"
//        case bch = "BCH"
//        case bcn = "BCN"
//        case bcpt = "BCPT"
//        case bee = "BEE"
//        case bio = "BIO"
//        case blc = "BLC"
//        case block = "BLOCK"
//        case blu = "BLU"
//        case blz = "BLZ"
//        case bmc = "BMC"
//        case bnb = "BNB"
//        case bnt = "BNT"
//        case bost = "BOST"
//        case bq = "BQ"
//        case bqx = "BQX"
//        case brd = "BRD"
//        case brit = "BRIT"
//        case bt1 = "BT1"
//        case bt2 = "BT2"
//        case btc = "BTC"
//        case btca = "BTCA"
//        case btcs = "BTCS"
//        case btcz = "BTCZ"
//        case btg = "BTG"
//        case btlc = "BTLC"
//        case btm = "BTM"
//        case cryptoBTM = "BTM*"
//        case btq = "BTQ"
//        case bts = "BTS"
//        case btx = "BTX"
//        case burst = "BURST"
//        case calc = "CALC"
//        case cas = "CAS"
//        case cat = "CAT"
//        case ccrb = "CCRB"
//        case cdt = "CDT"
//        case cesc = "CESC"
//        case chat = "CHAT"
//        case cj = "CJ"
//        case cl = "CL"
//        case cld = "CLD"
//        case cloak = "CLOAK"
//        case cmt = "CMT*"
//        case cnd = "CND"
//        case cnx = "CNX"
//        case cpc = "CPC"
//        case crave = "CRAVE"
//        case crc = "CRC"
//        case cre = "CRE"
//        case crw = "CRW"
//        case cto = "CTO"
//        case ctr = "CTR"
//        case cvc = "CVC"
//        case das = "DAS"
//        case dash = "DASH"
//        case dat = "DAT"
//        case data = "DATA"
//        case dbc = "DBC"
//        case dbet = "DBET"
//        case dcn = "DCN"
//        case dcr = "DCR"
//        case dct = "DCT"
//        case deep = "DEEP"
//        case dent = "DENT"
//        case dgb = "DGB"
//        case dgd = "DGD"
//        case dim = "DIM"
//        case dime = "DIME"
//        case dmd = "DMD"
//        case dnt = "DNT"
//        case doge = "DOGE"
//        case drgn = "DRGN"
//        case drz = "DRZ"
//        case dsh = "DSH"
//        case dta = "DTA"
//        case ec = "EC"
//        case edg = "EDG"
//        case edo = "EDO"
//        case edr = "EDR"
//        case eko = "EKO"
//        case ela = "ELA"
//        case elf = "ELF"
//        case emc = "EMC"
//        case emgo = "EMGO"
//        case eng = "ENG"
//        case enj = "ENJ"
//        case eos = "EOS"
//        case ert = "ERT"
//        case etc = "ETC"
//        case eth = "ETH"
//        case etn = "ETN"
//        case etp = "ETP"
//        case ett = "ETT"
//        case evr = "EVR"
//        case evx = "EVX"
//        case fct = "FCT"
//        case flp = "FLP"
//        case fota = "FOTA"
//        case frst = "FRST"
//        case fuel = "FUEL"
//        case fun = "FUN"
//        case cryptoFUNC = "FUNC"
//        case futc = "FUTC"
//        case game = "GAME"
//        case gas = "GAS"
//        case gbyte = "GBYTE"
//        case gmx = "GMX"
//        case gno = "GNO"
//        case gnt = "GNT"
//        case gnx = "GNX"
//        case grc = "GRC"
//        case grs = "GRS"
//        case grwi = "GRWI"
//        case gtc = "GTC"
//        case gto = "GTO"
//        case gup = "GUP"
//        case gvt = "GVT"
//        case gxs = "GXS"
//        case hac = "HAC"
//        case hnc = "HNC"
//        case hsr = "HSR"
//        case hst = "HST"
//        case hvn = "HVN"
//        case icn = "ICN"
//        case icos = "ICOS"
//        case icx = "ICX"
//        case ignis = "IGNIS"
//        case ilc = "ILC"
//        case ink = "INK"
//        case ins = "INS"
//        case insn = "INSN"
//        case int = "INT"
//        case iop = "IOP"
//        case iost = "IOST"
//        case itc = "ITC"
//        case kcs = "KCS"
//        case kick = "KICK"
//        case kin = "KIN"
//        case klc = "KLC"
//        case kmd = "KMD"
//        case knc = "KNC"
//        case krb = "KRB"
//        case la = "LA"
//        case lend = "LEND"
//        case leo = "LEO"
//        case linda = "LINDA"
//        case link = "LINK"
//        case loc = "LOC"
//        case log = "LOG"
//        case lrc = "LRC"
//        case lsk = "LSK"
//        case ltc = "LTC"
//        case lun = "LUN"
//        case lux = "LUX"
//        case maid = "MAID"
//        case mana = "MANA"
//        case mcap = "MCAP"
//        case mco = "MCO"
//        case mda = "MDA"
//        case mds = "MDS"
//        case miota = "MIOTA"
//        case mkr = "MKR"
//        case mln = "MLN"
//        case mnx = "MNX"
//        case mod = "MOD"
//        case moin = "MOIN"
//        case mona = "MONA"
//        case mtl = "MTL"
//        case mtn = "MTN*"
//        case mtx = "MTX"
//        case nas = "NAS"
//        case nav = "NAV"
//        case nbt = "NBT"
//        case ndc = "NDC"
//        case nebl = "NEBL"
//        case neo = "NEO"
//        case neu = "NEU"
//        case newb = "NEWB"
//        case ngc = "NGC"
//        case nkc = "NKC"
//        case nlc2 = "NLC2"
//        case nmc = "NMC"
//        case nmr = "NMR"
//        case nuls = "NULS"
//        case nvc = "NVC"
//        case nxt = "NXT"
//        case oax = "OAX"
//        case obits = "OBITS"
//        case oc = "OC"
//        case ocn = "OCN"
//        case odn = "ODN"
//        case ok = "OK"
//        case omg = "OMG"
//        case omni = "OMNI"
//        case ore = "ORE"
//        case orme = "ORME"
//        case ost = "OST"
//        case otn = "OTN"
//        case otx = "OTX"
//        case oxy = "OXY"
//        case part = "PART"
//        case pay = "PAY"
//        case pbt = "PBT"
//        case pcs = "PCS"
//        case pivx = "PIVX"
//        case pizza = "PIZZA"
//        case plbt = "PLBT"
//        case plr = "PLR"
//        case poe = "POE"
//        case poly = "POLY"
//        case posw = "POSW"
//        case powr = "POWR"
//        case ppc = "PPC"
//        case ppt = "PPT"
//        case ppy = "PPY"
//        case prc = "PRC"
//        case pres = "PRES"
//        case prg = "PRG"
//        case prl = "PRL"
//        case pro = "PRO"
//        case pura = "PURA"
//        case put = "PUT"
//        case qash = "QASH"
//        case qau = "QAU"
//        case qsp = "QSP"
//        case qtum = "QTUM"
//        case qun = "QUN"
//        case r = "R"
//        case rbies = "RBIES"
//        case rcn = "RCN"
//        case rdd = "RDD"
//        case rdn = "RDN"
//        case cryptoRDN = "RDN*"
//        case rebl = "REBL"
//        case ree = "REE"
//        case rep = "REP"
//        case req = "REQ"
//        case rev = "REV"
//        case rgc = "RGC"
//        case rhoc = "RHOC"
//        case riya = "RIYA"
//        case rkc = "RKC"
//        case rlc = "RLC"
//        case rpx = "RPX"
//        case ruff = "RUFF"
//        case salt = "SALT"
//        case san = "SAN"
//        case sbc = "SBC"
//        case sc = "SC"
//        case sent = "SENT"
//        case shift = "SHIFT"
//        case sib = "SIB"
//        case smart = "SMART"
//        case smly = "SMLY"
//        case smt = "SMT*"
//        case snc = "SNC"
//        case sngls = "SNGLS"
//        case snm = "SNM"
//        case snt = "SNT"
//        case spk = "SPK"
//        case srn = "SRN"
//        case steem = "STEEM"
//        case stk = "STK"
//        case storj = "STORJ"
//        case strat = "STRAT"
//        case stu = "STU"
//        case stx = "STX"
//        case sub = "SUB"
//        case sur = "SUR"
//        case swftc = "SWFTC"
//        case sys = "SYS"
//        case taas = "TAAS"
//        case tesla = "TESLA"
//        case thc = "THC"
//        case theta = "THETA"
//        case ths = "THS"
//        case tio = "TIO"
//        case tkn = "TKN"
//        case tky = "TKY"
//        case tnb = "TNB"
//        case tnt = "TNT"
//        case toa = "TOA"
//        case trc = "TRC"
//        case trig = "TRIG"
//        case trst = "TRST"
//        case trump = "TRUMP"
//        case trx = "TRX"
//        case ubq = "UBQ"
//        case uno = "UNO"
//        case unrc = "UNRC"
//        case uqc = "UQC"
//        case usdt = "USDT"
//        case utk = "UTK"
//        case utt = "UTT"
//        case vee = "VEE"
//        case ven = "VEN"
//        case veri = "VERI"
//        case via = "VIA"
//        case vib = "VIB"
//        case vibe = "VIBE"
//        case voise = "VOISE"
//        case vox = "VOX"
//        case vrs = "VRS"
//        case vtc = "VTC"
//        case vuc = "VUC"
//        case wabi = "WABI"
//        case waves = "WAVES"
//        case wax = "WAX"
//        case wc = "WC"
//        case wgr = "WGR"
//        case wings = "WINGS"
//        case wlk = "WLK"
//        case wop = "WOP"
//        case wpr = "WPR"
//        case wrc = "WRC"
//        case wtc = "WTC"
//        case xaur = "XAUR"
//        case xbp = "XBP"
//        case xby = "XBY"
//        case xcp = "XCP"
//        case xcxt = "XCXT"
//        case xdn = "XDN"
//        case xem = "XEM"
//        case xgb = "XGB"
//        case xhi = "XHI"
//        case xid = "XID"
//        case xlm = "XLM"
//        case xmr = "XMR"
//        case xnc = "XNC"
//        case xrb = "XRB"
//        case xrp = "XRP"
//        case xto = "XTO"
//        case xtz = "XTZ"
//        case xuc = "XUC"
//        case xvg = "XVG"
//        case xzc = "XZC"
//        case yee = "YEE"
//        case yoc = "YOC"
//        case yoyow = "YOYOW"
//        case zbc = "ZBC"
//        case zcl = "ZCL"
//        case zec = "ZEC"
//        case zen = "ZEN"
//        case zil = "ZIL"
//        case zny = "ZNY"
//        case zrx = "ZRX"
//        case zsc = "ZSC"
//    }
//}
//
//struct The611: Codable {
//    var symbol: String?
//    var name: String?
//
//    enum CodingKeys: String, CodingKey {
//        case symbol = "shortName"
//        case name
//    }
//}
//
//struct Apc: Codable {
//    var symbol: String?
//    var name: String?
//
//    enum CodingKeys: String, CodingKey {
//        case symbol = "shortName"
//        case name
//    }
//}
