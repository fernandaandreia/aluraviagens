//
//  DetalhesViagemViewController.swift
//  Alura Viagens
//
//  Created by Fernanda Andreia Nascimento on 03/01/21.
//

import UIKit

class DetalhesViagemViewController: UIViewController {

    @IBOutlet weak var imagemPacoteViagem: UIImageView!
    @IBOutlet weak var labelTituloPacoteViagem: UILabel!
    @IBOutlet weak var labelDescricaoPacoteViagem: UILabel!
    @IBOutlet weak var labelDataViagem: UILabel!
    @IBOutlet weak var labelPrecoPacoteViagem: UILabel!
    
    @IBAction func botaoVoltar(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var scrollPrincipal: UIScrollView!
    
    
    @IBAction func botaoFinalizarCompra(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "confirmacaoPagamento") as! ConfirmacaoPagamentoViewController
        controller.pacoteComprado = pacoteSelecionado
        self.present(controller, animated: true, completion: nil)
    }
    
    var pacoteSelecionado:PacoteViagem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        NotificationCenter.default.addObserver(self, selector: #selector (aumentarScroll(Notification:)), name: .UIKeyboardWillShow, object: nil)

        if let pacote = pacoteSelecionado {
            self.imagemPacoteViagem.image = UIImage(named: pacote.viagem.caminhoDaImagem)
            self.labelTituloPacoteViagem.text = pacote.viagem.titulo
            self.labelDescricaoPacoteViagem.text = pacote.descricao
            self.labelDataViagem.text = pacote.dataViagem
//            self.labelPrecoPacoteViagem = pacote.viagem.preco

        }
        func aumentarScroll(notification: Notification){
//            print("Teste teclado")
            self.scrollPrincipal.contentSize = CGSize(width: self.scrollPrincipal.frame.width, height: self.scrollPrincipal.frame.height + 320)
        }
    
        func exibeDataTextField(sender: UIDatePicker){
            let formatador = DateFormatter()
            formatador.dateFormat = "dd MM yyy"
            self.textFieldData.text = formatador.string(from: sender.date)
        }
    
    

    @IBAction func textEntrouEmFoco(_ sender: UITextField) {
//        print("teclado entrou em foco")
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(exibeDataTextField(sender:)), for: .valueChanged)
}
   
    
    
    }
