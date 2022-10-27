import BigInt
import FetchNodeDetails
import OSLog
import web3
import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10

    func test_getNode_MainNet() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails()
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputMainNet(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80").val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_custom_path_MainNet() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(network: .CUSTOM(path: "https://\("mainnet").infura.io/v3/\("7f287687b3d049e2bea7b64869ee30a3")"))
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputMainNet(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80").val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    
    // Ropsten deprecation test
    func test_getNode_custom_path_Ropsten() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7",network: .CUSTOM(path: "https://rpc.ankr.com/eth_ropsten"),urlSession: URLSession.shared)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputRopsten(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7").val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_Polygon() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005", network: .POLYGON)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputPolygon(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005").val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
}
