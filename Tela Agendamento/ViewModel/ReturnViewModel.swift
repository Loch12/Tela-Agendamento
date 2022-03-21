//
//  ReturnViewModel.swift
//  Tela Agendamento
//
//  Created by UpperSoft on 21/03/22.
//

import Foundation

struct ReturnViewModel {
  let name: String
  let cpf: String
  let birthday: String
  let cell: String
  let local: String
  let localCell: String
  let localCep: String
  let rua, numero, bairro, complemento, cidade, cep: String
  let nomeVacina: String
  let recomendacao: String
  let date: String


  var dateFormatted: String {
    return getFormattedDate(inputFormat: "yyyy-MM-dd HH:mm:ss", outputFormat: "dd/MM/yyyy", insertDate: self.date)
  }

  var hourFormatted: String {
    return getFormattedDate(inputFormat: "yyyy-MM-dd HH:mm:ss", outputFormat: "HH:mm", insertDate: self.date)
  }

  var birthdayFormatted: String {
    return getFormattedDate(inputFormat: "yyyy-MM-dd", outputFormat: "dd/MM/yyyy", insertDate: self.birthday)
  }

  var endereco: String {
    return "\(self.rua), \(self.numero) - \(self.bairro), \(self.cidade) - \(self.cep)"
  }

  init(returnModel: ReturnModel){
    self.name = returnModel.nome
    self.cpf = returnModel.cpf
    self.birthday = returnModel.data_nascimento
    self.date = returnModel.data
    self.cell = returnModel.telefone
    self.local = returnModel.unidade.nome
    self.localCell = returnModel.unidade.telefone ?? ""
    self.localCep = returnModel.unidade.endereco.cep
    self.rua = returnModel.unidade.endereco.logradouro
    self.numero = returnModel.unidade.endereco.numero
    self.bairro = returnModel.unidade.endereco.bairro
    self.complemento = returnModel.unidade.endereco.complemento
    self.cidade = returnModel.unidade.endereco.cidade
    self.cep = returnModel.unidade.endereco.cep
    self.nomeVacina = returnModel.servico.nome
    self.recomendacao = returnModel.servico.orientacoes
  }

  func getFormattedDate(inputFormat: String, outputFormat: String, insertDate: String) -> String {
    let dateFormatterGet = DateFormatter()
    dateFormatterGet.dateFormat = inputFormat

    let dateFormatterPrint = DateFormatter()
    dateFormatterPrint.dateFormat = outputFormat

    if let date = dateFormatterGet.date(from: insertDate) {
      return dateFormatterPrint.string(from: date)
    } else {
      print("There was an error decoding the string")
    }
    return insertDate
  }
}

