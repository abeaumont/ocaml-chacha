#!/usr/bin/env ocaml
#directory "pkg"
#use "topfind"
#require "topkg"
#require "ocb-stubblr.topkg"
open Topkg
open Ocb_stubblr_topkg

let () =
  Pkg.describe "chacha" @@ fun _c ->
  Ok [
    Pkg.clib "libchacha-core.clib";
    Pkg.mllib "chacha.mllib";
    Pkg.test "chacha_tests"
  ]
