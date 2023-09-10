(lang dune 3.3)

(name blurhash)

(generate_opam_files true)

(source
 (github ushitora-anqou/ocaml-blurhash))

(authors "Ushitora Anqou")

(maintainers "Ushitora Anqou")

(license "MIT")

(documentation https://github.com/ushitora-anqou/ocaml-blurhash)

(package
 (name blurhash)
 (synopsis "A BlurHash encoder in OCaml")
 (description "A BlurHash encoder in OCaml")
 (depends
  (alcotest :with-test)
  (camlimages :with-test)
  dune
  (ocaml
   (< 5.0)))
 (tags (blurhash)))
