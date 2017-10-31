This is a deployment script for use when using a seeded master - it will speed up deployment as a good chunk of the blockchain is already synced.

usage ./deployscript <fqdn>

It will…
Remove ZenCash Wallet and Create a new one with new Shielded Payment Address
Generate new SSL certificates for the FQDN provided
Remove the Secure Node Tracker Node setup so you can map this to a new server

