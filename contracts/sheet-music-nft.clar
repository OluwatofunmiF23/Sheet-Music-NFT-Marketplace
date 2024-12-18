;; Sheet Music NFT Marketplace

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-token-owner (err u101))
(define-constant err-listing-not-found (err u102))

;; Data variables
(define-data-var last-token-id uint u0)

;; NFT definitions
(define-non-fungible-token sheet-music-nft uint)

;; Maps
(define-map token-metadata uint 
  { title: (string-ascii 50), 
    composer: (string-ascii 50), 
    price: uint }
)

(define-map listings uint uint)

;; Mint new sheet music NFT
(define-public (mint (title (string-ascii 50)) (composer (string-ascii 50)) (price uint))
  (let ((token-id (+ (var-get last-token-id) u1)))
    (try! (nft-mint? sheet-music-nft token-id tx-sender))
    (map-set token-metadata token-id { title: title, composer: composer, price: price })
    (var-set last-token-id token-id)
    (ok token-id)
  )
)

;; List sheet music NFT for sale
(define-public (list-for-sale (token-id uint) (price uint))
  (let ((owner (unwrap! (nft-get-owner? sheet-music-nft token-id) err-not-token-owner)))
    (asserts! (is-eq tx-sender owner) err-not-token-owner)
    (map-set listings token-id price)
    (ok true)
  )
)

;; Buy sheet music NFT
(define-public (buy (token-id uint))
  (let (
    (price (unwrap! (map-get? listings token-id) err-listing-not-found))
    (owner (unwrap! (nft-get-owner? sheet-music-nft token-id) err-not-token-owner))
  )
    (try! (stx-transfer? price tx-sender owner))
    (try! (nft-transfer? sheet-music-nft token-id owner tx-sender))
    (map-delete listings token-id)
    (ok true)
  )
)

;; Get token metadata
(define-read-only (get-token-metadata (token-id uint))
  (map-get? token-metadata token-id)
)

;; Get listing price
(define-read-only (get-listing-price (token-id uint))
  (map-get? listings token-id)
)