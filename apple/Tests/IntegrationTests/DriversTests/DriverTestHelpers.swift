import Foundation
import Sargon
import SargonUniFFI

extension HostInfoDriver where Self == AppleHostInfoDriver {
	static var shared: Self {
		AppleHostInfoDriver(appVersion: "0.0.0")
	}
}

#if DEBUG
extension SecureStorageDriver where Self == Insecure︕！TestOnly︕！Ephemeral︕！SecureStorage {
	static var shared: Self {
		Self(keychainService: "test")
	}
}

extension Drivers {
	static func withNetworking(_ networking: some NetworkingDriver) -> Drivers {
		Drivers(
			networking: networking,
			secureStorage: .shared,
			entropyProvider: .shared,
			hostInfo: .shared,
			logging: .shared,
			fileSystem: .shared,
			unsafeStorage: .shared,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}

	static func withSecureStorage(_ secureStorage: some SecureStorageDriver) -> Drivers {
		Drivers(
			networking: .shared,
			secureStorage: secureStorage,
			entropyProvider: .shared,
			hostInfo: .shared,
			logging: .shared,
			fileSystem: .shared,
			unsafeStorage: .shared,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}

	static func withEntropyProvider(_ entropyProvider: some EntropyProviderDriver) -> Drivers {
		Drivers(
			networking: .shared,
			secureStorage: .shared,
			entropyProvider: entropyProvider,
			hostInfo: .shared,
			logging: .shared,
			fileSystem: .shared,
			unsafeStorage: .shared,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}

	static func withHostInfo(_ hostInfo: some HostInfoDriver) -> Drivers {
		Drivers(
			networking: .shared,
			secureStorage: .shared,
			entropyProvider: .shared,
			hostInfo: hostInfo,
			logging: .shared,
			fileSystem: .shared,
			unsafeStorage: .shared,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}

	static func withLogging(_ logging: some LoggingDriver) -> Drivers {
		Drivers(
			networking: .shared,
			secureStorage: .shared,
			entropyProvider: .shared,
			hostInfo: .shared,
			logging: logging,
			fileSystem: .shared,
			unsafeStorage: .shared,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}

	static func withFileSystem(_ fileSystem: some FileSystemDriver) -> Drivers {
		Drivers(
			networking: .shared,
			secureStorage: .shared,
			entropyProvider: .shared,
			hostInfo: .shared,
			logging: .shared,
			fileSystem: fileSystem,
			unsafeStorage: .shared,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}

	static func withUnsafeStorage(_ unsafeStorage: some UnsafeStorageDriver) -> Drivers {
		Drivers(
			networking: .shared,
			secureStorage: .shared,
			entropyProvider: .shared,
			hostInfo: .shared,
			logging: .shared,
			fileSystem: .shared,
			unsafeStorage: unsafeStorage,
			profileStateChangeDriver: .shared,
			arculusCsdkDriver: ArculusCsdkDriverImpl(noPointer: .init()),
			nfcTagDriver: NfcTagDriverImpl(noPointer: .init())
		)
	}
}
#endif
