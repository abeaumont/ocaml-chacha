(** {{:https://cr.yp.to/chacha/chacha-20080120.pdf} ChaCha, a variant of Salsa20}
    specifies a ChaCha20 encryption function as well as a set of
    reduced Chacha8 and Chacha12 encryption functions. *)

type t
(** Type of ChaCha state. *)

module ChaCha20 : sig
  val create : Cstruct.t -> Cstruct.t -> t
  (** [create key nonce] is [state],
      the ChaCha20 encryption/decryption function state.
      It's a shortcout for ChaCha20.create
      [key] is either a 32 (recommended) or 16 bytes.
      [nonce] is 8 bytes.
      @raise Invalid_argument if [key] or [nonce] is not of the correct size *)
end

module ChaCha12 : sig
  val create : Cstruct.t -> Cstruct.t -> t
  (** [create key nonce] is [state],
      the ChaCha12 encryption/decryption function state.
      It's a shortcout for ChaCha20.create
      [key] is either a 32 (recommended) or 16 bytes.
      [nonce] is 8 bytes.
      @raise Invalid_argument if [key] or [nonce] is not of the correct size *)
end

module ChaCha8 : sig
  val create : Cstruct.t -> Cstruct.t -> t
  (** [create key nonce] is [state],
      the ChaCha8 encryption/decryption function state.
      It's a shortcout for ChaCha20.create
      [key] is either a 32 (recommended) or 16 bytes.
      [nonce] is 8 bytes.
      @raise Invalid_argument if [key] or [nonce] is not of the correct size *)
end

val create : Cstruct.t -> Cstruct.t -> t
(** [create key nonce] is [state],
    the ChaCha20 encryption/decryption function state.
    It's a shortcout for ChaCha20.create
    [key] is either a 32 (recommended) or 16 bytes.
    [nonce] is 8 bytes.
    @raise Invalid_argument if [key] or [nonce] is not of the correct size *)

val encrypt: Cstruct.t -> t -> Cstruct.t
(** [encrypt input state] is [output], the ChaCha encryption function. *)

val decrypt: Cstruct.t -> t -> Cstruct.t
(** [encrypt input state] is [output], the ChaCha decryption function. *)
