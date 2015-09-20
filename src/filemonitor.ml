
type t = {
  name : string;
  stats : Unix.stats;
}

let init name = {
  name;
  stats = Unix.stat name;
}

let update t = init t.name

let differs t1 t2 =
  let open Unix in
  let t1 = t1.stats in
  let t2 = t2.stats in
  t1.st_mtime <> t2.st_mtime
     || t2.st_size <> t2.st_size
     || t2.st_ino <> t2.st_ino

let changed t =
  differs t (update t)

let write_t _ _ = ()
let read_t _ _ = raise Exit
    
