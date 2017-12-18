#!/usr/bin/env ocaml
#directory "pkg"
#use "topfind"
#require "topkg"
#require "ocb-stubblr.topkg"
open Topkg
open Ocb_stubblr_topkg

let xen  = Conf.(key "xen" bool ~absent:false
                   ~doc:"Build Mirage/Xen support.")
let fs   = Conf.(key "freestanding" bool ~absent:false
                   ~doc:"Build Mirage/Solo5 support.")

let build = Pkg.build ~cmd ()

let () =
  Pkg.describe "chacha" ~build @@ fun c ->
  let xen  = Conf.value c xen
  and fs   = Conf.value c fs in
  Ok [
    Pkg.clib "libchacha-core.clib";
    Pkg.mllib "chacha.mllib";
    Pkg.test "chacha_tests";
    mirage ~xen ~fs "libchacha-core.clib";
  ]
