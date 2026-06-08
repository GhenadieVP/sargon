package com.radixdlt.sargon.extensions

import androidx.datastore.core.DataStore
import androidx.datastore.preferences.core.Preferences
import com.radixdlt.sargon.Gateway
import com.radixdlt.sargon.HomeCardsManager
import com.radixdlt.sargon.HomeCardsObserver
import com.radixdlt.sargon.annotation.KoverIgnore
import com.radixdlt.sargon.os.driver.AndroidNetworkingDriver
import com.radixdlt.sargon.os.homecards.HomeCardsStorageImpl
import okhttp3.OkHttpClient

@KoverIgnore
fun HomeCardsManager.Companion.init(
        okHttpClient: OkHttpClient,
        gateway: Gateway,
        dataStore: DataStore<Preferences>,
        observer: HomeCardsObserver
) =
        HomeCardsManager(
                networkingDriver = AndroidNetworkingDriver(client = okHttpClient),
                gateway = gateway,
                cardsStorage = HomeCardsStorageImpl(dataStore = dataStore),
                observer = observer
        )
