// https://github.com/Quick/Quick

import Quick
import Nimble
import TinyLayout

class TableOfContentsSpec: QuickSpec {
    override func spec() {
        context("these will pass") {

            it("can do maths") {
                expect(23) == 23
            }

            it("can read") {
                expect("🐮") == "🐮"
            }

            it("will eventually pass") {
                var time = "passing"

                DispatchQueue.main.async {
                    time = "done"
                }

                waitUntil { done in
                    Thread.sleep(forTimeInterval: 0.5)
                    expect(time) == "done"

                    done()
                }
            }
        }
    }
}
