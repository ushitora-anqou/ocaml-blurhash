(lang dune 3.3)

(name blurhash)

(generate_opam_files true)

(source
 (github ushitora-anqou/ocaml-blurhash))

(authors "Ushitora Anqou")

(maintainers "Ushitora Anqou")

(license "MIT")

(package
 (name blurhash)
 (synopsis "A BlurHash encoder in OCaml")
 (description "A BlurHash encoder in OCaml")
 (depends
  (alcotest :with-test)
  (camlimages :with-test)
  dune
  (ocaml
   (and
    (>= 4.08.0)
    (< 5.0))))
 (tags (blurhash)))
