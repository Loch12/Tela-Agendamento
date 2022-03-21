//
//  Requests.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation

class Requests {
  static func loadJson(filename fileName: String) -> ReturnModel? {
      if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
          do {
              let data = try Data(contentsOf: url)
              let decoder = JSONDecoder()
              let jsonData = try decoder.decode(ReturnModel.self, from: data)
              return jsonData
          } catch {
              print("error:\(error)")
          }
      }
      return nil
  }
}
