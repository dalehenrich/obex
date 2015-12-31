other
_struct
"
class ObjHdrSType {
	OopType			objId;
	uint64				_classSegWord;		// hex digit usage:   uu|cc|cc|cc|cc|cc|ss|ss
														//  u = unused always zero, s = segmentId, c = oopNumber of objClass 
	short					length;					// number of instVars in the object, negated  number of node refs in large obj root node   
	unsigned short	gcSize;					// number of oop instVars plus user defined tags
														// in a byte object may be 0, 1 or 2 for the tags, and  the bytes will start after the last tag .
	unsigned short	physSize;
	
	// 16 bits worth of bit fields
#if defined(FLG_LOW_BITS)
	// following bits common to Disk and Ram representations
	unsigned int 	_is_oops					: 1;		// true means not a OC_FORMAT_BYTES obj; always true in lrg obj root nodes .
	unsigned int 	_is_class				: 1;
	unsigned int 	_levels					: 2;		// > 0 means root node of a large object
	unsigned int 	_old_lrg_fanout		: 1;		// true if large object root came from 1.1
	// following fields unique to Disk representation
	unsigned int 	_specialLoad			: 1;		// see comments below
	unsigned int 	_is_nsc					: 1;		// true on root nodes of nscs
	unsigned int 	_isInvariant			: 1;
	unsigned int 	_tranlog_has_dep	: 1;		// only valid in tranlog records
	unsigned int 	_isNewObj				: 1;		// true only on flush to create new lifetime
	unsigned int 	_dbTransient			: 1;
	unsigned int 	_unusedBits			: 5;
#else 
	unsigned int _unusedBits : 5;
	unsigned int _dbTransient: 1;
	unsigned int _isNewObj    : 1;
	unsigned int _tranlog_has_dep : 1;
	unsigned int _isInvariant : 1;
	unsigned int _is_nsc      : 1 ;
	unsigned int _specialLoad : 1;
	unsigned int _old_lrg_fanout : 1;
	unsigned int _levels   : 2;
	unsigned int _is_class  : 1;
	unsigned int _is_oops     : 1;
	#endif
}"
