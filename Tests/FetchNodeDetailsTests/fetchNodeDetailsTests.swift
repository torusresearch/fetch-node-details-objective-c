@testable import FetchNodeDetails
import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10
    var verifierId = "hello@tor.us"
    func test_getNode_Mainnet() async {
        let fnd = FetchNodeDetails(network: TORUS_NETWORK["MAINNET"] ?? "")
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputMainnet().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    // TODO: make custom network run
//    func test_getNode_custom_path_Mainnet() async {
//        let fnd = FetchNodeDetails(network: .CUSTOM(path: "https://\("mainnet").infura.io/v3/\("7f287687b3d049e2bea7b64869ee30a3")"))
//        do {
//            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
//            XCTAssertEqual(result, SampleOutputMainnet().val)
//        } catch {
//            XCTFail()
//        }
//    }

    func test_getNode_Testnet() async {
        let fnd = FetchNodeDetails(network: TORUS_NETWORK["TESTNET"] ?? "")
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputTestnet().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_getNode_SapphireDevnet() async {
        let fnd = FetchNodeDetails(network: TORUS_NETWORK["SAPPHIRE_DEVNET"] ?? "")
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputSAPPHIREDEVNET().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    // TODO: clarify the correct endpoint
    func test_getNode_SapphireTestnet() async {
        let fnd = FetchNodeDetails(network: TORUS_NETWORK["SAPPHIRE_TESTNET"] ?? "")
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputSAPPHIRETESTNET().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_getNode_SapphireMainnet() async {
        let fnd = FetchNodeDetails(network: TORUS_NETWORK["SAPPHIRE_MAINNET"] ?? "")
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputSAPPHIREMAINNET().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
