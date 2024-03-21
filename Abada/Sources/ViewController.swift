import UIKit
import AbadaDI
import AbadaCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        AbadaDI.test()
        Constants.test()
    }

}
