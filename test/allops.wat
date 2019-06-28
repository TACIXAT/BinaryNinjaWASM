;; nicked from wabt
;; modified to include all core opcodes

(module
  (start 3)
  (data 0 (offset i32.const 50) "hack the planet!")
  (import "host" "print" (func $print (param i32)))
  (type $empty (func))
  (func $empty)
  (memory 1 1)
  (table anyfunc (elem $empty $empty))
  (global $g (mut i32) (i32.const 0))

  (; 0x00 ;) (func (export "unreachable") unreachable)
  (; 0x01 ;) (func (export "nop") nop)
  (; 0x02 ;) 
  (func (export "block") (result i32)
    block (result i32)
    i32.const 1
    end
  )
  (; 0x03 ;) 
  (func (export "loop") (param $x i32)
    loop $inf
    i32.const 5
    set_local $x
    br 0
    end
  )
  (; 0x04 ;) 
  (func (export "if") (param $x i32)
    i32.const 69
    set_local $x
    get_local $x
    if 
    i32.const 5
    set_local $x
    end
  )
  (; 0x05 ;) 
  (func (export "else") (param $x i32)
    i32.const 69
    set_local $x
    get_local $x
    if 
    i32.const 5
    set_local $x
    else
    i32.const 10
    set_local $x
    end
  )
  (; 0x0b ;) (func (export "end") (; end ;) )
  (; 0x0c ;) (func (export "br") br 0)
  (; 0x0d ;) 
  (func (export "br_if") (param $x i32)
    i32.const 5
    set_local $x
    loop $inf
    get_local $x
    i32.const -1
    i32.add
    set_local $x
    get_local $x
    br_if 0
    end
  )
  (; 0x0e ;) (func (export "br_table") i32.const 1 br_table 0)
  (; 0x0f ;) (func (export "return") return)
  (; 0x10 ;) (func (export "call") call $empty)
  (; 0x11 ;) (func (export "call_indirect") i32.const 1 call_indirect (type $empty))

  (; 0x1a ;) (func (export "drop") i32.const 1 drop)
  (; 0x1b ;) (func (export "select") i32.const 1 i32.const 2 i32.const 3 select drop)
  (; 0x20 ;) (func (export "get_local") (local i32) get_local 0 drop)
  (; 0x21 ;) (func (export "set_local") (local i32) i32.const 1 set_local 0)
  (; 0x22 ;) (func (export "tee_local") (local i32) i32.const 1 tee_local 0 drop)
  (; 0x23 ;) (func (export "get_global") get_global 0 drop)
  (; 0x24 ;) (func (export "set_global") i32.const 1 set_global 0)
  (; 0x28 ;) (func (export "i32.load") i32.const 1 i32.load offset=2 drop)
  (; 0x29 ;) (func (export "i64.load") i32.const 1 i64.load offset=2 drop)
  (; 0x2a ;) (func (export "f32.load") i32.const 1 f32.load offset=2 drop)
  (; 0x2b ;) (func (export "f64.load") i32.const 1 f64.load offset=2 drop)
  (; 0x2c ;) (func (export "i32.load8_s") i32.const 1 i32.load8_s offset=2 drop)
  (; 0x2d ;) (func (export "i32.load8_u") i32.const 1 i32.load8_u offset=2 drop)
  (; 0x2e ;) (func (export "i32.load16_s") i32.const 1 i32.load16_s offset=2 drop)
  (; 0x2f ;) (func (export "i32.load16_u") i32.const 1 i32.load16_u offset=2 drop)
  (; 0x30 ;) (func (export "i64.load8_s") i32.const 1 i64.load8_s offset=2 drop)
  (; 0x31 ;) (func (export "i64.load8_u") i32.const 1 i64.load8_u offset=2 drop)
  (; 0x32 ;) (func (export "i64.load16_s") i32.const 1 i64.load16_s offset=2 drop)
  (; 0x33 ;) (func (export "i64.load16_u") i32.const 1 i64.load16_u offset=2 drop)
  (; 0x34 ;) (func (export "i64.load32_s") i32.const 1 i64.load32_s offset=2 drop)
  (; 0x35 ;) (func (export "i64.load32_u") i32.const 1 i64.load32_u offset=2 drop)
  (; 0x36 ;) (func (export "i32.store") i32.const 1 i32.const 2 i32.store offset=2)
  (; 0x37 ;) (func (export "i64.store") i32.const 1 i64.const 2 i64.store offset=2)
  (; 0x38 ;) (func (export "f32.store") i32.const 1 f32.const 2 f32.store offset=2)
  (; 0x39 ;) (func (export "f64.store") i32.const 1 f64.const 2 f64.store offset=2)
  (; 0x3a ;) (func (export "i32.store8") i32.const 1 i32.const 2 i32.store8 offset=2)
  (; 0x3b ;) (func (export "i32.store16") i32.const 1 i32.const 2 i32.store16 offset=2)
  (; 0x3c ;) (func (export "i64.store8") i32.const 1 i64.const 2 i64.store8 offset=2)
  (; 0x3d ;) (func (export "i64.store16") i32.const 1 i64.const 2 i64.store16 offset=2)
  (; 0x3e ;) (func (export "i64.store32") i32.const 1 i64.const 2 i64.store32 offset=2)
  (; 0x3f ;) (func (export "current_memory") current_memory drop)
  (; 0x40 ;) (func (export "grow_memory") i32.const 1 grow_memory drop)
  (; 0x41 ;) (func (export "i32.const") i32.const 1 drop)
  (; 0x42 ;) (func (export "i64.const") i64.const 1 drop)
  (; 0x43 ;) (func (export "f32.const") f32.const 1 drop)
  (; 0x44 ;) (func (export "f64.const") f64.const 1 drop)
  (; 0x45 ;) (func (export "i32.eqz") i32.const 1 i32.eqz drop)
  (; 0x46 ;) (func (export "i32.eq") i32.const 1 i32.const 2 i32.eq drop)
  (; 0x47 ;) (func (export "i32.ne") i32.const 1 i32.const 2 i32.ne drop)
  (; 0x48 ;) (func (export "i32.lt_s") i32.const 1 i32.const 2 i32.lt_s drop)
  (; 0x49 ;) (func (export "i32.lt_u") i32.const 1 i32.const 2 i32.lt_u drop)
  (; 0x4a ;) (func (export "i32.gt_s") i32.const 1 i32.const 2 i32.gt_s drop)
  (; 0x4b ;) (func (export "i32.gt_u") i32.const 1 i32.const 2 i32.gt_u drop)
  (; 0x4c ;) (func (export "i32.le_s") i32.const 1 i32.const 2 i32.le_s drop)
  (; 0x4d ;) (func (export "i32.le_u") i32.const 1 i32.const 2 i32.le_u drop)
  (; 0x4e ;) (func (export "i32.ge_s") i32.const 1 i32.const 2 i32.ge_s drop)
  (; 0x4f ;) (func (export "i32.ge_u") i32.const 1 i32.const 2 i32.ge_u drop)
  (; 0x50 ;) (func (export "i64.eqz") i64.const 1 i64.eqz drop)
  (; 0x51 ;) (func (export "i64.eq") i64.const 1 i64.const 2 i64.eq drop)
  (; 0x52 ;) (func (export "i64.ne") i64.const 1 i64.const 2 i64.ne drop)
  (; 0x53 ;) (func (export "i64.lt_s") i64.const 1 i64.const 2 i64.lt_s drop)
  (; 0x54 ;) (func (export "i64.lt_u") i64.const 1 i64.const 2 i64.lt_u drop)
  (; 0x55 ;) (func (export "i64.gt_s") i64.const 1 i64.const 2 i64.gt_s drop)
  (; 0x56 ;) (func (export "i64.gt_u") i64.const 1 i64.const 2 i64.gt_u drop)
  (; 0x57 ;) (func (export "i64.le_s") i64.const 1 i64.const 2 i64.le_s drop)
  (; 0x58 ;) (func (export "i64.le_u") i64.const 1 i64.const 2 i64.le_u drop)
  (; 0x59 ;) (func (export "i64.ge_s") i64.const 1 i64.const 2 i64.ge_s drop)
  (; 0x5a ;) (func (export "i64.ge_u") i64.const 1 i64.const 2 i64.ge_u drop)
  (; 0x5b ;) (func (export "f32.eq") f32.const 1 f32.const 2 f32.eq drop)
  (; 0x5c ;) (func (export "f32.ne") f32.const 1 f32.const 2 f32.ne drop)
  (; 0x5d ;) (func (export "f32.lt") f32.const 1 f32.const 2 f32.lt drop)
  (; 0x5e ;) (func (export "f32.gt") f32.const 1 f32.const 2 f32.gt drop)
  (; 0x5f ;) (func (export "f32.le") f32.const 1 f32.const 2 f32.le drop)
  (; 0x60 ;) (func (export "f32.ge") f32.const 1 f32.const 2 f32.ge drop)
  (; 0x61 ;) (func (export "f64.eq") f64.const 1 f64.const 2 f64.eq drop)
  (; 0x62 ;) (func (export "f64.ne") f64.const 1 f64.const 2 f64.ne drop)
  (; 0x63 ;) (func (export "f64.lt") f64.const 1 f64.const 2 f64.lt drop)
  (; 0x64 ;) (func (export "f64.gt") f64.const 1 f64.const 2 f64.gt drop)
  (; 0x65 ;) (func (export "f64.le") f64.const 1 f64.const 2 f64.le drop)
  (; 0x66 ;) (func (export "f64.ge") f64.const 1 f64.const 2 f64.ge drop)
  (; 0x67 ;) (func (export "i32.clz") i32.const 1 i32.clz drop)
  (; 0x68 ;) (func (export "i32.ctz") i32.const 1 i32.ctz drop)
  (; 0x69 ;) (func (export "i32.popcnt") i32.const 1 i32.popcnt drop)
  (; 0x6a ;) (func (export "i32.add") i32.const 1 i32.const 2 i32.add drop)
  (; 0x6b ;) (func (export "i32.sub") i32.const 1 i32.const 2 i32.sub drop)
  (; 0x6c ;) (func (export "i32.mul") i32.const 1 i32.const 2 i32.mul drop)
  (; 0x6d ;) (func (export "i32.div_s") i32.const 1 i32.const 2 i32.div_s drop)
  (; 0x6e ;) (func (export "i32.div_u") i32.const 1 i32.const 2 i32.div_u drop)
  (; 0x6f ;) (func (export "i32.rem_s") i32.const 1 i32.const 2 i32.rem_s drop)
  (; 0x70 ;) (func (export "i32.rem_u") i32.const 1 i32.const 2 i32.rem_u drop)
  (; 0x71 ;) (func (export "i32.and") i32.const 1 i32.const 2 i32.and drop)
  (; 0x72 ;) (func (export "i32.or") i32.const 1 i32.const 2 i32.or drop)
  (; 0x73 ;) (func (export "i32.xor") i32.const 1 i32.const 2 i32.xor drop)
  (; 0x74 ;) (func (export "i32.shl") i32.const 1 i32.const 2 i32.shl drop)
  (; 0x75 ;) (func (export "i32.shr_s") i32.const 1 i32.const 2 i32.shr_s drop)
  (; 0x76 ;) (func (export "i32.shr_u") i32.const 1 i32.const 2 i32.shr_u drop)
  (; 0x77 ;) (func (export "i32.rotl") i32.const 1 i32.const 2 i32.rotl drop)
  (; 0x78 ;) (func (export "i32.rotr") i32.const 1 i32.const 2 i32.rotr drop)
  (; 0x79 ;) (func (export "i64.clz") i64.const 1 i64.clz drop)
  (; 0x7a ;) (func (export "i64.ctz") i64.const 1 i64.ctz drop)
  (; 0x7b ;) (func (export "i64.popcnt") i64.const 1 i64.popcnt drop)
  (; 0x7c ;) (func (export "i64.add") i64.const 1 i64.const 2 i64.add drop)
  (; 0x7d ;) (func (export "i64.sub") i64.const 1 i64.const 2 i64.sub drop)
  (; 0x7e ;) (func (export "i64.mul") i64.const 1 i64.const 2 i64.mul drop)
  (; 0x7f ;) (func (export "i64.div_s") i64.const 1 i64.const 2 i64.div_s drop)
  (; 0x80 ;) (func (export "i64.div_u") i64.const 1 i64.const 2 i64.div_u drop)
  (; 0x81 ;) (func (export "i64.rem_s") i64.const 1 i64.const 2 i64.rem_s drop)
  (; 0x82 ;) (func (export "i64.rem_u") i64.const 1 i64.const 2 i64.rem_u drop)
  (; 0x83 ;) (func (export "i64.and") i64.const 1 i64.const 2 i64.and drop)
  (; 0x84 ;) (func (export "i64.or") i64.const 1 i64.const 2 i64.or drop)
  (; 0x85 ;) (func (export "i64.xor") i64.const 1 i64.const 2 i64.xor drop)
  (; 0x86 ;) (func (export "i64.shl") i64.const 1 i64.const 2 i64.shl drop)
  (; 0x87 ;) (func (export "i64.shr_s") i64.const 1 i64.const 2 i64.shr_s drop)
  (; 0x88 ;) (func (export "i64.shr_u") i64.const 1 i64.const 2 i64.shr_u drop)
  (; 0x89 ;) (func (export "i64.rotl") i64.const 1 i64.const 2 i64.rotl drop)
  (; 0x8a ;) (func (export "i64.rotr") i64.const 1 i64.const 2 i64.rotr drop)
  (; 0x8b ;) (func (export "f32.abs") f32.const 1 f32.abs drop)
  (; 0x8c ;) (func (export "f32.neg") f32.const 1 f32.neg drop)
  (; 0x8d ;) (func (export "f32.ceil") f32.const 1 f32.ceil drop)
  (; 0x8e ;) (func (export "f32.floor") f32.const 1 f32.floor drop)
  (; 0x8f ;) (func (export "f32.trunc") f32.const 1 f32.trunc drop)
  (; 0x90 ;) (func (export "f32.nearest") f32.const 1 f32.nearest drop)
  (; 0x91 ;) (func (export "f32.sqrt") f32.const 1 f32.sqrt drop)
  (; 0x92 ;) (func (export "f32.add") f32.const 1 f32.const 2 f32.add drop)
  (; 0x93 ;) (func (export "f32.sub") f32.const 1 f32.const 2 f32.sub drop)
  (; 0x94 ;) (func (export "f32.mul") f32.const 1 f32.const 2 f32.mul drop)
  (; 0x95 ;) (func (export "f32.div") f32.const 1 f32.const 2 f32.div drop)
  (; 0x96 ;) (func (export "f32.min") f32.const 1 f32.const 2 f32.min drop)
  (; 0x97 ;) (func (export "f32.max") f32.const 1 f32.const 2 f32.max drop)
  (; 0x98 ;) (func (export "f32.copysign") f32.const 1 f32.const 2 f32.copysign drop)
  (; 0x99 ;) (func (export "f64.abs") f64.const 1 f64.abs drop)
  (; 0x9a ;) (func (export "f64.neg") f64.const 1 f64.neg drop)
  (; 0x9b ;) (func (export "f64.ceil") f64.const 1 f64.ceil drop)
  (; 0x9c ;) (func (export "f64.floor") f64.const 1 f64.floor drop)
  (; 0x9d ;) (func (export "f64.trunc") f64.const 1 f64.trunc drop)
  (; 0x9e ;) (func (export "f64.nearest") f64.const 1 f64.nearest drop)
  (; 0x9f ;) (func (export "f64.sqrt") f64.const 1 f64.sqrt drop)
  (; 0xa0 ;) (func (export "f64.add") f64.const 1 f64.const 2 f64.add drop)
  (; 0xa1 ;) (func (export "f64.sub") f64.const 1 f64.const 2 f64.sub drop)
  (; 0xa2 ;) (func (export "f64.mul") f64.const 1 f64.const 2 f64.mul drop)
  (; 0xa3 ;) (func (export "f64.div") f64.const 1 f64.const 2 f64.div drop)
  (; 0xa4 ;) (func (export "f64.min") f64.const 1 f64.const 2 f64.min drop)
  (; 0xa5 ;) (func (export "f64.max") f64.const 1 f64.const 2 f64.max drop)
  (; 0xa6 ;) (func (export "f64.copysign") f64.const 1 f64.const 2 f64.copysign drop)
  (; 0xa7 ;) (func (export "i32.wrap/i64") i64.const 1 i32.wrap/i64 drop)
  (; 0xa8 ;) (func (export "i32.trunc_s/f32") f32.const 1 i32.trunc_s/f32 drop)
  (; 0xa9 ;) (func (export "i32.trunc_u/f32") f32.const 1 i32.trunc_u/f32 drop)
  (; 0xaa ;) (func (export "i32.trunc_s/f64") f64.const 1 i32.trunc_s/f64 drop)
  (; 0xab ;) (func (export "i32.trunc_u/f64") f64.const 1 i32.trunc_u/f64 drop)
  (; 0xac ;) (func (export "i64.extend_s/i32") i32.const 1 i64.extend_s/i32 drop)
  (; 0xad ;) (func (export "i64.extend_u/i32") i32.const 1 i64.extend_u/i32 drop)
  (; 0xae ;) (func (export "i64.trunc_s/f32") f32.const 1 i64.trunc_s/f32 drop)
  (; 0xaf ;) (func (export "i64.trunc_u/f32") f32.const 1 i64.trunc_u/f32 drop)
  (; 0xb0 ;) (func (export "i64.trunc_s/f64") f64.const 1 i64.trunc_s/f64 drop)
  (; 0xb1 ;) (func (export "i64.trunc_u/f64") f64.const 1 i64.trunc_u/f64 drop)
  (; 0xb2 ;) (func (export "f32.convert_s/i32") i32.const 1 f32.convert_s/i32 drop)
  (; 0xb3 ;) (func (export "f32.convert_u/i32") i32.const 1 f32.convert_u/i32 drop)
  (; 0xb4 ;) (func (export "f32.convert_s/i64") i64.const 1 f32.convert_s/i64 drop)
  (; 0xb5 ;) (func (export "f32.convert_u/i64") i64.const 1 f32.convert_u/i64 drop)
  (; 0xb6 ;) (func (export "f32.demote/f64") f64.const 1 f32.demote/f64 drop)
  (; 0xb7 ;) (func (export "f64.convert_s/i32") i32.const 1 f64.convert_s/i32 drop)
  (; 0xb8 ;) (func (export "f64.convert_u/i32") i32.const 1 f64.convert_u/i32 drop)
  (; 0xb9 ;) (func (export "f64.convert_s/i64") i64.const 1 f64.convert_s/i64 drop)
  (; 0xba ;) (func (export "f64.convert_u/i64") i64.const 1 f64.convert_u/i64 drop)
  (; 0xbb ;) (func (export "f64.promote/f32") f32.const 1 f64.promote/f32 drop)
  (; 0xbc ;) (func (export "i32.reinterpret/f32") i32.const 1 f32.reinterpret/i32 drop)
  (; 0xbd ;) (func (export "f32.reinterpret/i32") f32.const 1 i32.reinterpret/f32 drop)
  (; 0xbe ;) (func (export "i64.reinterpret/f64") i64.const 1 f64.reinterpret/i64 drop)
  (; 0xbf ;) (func (export "f64.reinterpret/i64") f64.const 1 i64.reinterpret/f64 drop)
)