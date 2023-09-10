# ocaml-blurhash

A [Blurhash](https://blurha.sh/) encoder implementation written in OCaml.

[Documentation](https://ushitora-anqou.github.io/ocaml-blurhash/).

## Usage

The only function provided by ocaml-blurhash is `Blurhash.blur_hash_for_pixels`,
which takes the same arguments as `blurHashForPixels` in [the C reference implementation](https://github.com/woltapp/blurhash/tree/master/C).

```ocaml
val blur_hash_for_pixels :
  x_components:int ->
  y_components:int ->
  width:int ->
  height:int ->
  bytes_per_row:int ->
  string ->
  string
```

Although ocaml-blurhash does not depend on any image library,
you can use [camlimages](https://gitlab.com/camlspotter/camlimages) to load an image from a file.

```ocaml
let load_image_as_rgb24 ~path =
  match OImages.(load path [] |> tag) with
  | Rgb24 img -> img
  | Rgba32 img -> img#to_rgb24
  | Index8 img -> img#to_rgb24
  | Index16 img -> img#to_rgb24
  | Cmyk32 _ -> failwith "Not supported image type: Cmyk32"

let blurhash ~x_components ~y_components src =
  Blurhash.blur_hash_for_pixels ~x_components ~y_components ~width:src#width
    ~height:src#height ~bytes_per_row:(src#width * 3) (Bytes.to_string src#dump)

let test_encode_case1 () =
  let src = load_image_as_rgb24 ~path:"../../../test/test.png" in
  let hash = blurhash ~x_components:4 ~y_components:3 src in
  Alcotest.(check string) "test1" "LFE.@D9F01_2%L%MIVD*9Goe-;WB" hash;
  ()
```

## License

MIT
