val blur_hash_for_pixels :
  x_components:int ->
  y_components:int ->
  width:int ->
  height:int ->
  bytes_per_row:int ->
  bytes ->
  string
(** [blur_hash_for_pixels ~x_components ~y_components ~width ~height ~bytes_per_row pixels]
    returns the blur hash for the given pixels. The pixels are expected to be in RGB(A)
    format. *)
