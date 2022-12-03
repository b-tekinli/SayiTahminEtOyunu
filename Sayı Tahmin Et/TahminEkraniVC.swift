import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textfieldGirdi: UITextField!
    
    var rasgeleSayi:Int?
    var kalanHak = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rasgeleSayi = Int.random(in: 0...100)
        
        print("Rasgele Sayı : \(rasgeleSayi!)")

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool {
            let gidilecekVC = segue.destination as! SonucEkraniVC
            
            gidilecekVC.sonuc = gelenVeri
            
        }
        
    }

    @IBAction func tahminet(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak -= 1
        
        if let veri = textfieldGirdi.text {
            
            if let tahmin = Int(veri) {
                
                if tahmin == rasgeleSayi! {
                    let sonuc = true
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                    return
                }
                
                if tahmin > rasgeleSayi! {
                    labelYardim.text = "Azalt"
                    labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
               
                if tahmin < rasgeleSayi! {
                    labelYardim.text = "Arttır"
                    labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
                
                if(kalanHak == 0) {
                    let sonuc = false
                    performSegue(withIdentifier: "tahminTosonuc", sender: sonuc)
                }
                
                textfieldGirdi.text = ""
            }
        }
    }
}
