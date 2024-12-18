# Sheet Music NFT Marketplace

## Description

The Sheet Music NFT Marketplace is a decentralized application (dApp) built on the Stacks blockchain. It allows musicians and composers to mint, list, and sell their sheet music as Non-Fungible Tokens (NFTs). Buyers can purchase these unique digital assets, supporting artists directly while gaining ownership of exclusive sheet music.

## Technologies Used

- Clarity: Smart contract language for the Stacks blockchain
- TypeScript: For testing and frontend development
- Vitest: Testing framework
- Stacks.js: JavaScript library for interacting with the Stacks blockchain

## Installation

1. Clone the repository:
```

git clone [https://github.com/yourusername/sheet-music-nft-marketplace.git](https://github.com/yourusername/sheet-music-nft-marketplace.git)
cd sheet-music-nft-marketplace

```plaintext

2. Install dependencies:
```

yarn install

```plaintext

## Usage

### Smart Contract

The smart contract is located in `contracts/sheet-music-nft.clar`. It provides the following main functions:

- `mint`: Create a new sheet music NFT
- `list-for-sale`: List an owned NFT for sale
- `buy`: Purchase a listed NFT
- `get-token-metadata`: Retrieve metadata for a specific NFT
- `get-listing-price`: Get the listing price of an NFT

### Testing

Run the tests using:

```

yarn test

```plaintext

This will execute the Vitest test suite located in `tests/sheet-music-nft.test.ts`.

## Project Structure

```

sheet-music-nft-marketplace/
├── contracts/
│   └── sheet-music-nft.clar
├── tests/
│   └── sheet-music-nft.test.ts
├── package.json
└── README.md

```plaintext

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License.