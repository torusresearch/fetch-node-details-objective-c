import CommonSources

let SAPPHIRE_NETWORK_URLS: [SapphireNetwork: [String]] = [
    .SAPPHIRE_DEVNET: [
        "https://sapphire-dev-2-1.authnetwork.dev",
        "https://sapphire-dev-2-2.authnetwork.dev",
        "https://sapphire-dev-2-3.authnetwork.dev",
        "https://sapphire-dev-2-4.authnetwork.dev",
        "https://sapphire-dev-2-5.authnetwork.dev",
    ],
    .SAPPHIRE_MAINNET: [
        "https://sapphire-1.auth.network",
        "https://sapphire-2.auth.network",
        "https://sapphire-3.auth.network",
        "https://sapphire-4.auth.network",
        "https://sapphire-5.auth.network",
    ],
]

func getSSSEndpoints(network: TorusNetwork) throws -> [String] {
    switch network {
        case .sapphire(let network) :
            
            guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
                fatalError("Unsupported network: \(network)")
            }
            
            return endpoints.map { "\($0)/sss/jrpc" }
        case .legacy(let network ) :
            let routeIdentifier = network.migration_map
                    
            guard let endpoints = SAPPHIRE_NETWORK_URLS[routeIdentifier.networkMigratedTo] else {
                throw FetchNodeError.InvalidMigrationNetwork(routeIdentifier.networkMigratedTo.path)
            }
        
            if ( routeIdentifier.migrationCompleted) {
                return endpoints.map{ "\($0)/sss/\(routeIdentifier.networkIdentifier)/jrpc" };
            } else {
                return endpoints.map { "\($0)/sss/jrpc" }
            }
    }
}

func getRSSEndpoints(network: TorusNetwork) throws -> [String] {
    switch network {
        case .sapphire(let network) :
            
            guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
                fatalError("Unsupported network: \(network)")
            }
            
            return endpoints.map { "\($0)/rss" }
        case .legacy(let network ) :
            let routeIdentifier = network.migration_map
        
            guard let endpoints = SAPPHIRE_NETWORK_URLS[routeIdentifier.networkMigratedTo] else {
                throw FetchNodeError.InvalidMigrationNetwork(routeIdentifier.networkMigratedTo.path)
            }
            if ( routeIdentifier.migrationCompleted) {
                return endpoints.map{ "\($0)/rss/\(routeIdentifier.networkIdentifier)" };
            }
            return endpoints.map { "\($0)/rss" }
            
    }
}

func getTSSEndpoints(network: TorusNetwork) throws -> [String] {
    switch network {
        case .sapphire(let network) :
            
            guard let endpoints = SAPPHIRE_NETWORK_URLS[network] else {
                fatalError("Unsupported network: \(network)")
            }
            
            return endpoints.map { "\($0)/tss" }
        case .legacy(let network ) :
            let routeIdentifier = network.migration_map
        
            guard let endpoints = SAPPHIRE_NETWORK_URLS[routeIdentifier.networkMigratedTo] else {
                throw FetchNodeError.InvalidMigrationNetwork(routeIdentifier.networkMigratedTo.path)
            }
            if ( routeIdentifier.migrationCompleted) {
                return endpoints.map{ "\($0)/tss/\(routeIdentifier.networkIdentifier)" };
            }
            return endpoints.map { "\($0)/tss" }
    }
}



