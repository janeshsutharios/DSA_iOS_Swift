import UIKit



class A {
    var b: B!

    deinit {
        print("deinit of A")
    }
}

class B {
    var a: A!

    deinit {
        print("deinit of B")
    }
}

do {
    let a = A()
    let b = B()
    a.b = b
    b.a = a
}
