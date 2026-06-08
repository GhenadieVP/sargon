use crate::prelude::*;

// ==================
// Get an instance of the GatewayClient
// ==================
impl SargonOS {
    /// Returns a new instance if the `GatewayClient` on the provided `network_id`.
    pub fn gateway_client_with(&self, gateway: Gateway) -> GatewayClient {
        GatewayClient::new(self.http_client.clone(), gateway)
    }

    /// Returns a new instance if the `GatewayClient` on the current network's
    /// gateway.
    pub fn gateway_client(&self) -> GatewayClient {
        let gateway = self.current_gateway();
        self.gateway_client_with(gateway)
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use actix_rt::time::timeout;

    #[allow(clippy::upper_case_acronyms)]
    type SUT = SargonOS;

    #[actix_rt::test]
    pub async fn gateway_client_is_in_correct_network() {
        // ARRANGE
        let sut = SUT::fast_boot().await;

        // ACT
        let client = sut.gateway_client();

        // ASSERT
        assert_eq!(client.network_id(), NetworkID::Mainnet)
    }

    #[actix_rt::test]
    pub async fn gateway_client_is_in_correct_network_when_changing_gateway_in_profile(
    ) {
        // ARRANGE
        let sut = SUT::fast_boot().await;
        sut.change_current_gateway(Gateway::stokenet())
            .await
            .unwrap();

        // ACT
        let client = sut.gateway_client();

        // ASSERT
        assert_eq!(client.gateway.network.id, NetworkID::Stokenet)
    }

    #[actix_rt::test]
    pub async fn default_gateway_client_is_returned_when_profile_is_not_present(
    ) {
        // ARRANGE
        let test_drivers = Drivers::test();
        let mut clients = Clients::new(Bios::new(test_drivers));
        clients.factor_instances_cache =
            FactorInstancesCacheClient::in_memory();

        let interactors = Interactors::new_from_clients(&clients);
        let sut =
            SUT::boot_with_clients_and_interactor(clients, interactors).await;

        // ACT
        let client = sut.gateway_client();

        // ASSERT
        assert_eq!(client.network_id(), NetworkID::Mainnet)
    }
}
