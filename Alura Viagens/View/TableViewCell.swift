//
//  TableViewCell.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 02/01/21.
//

import UIKit

class TableViewCell: UITableViewCell {


    @IBOutlet weak var labelTitulo: UILabel!
    @IBOutlet weak var labelQuantidadedeDias: UILabel!
    @IBOutlet weak var labelPreco: UILabel!
    @IBOutlet weak var imagemViagem: UIImageView!
    
    
    func configuraCelula(viagem:Viagem){
        labelTitulo.text = viagem.titulo
        labelQuantidadedeDias.text = viagem.quantidadeDeDias == 1 ? "1 dia" : "\(viagem.quantidadeDeDias) dias"
        labelPreco.text = "R$ \(viagem.preco)"
        imagemViagem.image = UIImage(named: viagem.caminhoDaImagem) // inserir imagem
        
        imagemViagem.layer.cornerRadius = 10 // arredondar cantos
        imagemViagem.layer.masksToBounds = true
    }
}
