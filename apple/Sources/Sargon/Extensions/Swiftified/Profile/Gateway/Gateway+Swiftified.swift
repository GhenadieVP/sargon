import Foundation
import SargonUniFFI

// MARK: - Gateway + SargonModel
extension Gateway: SargonModel {}

// MARK: - Gateway + CustomStringConvertible
extension Gateway: CustomStringConvertible {
	public var description: String {
		toString()
	}
}

// MARK: - Gateway + Identifiable
extension Gateway: Identifiable {
	public typealias ID = URL
	public var id: ID {
		getID()
	}
}

extension Gateway {
	public var networkID: NetworkID {
		network.id
	}
}
