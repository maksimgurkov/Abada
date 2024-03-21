import UIKit
import AbadaDI
import AbadaCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        AbadaDI.test()
        Constants.test()
    }

}
