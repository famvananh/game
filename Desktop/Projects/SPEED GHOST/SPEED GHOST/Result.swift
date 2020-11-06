//
//  ListOfCars.swift
//  SPEED GHOST
//
//  Created by Fam Van Anh on 9/30/20.
//  Copyright © 2020 Fam Van Anh. All rights reserved.
//

import Foundation

class Result : Codable {
    
    var name :String?
    var score :Int?
    var date: String?
    
    private enum CodingKeys: String,CodingKey{
        case name
        case score
        case date
    }
    init (name:String? ,score : Int = 0, date:String? ){
        self.name = name
        self.score = score
        self.date = date
    }
    required public init(from decoder: Decoder) throws {
          let container = try decoder.container(keyedBy: CodingKeys.self)

        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.score = try container.decode(Int.self, forKey: .score)
        self.date = try container.decodeIfPresent(String.self, forKey: .date)
      }

      public func encode(to encoder: Encoder) throws {
          var container = encoder.container(keyedBy: CodingKeys.self)

          try container.encode(self.name, forKey: .name)
          try container.encode(self.score, forKey: .score)
          try container.encode(self.date, forKey: .date)
        
      }
}

