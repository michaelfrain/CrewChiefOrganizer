//
//  StaticAssets.swift
//  CrewChiefOrganizer
//
//  Created by Michael Frain on 8/12/16.
//  Copyright © 2016 Michael Frain. All rights reserved.
//

import UIKit

class StaticAssets {
    public static var penalties: [String] = ["BAT","BBW","BOB","CHB","CLP","CMT","DH","DOD","DOF","DOG","DPI","DSC","ENC","EQV","FBG","FBP","FFH","FHT","FMM","FSH","FST","GAD","GAI","GAM","HUR","IBB","IBK","ICS","IDP","IFD","IFK","IFP","IHR","IKB","ILF","ILH","ILM","ILS","ING","ISH","ISP","ITK","ITP","IWG","KCI","KIK","KOB","LEA","LEV","LPS","OFK","OH","OPI","PFH","RFH","RFK","RNH","RNK","ROB","RPS","RRK","SKE","SLW","TGT","TRP","UNR-BTH","UNR-BUT","UNR-HCT","UNR-HDP","UNR-HTF","UNR-LTO","UNR-LTP","UNR-OTH","UNS-ABL","UNS-BCH","UNS-DEA","UNS-GAI","UNS-LEV","UNS-NFA","UNS-OTH","UNS-RHT","UNS-STB","UNS-TAU","UNS-UFA"]
    
    public static var officials: [String] = ["R","U","H","L","F","S","B","C"]
    
    enum FoulingSide: Int16 {
        case Offense = 0, Defense, Kicking, Receiving
    }
    
    enum Result: Int16 {
        case Accepted = 0, Declined, Offset
    }
    
    public static let dateFormatter: DateFormatter = {
        let singleFormatter = DateFormatter()
        singleFormatter.dateStyle = .medium
        singleFormatter.timeStyle = .short
        return singleFormatter
    }()
}
