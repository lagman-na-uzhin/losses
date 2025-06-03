import XCTest
@testable import TodoApp

final class TodoViewModelTests: XCTestCase {

    func testInitialValues() async {
        await MainActor.run {
            let vm = TodoViewModel()
            XCTAssertEqual(vm.title, "")
            XCTAssertNil(vm.listID)
            XCTAssertEqual(vm.description, "")
            XCTAssertEqual(vm.priority, 0)
            XCTAssertFalse(vm.complete)
            XCTAssertFalse(vm.errorAlertShown)
            XCTAssertEqual(vm.errorMessage, "")
            XCTAssertFalse(vm.createComplete)
            XCTAssertFalse(vm.updateComplete)
        }
    }

    func testCreateTodo_withEmptyTitle_showsError() async {
        await MainActor.run {
            let vm = TodoViewModel()
            vm.title = ""
            vm.createTodo(token: "token")
            XCTAssertTrue(vm.errorAlertShown)
            XCTAssertEqual(vm.errorMessage, "Error: title cannot be empty")
            XCTAssertFalse(vm.createComplete)
        }
    }

    func testUpdateTodo_withEmptyTitle_showsError() async {
        await MainActor.run {
            let vm = TodoViewModel()
            vm.title = ""
            vm.updateTodo(itemID: 1, token: "token")
            XCTAssertTrue(vm.errorAlertShown)
            XCTAssertEqual(vm.errorMessage, "Error: title cannot be empty")
            XCTAssertFalse(vm.updateComplete)
        }
    }

    func testCreateTodo_withValidTitle_doesNotShowImmediateError() async {
        await MainActor.run {
            let vm = TodoViewModel()
            vm.title = "Valid Title"
            vm.createTodo(token: "token")
            XCTAssertFalse(vm.errorAlertShown)
            XCTAssertEqual(vm.errorMessage, "")
        }
    }
}

